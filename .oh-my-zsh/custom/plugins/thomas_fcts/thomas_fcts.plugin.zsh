# git
function gcom() {
  if [ -z "$1" ]; then
    echo "Not enough arguments"
    return 1
  fi
  git commit -m "$1"
}

function gcomn() {
  if [ -z "$1" ]; then
    echo "Not enough arguments"
    return 1
  fi
  git commit -m "$1" -n
}

function run_iwyu() {
    if [ -z "$1" ]; then
        echo "Not enough arguments"
        return 1
    fi
    iwyu_tool -j8 -p "$1" -- -Xiwyu --mapping_file=/home/thomas/.config/iwyu/test-iwyu-mappings.imp -Xiwyu --verbose=3
}

