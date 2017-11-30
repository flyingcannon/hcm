
hcm() {
  docker-compose -f docker/docker-compose.yml run --user="$UID:$GID" hcm "$@"
}

assert_starts_with() {
  [ "${1:0:${#2}}" == "$2" ]
}

use_fixture() {
  fixture_dir="$1"
  rm -fr test_home
  cp -d -r "$fixture_dir/before" test_home
}

diff_dir() {
  diff -r --no-dereference "$1" "$2"
}

diff_home_status() {
  fixture_dir="$1"
  rmdir --ignore-fail-on-non-empty test_home/.hcm/installed_modules || :
  diff_dir "$fixture_dir/after" test_home
}
