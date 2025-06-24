dotfiles
========

![](http://i.imgur.com/cRBxFU1.jpg)

### Getting Started

### Prerequisites:

To use Starship Prompt - install a Nerd font
[UbuntuSans Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/UbuntuSans.zip)

```
git clone git@github.com:vyder/dotfiles.git
cd dotfiles
cp options.json.example options.json
./scripts/sync
```

P.S. Take a look at [`options.json`](options.json.example) - to specify files you don't want to sync; setup default locations; etc

### Setting up a sync cron job

1. Open up your crontab with: `crontab -e`
2. Append following lines:
```
# Sync dotfiles everyday at noon
00 12 * * * <path to repo>/dotfiles/scripts/sync
```

#### Crontab format:
```
#Entries added in the following format:
# * * * * *  command to execute
# | | | | |
# | | | | |
# | | | | |------ day of week (0 - 6) (0 to 6 are Sunday to Saturday, 7 is Sunday, the same as 0)
# | | | |------------- month (1 - 12)
# | | |--------------------- day of month (1 - 31)
# | |------------------------------ hour (0 - 23)
# |------------------------------------- min (0 - 59)
#
# e.g.
# 15 * * * * ~./brofist
# Would run the brofist command once an hour on the 15th minute of every hour
```
\[source: [bropages](http://bropages.org/)\]
