;; Simple Certificate Registry Contract

;; Define a basic trait
(define-public (register-certificate (cert-id (string-ascii 64)) (recipient principal))
  (ok true)
)

;; Read-only function
(define-read-only (is-certificate-valid (cert-id (string-ascii 64)))
  (ok true)
)
