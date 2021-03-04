# Cryptolandi - Symmetric Encryption of Files - 768 bits security

Cryptolandi encrypts/decrypts files for the highest security level with 768 bits symmetric encryption.  

## Preface
Quantum processors are in sight and the whole civil society is still using AES, an algorithm invented more than 20 years ago.  
The scientific literature says that AES 256 should not be broken from Quantum processors, I would not be so sure.  
AES uses at the maximum, 256 bits keys. On the hidden side, there are leaked information reporting how the most powerful governments developed their own algorithms with higher security, reaching for sure at least 512 bits.  
Many cyber experts state that increasing the number of bits will slow down the communication protocols at the point that could become impossible to make a simple video call and it would be necessary a specific new algorithm to increase the security keeping the same speed for execution.  
It looks that we, as common human beings, should continue to use AES-256 with peace of mind.   
After inventing a new algorithm, you need to verify it very well. It will takes years of crypto-analysis by different experts, before to be considered safe.  
I never waits quietly for the storm in sight, so I started to wonder how I could improve the security level without inventing a new encryption algorithm. 

## Fundamentals

The modern phones and computers are so fast that you can apply 3 layers of encryption without visible delay, even for real time protocols, like those used for video/audio calls. 
I had direct experience making this product, [https://www.kryptophone.ae](https://www.kryptophone.ae) which has a specific version using 3 layers of symmetric encryption and perfect video/audio quality.    
I started to apply in different scenarios, multiple encryption layers using longer keys and different algorithms, at least if one algorithm is broken algebraically, the others could still guarantee the safety.  
If you make a direct comparison in term of Mbits/ throughput, AES-256 always wins against a 3 layers encryption, anyway the important point are the visible effects in the user experience and nobody can see the difference between 1 layers or 3 layers even in a real time video call.  

Cryptolandi (or Cryptoland if you prefer), makes the following:

- Each file is encrypted initially by AES 256 bit.
- The encrypted file with AES 256 is encrypted again by Chacha20 256 bit.
- The resulting double encrypted file is encrypted again by CAMELLIA 256 bit.
For each encryption step, a different key of 256 bit is used, achieving a security level of 768 bits by 3 different encryption algorithms.
This is not a new encryption algorithm, it's a smart application of well-known encryption algorithms to increase the security level.

- The main weakness may be the password that you will supply for the encryption, your security is in your hands.  The password is hashed by sha3-512 bits algorithm, thousands up to millions of times to expand it and derive the required 768 bits key (3 keys of 256 bits).
- The Init Vectors (IV) required from the algorithm are generated randomly because they must be always different, and they are stored at the bottom of the encrypted file. The size of the encrypted file is a bigger of 64 bytes compared to the file of origin.  
- This program uses temporary files to make the multiple encryption that are removed at the completion of the process.
- The speed even with big files is very high, I've encrypted 10 GB in 18 seconds in a 8 core machine and Flash memory as storage, not bad right?
- The variables are overwritten with 0x0 before closing the program.
- AES-256 make use of GCM chaining method, a TAG of 16 bytes is generated and used to verify the consistency of the decryption by this signature (HCMAC).  

## How to build
This utility works on Linux and it has been tested on Debian 10 and Raspberry OS.
install the required libraries and compilers:
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




