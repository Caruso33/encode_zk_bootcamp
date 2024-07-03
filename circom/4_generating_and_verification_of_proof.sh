#!/bin/bash

# paths

cwd=$(pwd)

js_path=${cwd}/multiplier2_js
cpp_path=${cwd}/multiplier2_cpp
ts_path=${cwd}/trusted_setup
proof_path=${cwd}/proof

mkdir -p $proof_path && cd $_

# generating proof

npx snarkjs groth16 prove $ts_path/multiplier2_0001.zkey $js_path/witness.wtns proof.json public.json

# echo '["44"]' > public.json

# verifying proof
npx snarkjs groth16 verify $ts_path/verification_key.json $proof_path/public.json $proof_path/proof.json