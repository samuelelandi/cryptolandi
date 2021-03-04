#!/bin/bash
gcc cryptolandi.c -o cryptolandi  -lssl -lcrypto
cp cryptolandi /usr/bin/
	