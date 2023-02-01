#!/bin/bash

riscv64-unknown-elf-gdb bazel-bin/src/salus --ex "target remote localhost:1234"
