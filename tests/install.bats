#!/usr/bin/env bats

load test_helper

setup() {
  mkdir -p test_home
}

teardown() {
  rm -fr test_home
}

@test "install: a simple empty module" {
  fixture="./fixtures/install/simple_empty_module"
  use_fixture "$fixture"

  hcm install

  diff_home_status "$fixture"
}
