#!/bin/bash

type=$(file -b $1)

echo "$1 - $type"
