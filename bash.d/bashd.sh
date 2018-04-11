if [ ! $SSH_AGENT_PID ]; then
  echo starting agent
  ssh-agent bash -c "ssh-add; bash -i"
else
  echo agent running
fi
