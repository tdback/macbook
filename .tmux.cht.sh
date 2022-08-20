#!/usr/bin/env bash
languages=`echo "rust python golang cpp" | tr ' ' '\n'`

selected=`printf "$languages" | fzf`
if [[ -z $selected  ]]; then
	exit 0
fi

read -p "Enter Query: " query

tmux neww bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
