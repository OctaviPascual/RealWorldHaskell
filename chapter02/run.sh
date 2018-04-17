#! /bin/bash

set -x

ghc -e ':script types.ghci'
ghc -e ':script lastButOne.ghci'
