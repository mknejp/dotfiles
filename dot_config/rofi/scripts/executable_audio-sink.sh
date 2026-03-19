#!/usr/bin/env bash

predicate='.type == "PipeWire:Interface:Node" and .info.props."media.class" == "Audio/Sink"'

if [[ $ROFI_RETV -eq 1 ]]; then
  id=$(pw-dump | jq -r ".[] | select($predicate and .info.props.\"node.nick\" == \"$1\") | .id")
  wpctl set-default $id
  exit
fi

echo -en "\0prompt\x1fDefault Audio Sink:\n"

pw-dump | jq -r ".[] | select($predicate) | .info.props.\"node.nick\""
