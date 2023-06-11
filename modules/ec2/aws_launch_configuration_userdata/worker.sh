#!/bin/bash
echo "Hello, World from instance_C2" > index.html
python3 -m http.server 8080 &