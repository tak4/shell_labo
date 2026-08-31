#!/bin/bash

# IFS とは「Internal Field Separator（内部フィールド区切り文字）」の略
# bash がスペースやタブ、改行を認識するための変数
# デフォルトのままだと読み込んだ行の最初と最後にあるスペースやタブが自動的に消去（トリミング）されてしまう為、
# IFS= として未設定にする
while IFS= read -r word || [ -n "${word}" ]; do
    [ -z "${word}" ] && continue
    echo ${word}
    # grep -c -F ${word} sampledata.txt | sed "s/^/$word /"
done < target_list.txt

echo "test" | \
while IFS= read -r word || [ -n "${word}" ]; do
    [ -z "${word}" ] && continue
    echo ${word}
    # grep -c -F ${word} sampledata.txt | sed "s/^/$word /"
done