(use-modules (gnu)
             (gnu services)
             (gnu system nss)
             (guix gexp)
	     (gnu packages linux)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules desktop
                     desktop-extra
                     networking
                     virtualization
                     avahi
                     dbus
                     pm
                     guix)

(use-package-modules bootloaders
                     certs
                     shells)

(define %base-services-custom
  (modify-services %base-services
                   (guix-service-type config =>
                                      (guix-configuration
                                       (inherit config)
                                       (discover? #t)))))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (host-name "lem")
  (timezone "America/Los_Angeles")
  (locale "en_US.utf8")

  (bootloader
   (bootloader-configuration
    (bootloader grub-efi-bootloader)
    (targets '("/boot/efi"))))

  (file-systems
   (cons* (file-system
            (device (uuid "7eec5fac-1d6c-4a45-bb5f-0716b55d67de"))
            (mount-point "/")
            (type "ext4"))
          (file-system
            (device (uuid "ECC7-A74E" 'fat))
            (mount-point "/boot/efi")
            (type "vfat"))
          %base-file-systems))

  (users
   (cons* (user-account
           (name "john")
           (shell (file-append zsh "/bin/zsh"))
           (group "users")
           (supplementary-groups
            '("wheel" "netdev" "libvirt" "kvm" "lp" "audio" "video")))
          %base-user-accounts))

  (packages
   (cons*
    ;; for HTTPS access
    nss-certs
    ntfs-3g
    %base-packages))

  (services
   (cons*
    (service sane-service-type)
    polkit-wheel-nopass-service
    fontconfig-file-system-service
    (service wpa-supplicant-service-type)
    (service network-manager-service-type)
    (bluetooth-service)

    (service avahi-service-type)
    (udisks-service)
    (service upower-service-type)
    (service polkit-service-type)
    (elogind-service)
    (dbus-service)

    (service ntp-service-type)

    (service libvirt-service-type
             (libvirt-configuration
              (unix-sock-group "libvirt")
	      (unix-sock-rw-perms "0777")))
    (service virtlog-service-type)

    (service thermald-service-type)
    (service tlp-service-type
             (tlp-configuration
              (sched-powersave-on-bat? #t)
              (sched-powersave-on-ac? #t)))

    (service guix-publish-service-type
             (guix-publish-configuration
              (advertise? #t)
              (host "0.0.0.0")))

    %base-services-custom))

  (name-service-switch %mdns-host-lookup-nss))
