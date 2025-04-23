#
# Linux Specific Commands
#

# Auto-color always
alias ls='ls --color=auto'
alias la='ls -A'
alias l='ls -ACF'
alias ll='ls -l'
alias lla='ls -Al'

# Atom Editor
alias 'a'=atom

# Easier sys ctl
alias ss='sudo systemctl'
compdef ss=systemctl

# Easier journalctl
unalias logs 2>/dev/null

logs() {
  sudo journalctl -f "$@" --output=json | jq -r '
    def color(level):
      if level == "ERROR" then "\u001b[31m" + level + "\u001b[0m"
      elif level == "WARN" then "\u001b[33m" + level + "\u001b[0m"
      else "\u001b[32m" + level + "\u001b[0m"
      end;

    try (
      .MESSAGE as $raw
      | $raw | fromjson
      | . as $msg
      | ($msg.level // "INFO" | ascii_upcase) as $lvl
      | ($msg.identifier // "-") as $ident
      | $msg.logger as $logger
      | $msg.msg as $msgtext
      | (now | strflocaltime("%H:%M:%S")) as $time
      | "\(color($lvl))  \($time) [\($ident):\($logger)] \($msgtext)"
    )
  '
}

compdef logs=journalctl
