[ -n "$PS1" ] && source ~/.bash_profile;

# The next line updates PATH for the Google Cloud SDK.
if [ -f /home/hagay/google-cloud-sdk/path.bash.inc ]; then
  source '/home/hagay/google-cloud-sdk/path.bash.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /home/hagay/google-cloud-sdk/completion.bash.inc ]; then
  source '/home/hagay/google-cloud-sdk/completion.bash.inc'
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
