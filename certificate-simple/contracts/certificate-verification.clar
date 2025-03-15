;; Simple Certificate Verification Contract

;; Simple verification function
(define-public (verify-certificate (cert-id (string-ascii 64)))
  (contract-call? .certificate-registry is-certificate-valid cert-id)
)
