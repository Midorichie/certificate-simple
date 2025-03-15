;; Simple Certificate Issuance Contract

;; Contract calls registry but doesn't use trait
(define-public (issue-certificate (cert-id (string-ascii 64)) (recipient principal))
  (contract-call? .certificate-registry register-certificate cert-id recipient)
)
