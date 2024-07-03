#!/bin/bash

# paths

cwd=$(pwd)

js_path=${cwd}/multiplier2_js
cpp_path=${cwd}/multiplier2_cpp
ts_path=${cwd}/trusted_setup
proof_path=${cwd}/proof

mkdir -p $proof_path && cd $_

# generating proof

npx snarkjs zkey export solidityverifier $ts_path/multiplier2_0001.zkey verifier.sol

# generate call data

npx snarkjs generatecall
