#!/bin/bash

# Will grep out anything with a line beginning, 32 characters, and a tab afterwards.
# For now this will be used to get OTu Names as long as they are 32 characters long.
grep -Po '^.{32}\t' "$1" > "$2"