(use-modules ((guix licenses)
              #:prefix license:)
             (gnu packages ruby)
             (gnu packages ruby-check)
             (gnu packages ruby-xyz)
             (guix build-system ruby)
             (guix download)
             (guix packages)
             (guix git-download)
             (guix profiles))

(packages->manifest (list ruby-rake
                          ruby-yard
                          ruby-rspec
                          ruby-simplecov
                          ruby-benchmark-ips
                          ruby))
