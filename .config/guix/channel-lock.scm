(list (channel
       (name 'guix)
       (url "https://git.savannah.gnu.org/git/guix.git")
       (commit "7e651ab3e606b44ac6354cc5678c8816caed7e5d")
       (introduction
        (make-channel-introduction
         "9edb3f66fd807b096b48283debdcddccfea34bad"
         (openpgp-fingerprint
          "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))
      (channel
       (name 'nonguix)
       (url "https://gitlab.com/nonguix/nonguix")
       (commit "393b8e0405f44835c498d7735a8ae9ff4682b07f")
       (introduction
        (make-channel-introduction
         "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
         (openpgp-fingerprint
          "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
      (channel
       (name 'flat)
       (url "https://github.com/flatwhatson/guix-channel.git")
       (commit "cf23f523afc611c2b35debf015d219c6f918337f")
       (introduction
        (make-channel-introduction
         "33f86a4b48205c0dc19d7c036c85393f0766f806"
         (openpgp-fingerprint
          "736A C00E 1254 378B A982  7AF6 9DBE 8265 81B6 4490")))))
