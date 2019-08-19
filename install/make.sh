if [[ "$uname" == 'Darwin' ]]; then
  # Mac
elif [[ "$expr substr $uname -s 1 5" == 'Linux' ]]; then
  # Linux
  sudo apt-get install build-essential
elif [[ "$expr substr (uname -s 1 10" == 'MINGW32_NT' ]]; then
  # Cygwin
else
  # other
  echo "Your platform ($(uname -a)) is not supported."
  exit 1
fi
