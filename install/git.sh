# confirm git info if username or email is not set
git config --global user.email > /dev/null 2>&1
if [ ! $? = 0 ]; then
  echo -n -e "\e[34mgit email?: \e[m"
  read git_email
  git config --global user.email $git_email
fi

git config --global user.name > /dev/null 2>&1
if [ ! $? = 0 ]; then
  echo -n -e "\e[34mgit uer name?: \e[m"
  read git_user_name
  git config --global user.name $git_user_name
fi

# change git default editor
git config --global core.editor "vim"

# store the git credential
git config credential.helper store
