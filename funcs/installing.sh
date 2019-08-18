function echo_progress() {
  color_code="\e[33m"
  default_color_code="\e[m"
  window_size=`tput cols`
  window_separator="==== ${1} "
  rest_separator_len=$(($window_size-${#window_separator}))
  for i in `seq 1 ${rest_separator_len}`
  do
    window_separator+="="
  done

  echo -e $color_code$window_separator$default_color_code
}
