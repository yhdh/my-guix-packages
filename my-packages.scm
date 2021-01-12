(define-module (my-packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages gnunet)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages libidn)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages web)
  #:use-module (gnu packages xdisorg)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system gnu))

(define-public my-wget
  (package
    (name "my-wget")
    (version "1.20.3")
    (source
     (origin
      (method url-fetch)
      (uri (string-append "mirror://gnu/wget/wget-"
                          version ".tar.lz"))
      (sha256
       (base32
        "1frajd86ds8vz2hprq30wq8ya89z9dcxnwm8nwk12bbc47l7qq39"))))
    (build-system gnu-build-system)
    (inputs
     `(("gnutls" ,gnutls)
       ("libidn2" ,libidn2)
       ("libpsl" ,libpsl)))
    (native-inputs
     `(("lzip" ,lzip)
       ("pkg-config" ,pkg-config)
       ("perl" ,perl)
       ("python" ,python)               ;for testenv suite
       ("perl-http-daemon" ,perl-http-daemon)
       ("perl-io-socket-ssl" ,perl-io-socket-ssl)))
    (home-page "https://www.gnu.org/software/wget/")
    (synopsis "Non-interactive command-line utility for downloading files")
    (description
     "GNU Wget is a non-interactive tool for fetching files using the HTTP,
HTTPS and FTP protocols.  It can resume interrupted downloads, use file name
wild cards, supports proxies and cookies, and it can convert absolute links
in downloaded documents to relative links.")
    (license license:gpl3+))) ; some files are under GPLv2+
