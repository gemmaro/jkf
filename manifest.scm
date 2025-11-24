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

(define-public ruby-typeprof
  (package
    (name "ruby-typeprof")
    (version "0.31.0")
    (source (origin
              (method git-fetch) ;for Rakefile
              (uri (git-reference
                    (url "https://github.com/ruby/typeprof")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0919djm8vsissm2f3blm87k7p11lcw4nqb9rcq7adzflx4g3qar9"))))
    (build-system ruby-build-system)
    (arguments (list #:tests? #f
                #:phases #~(modify-phases %standard-phases
                             (add-before 'build 'remove-files-field
                               (lambda _
                                 (substitute* "typeprof.gemspec"
                                   (("spec[.]files(.|\n)+^[ ]+end") ""))))
                             (add-before 'build 'delete-tests
                               (lambda _
                                 (delete-file-recursively "test"))))))
    (propagated-inputs (list ruby-prism))
    (synopsis
     "TypeProf performs a type analysis of non-annotated Ruby code.  It
abstractly executes input Ruby code in a level of types instead of
values, gathers what types are passed to and returned by methods, and
prints the analysis result in RBS format, a standard type description
format for Ruby 3.0.")
    (description
     "@code{TypeProf} performs a type analysis of non-annotated Ruby code.  It
abstractly executes input Ruby code in a level of types instead of values,
gathers what types are passed to and returned by methods, and prints the
analysis result in RBS format, a standard type description format for Ruby 3.0.")
    (home-page "https://github.com/ruby/typeprof")
    (license license:expat)))

(packages->manifest (list ruby-rake
                          ruby-yard
                          ruby-rspec
                          ruby-simplecov
                          ruby-benchmark-ips
                          ruby))
