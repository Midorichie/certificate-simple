# Certificate Management System on Stacks

A comprehensive blockchain-based certificate management system built on the Stacks blockchain using Clarity smart contracts. This system allows for the issuance, verification, and management of different types of certificates with enhanced security and transparency.

## Features

- **Certificate Registry**: Core contract for storing certificate data with permanent immutable records
- **Certificate Issuance**: Specialized contract for issuing different types of certificates (academic, professional, participation)
- **Certificate Verification**: Advanced verification capabilities including ownership and issuer verification
- **Trait-based Design**: Modular architecture using Clarity traits for better extensibility
- **Rich Metadata**: Support for detailed certificate information
- **Revocation System**: Ability to revoke certificates while maintaining the historical record

## Smart Contracts

### Certificate Registry (`certificate-registry.clar`)

The foundational contract that stores all certificate data using Clarity maps:

- Maintains the core certificate data structure
- Implements revocation capabilities
- Tracks certificates by both issuers and recipients
- Provides read-only functions for data retrieval
- Defines the core trait for certificate management

### Certificate Issuance (`certificate-issuance.clar`)

Handles the business logic for issuing specialized certificates:

- Supports different certificate types (academic, professional, participation)
- Formats metadata appropriately for each type
- Implements trait-based interface for extensibility
- Provides specialized issuance functions with appropriate data formatting
- Maintains a record of certificate types issued

### Certificate Verification (`certificate-verification.clar`)

Provides verification services and enhanced querying:

- Simple verification of certificate validity
- Comprehensive verification with full certificate details
- Ownership verification functions
- Issuer verification capabilities

## Usage Examples

### Issuing a Certificate

```clarity
;; Issue an academic certificate
(contract-call? .certificate-issuance issue-academic-certificate 
  "CERT123" 
  'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM 
  "Blockchain Development" 
  "A" 
  "Stacks Academy")
```

### Verifying a Certificate

```clarity
;; Basic verification
(contract-call? .certificate-verification verify-standard-certificate "CERT123")

;; Comprehensive verification
(contract-call? .certificate-verification verify-certificate-comprehensive "CERT123")
```

### Revoking a Certificate

```clarity
;; Revoke a certificate (must be called by the issuer)
(contract-call? .certificate-registry revoke-certificate "CERT123")
```

## Development

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) for local Clarity development and testing
- Basic understanding of Stacks blockchain

### Project Setup

1. Clone this repository
2. Install Clarinet if you haven't already: [Clarinet Installation Guide](https://github.com/hirosystems/clarinet#installation)
3. Run `clarinet check` to validate the contracts
4. Run `clarinet console` to interact with the contracts in a REPL environment

### Contract Interaction in Console

```bash
# Start the Clarinet console
clarinet console

# Deploy contracts
::advance_chain 1

# Issue a certificate
(contract-call? .certificate-issuance issue-academic-certificate "CERT123" 'ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM "Blockchain Development" "A" "Stacks Academy")

# Verify the certificate
(contract-call? .certificate-verification verify-standard-certificate "CERT123")
```

## Troubleshooting

### Common Issues

1. **Trait Definition Errors**: Make sure traits are properly defined before they are used. In Clarity, traits can be defined in a separate contract or within the same contract that uses them.

2. **Contract Reference Errors**: When referencing another contract, use the correct syntax:
   - For contracts in the same deployment: use `.contract-name`
   - For contracts deployed by other users: use `'STxxx.contract-name`

3. **List Operation Errors**: Remember that lists in Clarity have fixed maximum lengths. Our implementation uses lists with a maximum length of 50 items.

4. **TOML Syntax Errors**: In the Clarinet.toml file, make sure array values like `authors` are properly formatted as arrays: `authors = ["Your Name"]`

5. **Type Mismatch Errors**: Clarity is strongly typed. Make sure the types in function calls match the expected types in function definitions.

### Testing

To run automated tests:

```bash
clarinet test
```

## Future Enhancements

1. Implement batch certificate issuance
2. Add support for transferable certificates (NFT-like)
3. Add expiration dates for certificates
4. Implement more advanced access control mechanisms
5. Create a front-end interface for user-friendly interaction

## License

This project is licensed under the MIT License - see the LICENSE file for details.
