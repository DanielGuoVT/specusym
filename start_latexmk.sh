#!/bin/bash
PROC_NAME=latexmk
project=tapsse

ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ]; then
  echo "latexmk is not running, now start it."
  latexmk -pdf -pvc $project.tex &
else
	os=$(uname)
	pid=0
	if [ "$os" = "Darwin" ]; then
		pid=$(ps -ef | grep 'latexmk -pdf -pvc' | grep -v grep | awk '{print $2}')
	else
		pid=$(ps -ef | grep 'latexmk' | grep -v grep | awk '{print $2}')
	fi
	echo "latexmk is already running, pid:" $pid

  if [ "$1" = "-kill" ]; then
		echo "now terminate latexmk..."
		kill $pid
  fi
fi



