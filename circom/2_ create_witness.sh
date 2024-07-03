#!/bin/bash

# paths

cwd=$(pwd)

js_path=${cwd}/multiplier2_js
cpp_path=${cwd}/multiplier2_cpp

# input.json

# cat <<EOF >input.json
# {"a": "3", "b": "11"}
# EOF

echo '{"a": "3", "b": "11"}' | tee $js_path/input.json $cpp_path/input.json > /dev/null 

# js

cd $js_path

node generate_witness.js multiplier2.wasm input.json witness.wtns

# cpp

cd $cpp_path

make

./multiplier2 input.json witness.wtns