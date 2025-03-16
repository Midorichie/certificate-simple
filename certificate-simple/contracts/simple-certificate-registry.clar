;; Simple Certificate Registry Contract

;; Define data structure for certificates
(define-map certificates 
  { cert-id: (string-ascii 64) }
  { 
    recipient: principal,
    issuer: principal,
    timestamp: uint,
    revoked: bool
  }
)

;; Error codes
(define-constant ERR_NOT_FOUND (err u102))
(define-constant ERR_ALREADY_EXISTS (err u101))

;; Register a new certificate
(define-public (register-certificate (cert-id (string-ascii 64)) (recipient principal))
  (let 
    (
      (issuer tx-sender)
      (existing-cert (map-get? certificates {cert-id: cert-id}))
    )
    (asserts! (is-none existing-cert) ERR_ALREADY_EXISTS)
    
    ;; Store the certificate
    (map-set certificates
      {cert-id: cert-id}
      {
        recipient: recipient,
        issuer: issuer,
        timestamp: block-height,
        revoked: false
      }
    )
    
    (ok true)
  )
)

;; Check if a certificate is valid
(define-read-only (is-certificate-valid (cert-id (string-ascii 64)))
  (let 
    (
      (cert (map-get? certificates {cert-id: cert-id}))
    )
    (if (is-some cert)
      (ok (not (get revoked (unwrap! cert ERR_NOT_FOUND))))
      (ok false)
    )
  )
)
