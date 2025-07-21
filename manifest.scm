(use-modules ((guix licenses)
              #:prefix license:)
             (gnu packages ruby)
             (guix build-system ruby)
             (guix download)
             (guix git)
             (guix packages)
             (guix git-download))

(packages->manifest (list ruby-rake
                          ruby-yard
                          ruby-redcarpet
                          ruby-rubocop
                          ruby-rubocop-rake
                          ruby-rubocop-rspec
                          ruby-rspec
                          ruby-simplecov
                          ruby-benchmark-ips
                          ruby-rubocop-performance
                          ruby))
