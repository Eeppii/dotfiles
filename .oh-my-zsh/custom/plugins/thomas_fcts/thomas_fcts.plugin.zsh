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

# 7s-configuration-client simple pull
function confp() {
  if [ "$#" -lt 4 ]; then
    echo "Illegal number of arguments. Expected 4 (machine type, id, branch, and machine classes)."
    return 1
  fi

  7s-configuration-client pull -t "$1" -i "$2" -b "$3" -c "$4" -f --ignore-generator-errors
}

function confp_legacy() {
  if [ "$#" -lt 3 ]; then
	  echo "Illegal number of arguments. Expected 3 (machine type, id, branch)."
    return 1
  fi

  7s-configuration-client pull -t "$1" -i "$2" -b "$3" -f --ignore-generator-errors
}

function run_iwyu() {
    if [ -z "$1" ]; then
        echo "Not enough arguments"
        return 1
    fi
    iwyu_tool -j8 -p "$1" -- -Xiwyu --mapping_file=/home/thomas/.config/iwyu/test-iwyu-mappings.imp -Xiwyu --verbose=3
}

