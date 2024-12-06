# Test for rust

## Prerequisites
- Rust
- SplashKit SDK

## Installation
1. Install SplashKit SDK following instructions at https://splashkit.io/installation/
2. Create new Cargo project: cargo new splashkit_tests
3. Add to Cargo.toml:
   [dependencies]
   splashkit = "*"
4. Move integration_tests.rs to splashkit_tests/src/lib.rs

## Running the test
cd splashkit_tests && cargo test
