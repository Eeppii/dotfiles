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
  # Define distributions to check in order of preference
  local ros_distros=("noetic" "humble" "jazzy")
  local ros_distro=""

  # Find the first installed ROS distribution
  for distro in "${ros_distros[@]}"; do
    if [[ -f "/opt/ros/${distro}/setup.zsh" ]]; then
      ros_distro="${distro}"
      break
    fi
  done

  # Source the appropriate setup files based on found distribution
  if [[ -n "${ros_distro}" ]]; then
    source "/opt/ros/${ros_distro}/setup.zsh"

    # Additional configuration for ROS 2 distributions
    if [[ "${ros_distro}" != "noetic" ]]; then
      # for colcon_cd
      source /usr/share/colcon_cd/function/colcon_cd.sh
      export _colcon_cd_root="/opt/ros/${ros_distro}/"
      # argcomplete for ros2 & colcon
      eval "$(/usr/bin/register-python-argcomplete3 ros2)"
      eval "$(/usr/bin/register-python-argcomplete3 colcon)"
    fi

    echo "Using ROS ${ros_distro}"
  else
    echo "No supported ROS distribution found (checked: ${ros_distros[*]})."
  fi
}
# function ros_go() {
#   # Check if Noetic ROS is installed
#   if [[ -f /opt/ros/noetic/setup.zsh ]]; then
#     source /opt/ros/noetic/setup.zsh
#   # Otherwise, check for Humble ROS
#   elif [[ -f /opt/ros/humble/setup.zsh ]]; then
#     source /opt/ros/humble/setup.zsh
#     # for colcon_cd
#     source /usr/share/colcon_cd/function/colcon_cd.sh
#     export _colcon_cd_root=/opt/ros/humble/
#     # argcomplete for ros2 & colcon
#     eval "$(/usr/bin/register-python-argcomplete3 ros2)"
#     eval "$(/usr/bin/register-python-argcomplete3 colcon)"
#   else
#     echo "Neither Noetic nor Humble ROS is installed."
#   fi
# }
