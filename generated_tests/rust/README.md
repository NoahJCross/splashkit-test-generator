# SplashKit Test Suite - Rust

This directory contains integration tests for the SplashKit SDK.

## Requirements

- Rust

## Installation

1. Install SplashKit SDK following instructions at https://splashkit.io/installation/
2. Create new Cargo project: cargo new splashkit_tests
3. Add to Cargo.toml:
   [dependencies]
   splashkit = "*"
4. Move integration_tests.rs to splashkit_tests/src/lib.rs

## Running Tests

To run the tests:\n\n
```bash
cd splashkit_tests && cargo test
```
