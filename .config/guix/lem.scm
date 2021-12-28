(use-modules (gnu)
             (gnu services)
             (gnu system nss)
             (nongnu packages linux)
             (nongnu system linux-initrd))

(use-service-modules desktop
                     networking
                     avahi
                     dbus)
(use-package-modules bootloaders
                     certs
                     shells)

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
           (shell zsh)
           (group "users")
           (supplementary-groups
            '("wheel" "netdev" "lp" "audio" "video")))
          %base-user-accounts))

  (packages
   (cons*
    ;; for HTTPS access
    nss-certs
    %base-packages))

  (services
   (cons*
    (service sane-service-type)
    polkit-wheel-service
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

    %base-services))

  (name-service-switch %mdns-host-lookup-nss))
