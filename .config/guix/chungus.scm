(use-modules (guix gexp)
             (gnu system file-systems)
             (gnu system setuid)
             (gnu)
             (gnu services)
             (gnu system nss)
	           (gnu packages linux)
             (nongnu packages linux)
             (nongnu system linux-initrd)
             (jsullivan guix-util))

(use-service-modules desktop cups desktop-extra linux linux-extra ssh networking
                     virtualization docker avahi dbus pam-mount pm guix)

(use-package-modules bootloaders certs shells)

(define %base-services-custom
  (modify-services
   %base-services
   (mingetty-service-type config =>
                          (auto-login-to-tty config "tty1" "john"))
   (guix-service-type config =>
                      (guix-configuration
                       (inherit config)
                       (discover? #t)))))

(define modprobe-service
  (service modprobe-service-type
           `((,v4l2loopback-linux-module
              (("exclusive_caps" "1")
               ("card_label" "VirtualVideoDevice"))))))

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list linux-firmware))

  (host-name "chungus")
  (timezone "America/Los_Angeles")
  (locale "en_US.utf8")

  (bootloader
   (bootloader-configuration
    (bootloader grub-bootloader)
    (terminal-outputs '(console))
    (targets '("/dev/disk/by-id/ata-Samsung_SSD_860_EVO_500GB_S3Z1NB0K105153X"))))

  (file-systems
   (append (list (file-system
                   (device (uuid "0d5536ab-69be-4234-84df-e1d9c66598d3"))
                   (mount-point "/")
                   (type "ext4"))
                 xdg-rundir-file-system)
           %control-groups
           %base-file-systems))

  (users
   (cons* (user-account
           (name "john")
           (shell (file-append zsh "/bin/zsh"))
           (group "users")
           (supplementary-groups
            '("wheel" "netdev" "docker" "libvirt" "kvm" "lp" "audio" "video")))
          %base-user-accounts))

  (packages
   (cons*
    ;; for HTTPS access
    nss-certs
    ntfs-3g
    %base-packages))

  (sudoers-file
   (plain-file "sudoers" "\
root ALL=(ALL) ALL
%wheel ALL = NOPASSWD: ALL"))

  (setuid-programs
    (append
      (list (file-like->setuid-program
	      (file-append
		(specification->package "swaylock")
		"/bin/swaylock")))
      %setuid-programs))

  (services
   (cons*
    modprobe-service

    (service polkit-service-type)
    polkit-wheel-nopass-service
    xdg-rundir-user-mount-service
    seatd-service
    (dbus-service)

    (service ntp-service-type)
    (service sane-service-type)
    (service wpa-supplicant-service-type)
    (service network-manager-service-type)
    (service openssh-service-type)
    (service avahi-service-type)
    (service cups-service-type)

    (service guix-publish-service-type
             (guix-publish-configuration
              (advertise? #t)))

    (service libvirt-service-type
             (libvirt-configuration
              (unix-sock-group "libvirt")
	      (unix-sock-rw-perms "0777")))
    (service virtlog-service-type)

    (service docker-service-type)

    (service thermald-service-type)
    (service tlp-service-type
             (tlp-configuration
              (sched-powersave-on-bat? #t)
              (sched-powersave-on-ac? #f)
              (cpu-boost-on-bat? #f)
              (cpu-boost-on-ac? #t)))

    fontconfig-file-system-service

    (bluetooth-service #:auto-enable? #t)
    (udisks-service)
    (service upower-service-type)

    %base-services-custom))

  (name-service-switch %mdns-host-lookup-nss))
