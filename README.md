# Cryptolandi files encryption/decryption 768 bits

Cryptolandi encrypts/decrypts files for the highest security requirements  by 768 bits symmetric encryption.  
- Each file is encrypted initially by AES 256 bit.
- The encrypted file  is encrypted again by Chacha20 256 bit.
- The ndouble encrypted file is encrypted again by CAMELLIA 256 bit.

For each encryption step, a different key of 256 bit is used, Achieving security level of 768 bits and 3 different encryption algorithms.

Your supplied password is hashed by sha3-512 bits thousands of times to expand/derive the required 768 bits key, equivalent to 3 keys of 256 bits.

## How to build
This utility works on Linux and it has been tested on Debian 10 and Raspberry OS.
install the required libraries:
```bash 
./setup.sh
```  
compile the program
```bash
./build.sh
```  
## How to run:
Example to ENCRYPT a file: 
```bash
cryptolandi -e originfilename encryptedfilename password
```  

Example to DECRYPT a file: 

```bash
cryptolandi -d encryptedfilename originfilename  password
```  



