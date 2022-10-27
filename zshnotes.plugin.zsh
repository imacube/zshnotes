#!/bin/zsh
# Written 7/22/20 by Jake Gearon; jake.gearon@gmail.com

note_submit() {
    local cur_time
    cur_time="$(date +"%r"): "
    local cur_day
    cur_day=$(date +"%m-%d-%y")
    local day_path
    day_path="$HOME/Documents/zshnotes/"$cur_day".txt"

    task=$(echo -E "$@" | tr '\000' '\n')

    if [[ ! -e $day_path ]]; then
        mkdir -p $HOME/Documents/zshnotes
        touch $day_path
        fold -w 80 -s $day_path
        echo "##########################################################" >> $day_path
        echo "############### DAILY NOTES FOR" $cur_day "################" >> $day_path
        echo "##########################################################\n" >> $day_path
        echo "$cur_time $task" >> $day_path
        echo "--" >> $day_path

    else
        echo "$cur_time $task"  >> $day_path
        echo "--" >> $day_path
    fi
}
autoload -U note_submit
alias note=note_submit

notes_submit() {
    local cur_time
    cur_time="$(date +"%r"): "
    local cur_day
    cur_day=$(date +"%m-%d-%y")
    local day_path
    day_path="$HOME/Documents/zshnotes/"$cur_day".txt"

    task=$(cat "$@" | tr '\000' '\n')

    if [[ ! -e $day_path ]]; then
        mkdir -p $HOME/Documents/zshnotes
        touch $day_path
        fold -w 80 -s $day_path
        echo "##########################################################" >> $day_path
        echo "############### DAILY NOTES FOR" $cur_day "################" >> $day_path
        echo "##########################################################\n" >> $day_path
    fi

    echo "$cur_time\u2b07\n$task"  >> $day_path
    echo "--" >> $day_path
}
autoload -U notes_submit
alias notes=notes_submit

note_read() {
  local cur_day
  cur_day=$(date +"%m-%d-%y")
  local day_path
  day_path="$HOME/Documents/zshnotes/"$cur_day".txt"
  if [[ ! -e $day_path ]]; then
        mkdir -p $HOME/Documents/zshnotes
        touch $day_path
        chmod +x $day_path
        fold -w 80 -s $day_path
        echo "##########################################################" >> $day_path
        echo "############### DAILY NOTES FOR" $cur_day "################" >> $day_path
        echo "##########################################################\n" >> $day_path
        cat "$day_path"
  else
        cat "$day_path"
  fi
}
alias cnote=note_read
autoload -U note_read

note_read_yest() {
  local cur_day
  y_day=$(date -v-1d +"%m-%d-%y")
  local day_path
  day_path="$HOME/Documents/zshnotes/"$y_day".txt"
  cat $day_path
}
alias ynote=note_read_yest
autoload -U note_read_yest
