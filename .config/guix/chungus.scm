(use-modules (gnu)
             (gnu services)
             (gnu system nss)
             (guix gexp)
	           (gnu packages linux)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules desktop
                     desktop-extra
                     linux
                     ssh
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
                                       (discover? #t)
                                       (authorized-keys
                                        (cons* (local-file "./lem.pub")
                                               %default-authorized-guix-keys))))))


(define v4l-loopback-config
  (plain-file "v4l-loopback.conf"
              "options v4l2loopback exclusive_caps=1 card_label=VirtualVideoDevice"))


(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (kernel-loadable-modules (list v4l2loopback-linux-module))

  (host-name "chungus")
  (timezone "America/Los_Angeles")
  (locale "en_US.utf8")

  (bootloader
   (bootloader-configuration
    (bootloader grub-bootloader)
    (targets '("/dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S3Z1NB0K105153X"))))

  (file-systems
   (cons* (file-system
            (device (uuid "0d5536ab-69be-4234-84df-e1d9c66598d3"))
            (mount-point "/")
            (type "ext4"))
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
    (service kernel-module-loader-service-type
             '("v4l2loopback"))
    (simple-service 'v4l-loopback-config etc-service-type
                    (list `("modprobe.d/v4l-loopback.conf"
                            ,v4l-loopback-config)))
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
              (sched-powersave-on-ac? #t)
              (cpu-boost-on-bat? #f)))

    (service openssh-service-type)

    (service guix-publish-service-type
             (guix-publish-configuration
              (advertise? #f)))

    %base-services-custom))

  (name-service-switch %mdns-host-lookup-nss))
