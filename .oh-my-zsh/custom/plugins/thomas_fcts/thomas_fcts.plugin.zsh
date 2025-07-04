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

function ros_go() {
  # Check if Noetic ROS is installed
  if [[ -f /opt/ros/noetic/setup.zsh ]]; then
    source /opt/ros/noetic/setup.zsh
  # Otherwise, check for Humble ROS
  elif [[ -f /opt/ros/humble/setup.zsh ]]; then
    source /opt/ros/humble/setup.zsh
    # for colcon_cd
    source /usr/share/colcon_cd/function/colcon_cd.sh
    export _colcon_cd_root=/opt/ros/humble/
    # argcomplete for ros2 & colcon
    eval "$(/usr/bin/register-python-argcomplete3 ros2)"
    eval "$(/usr/bin/register-python-argcomplete3 colcon)"
  else
    echo "Neither Noetic nor Humble ROS is installed."
  fi
}
