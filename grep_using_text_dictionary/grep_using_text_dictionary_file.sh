#!/bin/bash

word_file="search_dict.txt"
target_dir="./target"

# 一時ファイルを利用してword_fileからの空行の除去
# 空行があるとgrepコマンドの検索ワードして空白が指定されて無条件一致になってしまう。
# 一時ファイルはスクリプト終了時に削除される
filtered_word_file=$(mktemp)
trap 'rm -f "$filtered_word_file"' EXIT
awk 'length($0) > 0' "$word_file" > "$filtered_word_file"

# -- memo --
# find -type f : 
#   見つける対象をファイル限定にする
# grep -n
#   行番号の表示
# grep -H
#   ファイル名の表示
# grep -n
#   行番号の表示
# grep -F
#   検索語を正規表現ではなく文字列として扱う
# grep -f :
#   指定したファイルを検索パターンの一覧として読み込む。通常は1行につき1つの検索パターン。
find "$target_dir" -type f \
  -exec grep -nH -F -f "$filtered_word_file" -- {} +
