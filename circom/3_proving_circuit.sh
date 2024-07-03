#!/bin/bash

# paths

cwd=$(pwd)

ts_path=${cwd}/trusted_setup

mkdir -p $ts_path && cd $_

# trusted setup

#
# powers of tau, circuit independent
#

npx snarkjs powersoftau new bn128 12 pot12_0000.ptau -v

# contribute to the ceremony
npx snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v

#
# phase 2, curcuit dependent
#

# start generation
npx snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v

# create zkey
npx snarkjs groth16 setup ../multiplier2.r1cs pot12_final.ptau multiplier2_0000.zkey

# contribute to the phase 2 of the ceremony
npx snarkjs zkey contribute multiplier2_0000.zkey multiplier2_0001.zkey --name="1st Contributor Name" -v

# export verification key
npx snarkjs zkey export verificationkey multiplier2_0001.zkey verification_key.json