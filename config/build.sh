#!/usr/bin/bash

TEX="platex"
PDF="dvipdfmx"
f="main"

# *.dvi
# 一回目のコンパイル
${TEX} -interaction=nonstopmode ${f}.tex > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "compile 1 is successed!"
else 
    echo -e "failure! please read ${f}.log";
fi
# ニ回目のコンパイル
if [ $? -eq 0 ]; then
    grep -q "Rerun to get" ${f}.log && platex -interaction=nonstopmode ${f}.tex > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "compile 2 is successed!"
    fi
else
    echo -e "compile 1 is failure! read ${f}.log"
fi

# *.pdf
if [ -e ${f}.dvi ]; then
    ${PDF} ${f}.dvi
fi
