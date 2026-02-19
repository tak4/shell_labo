#!/bin/bash

# 検索対象のワード
array=(
"HELLO WORLD"
"HELLO"
"WORLD"
HELLO WORLD
HELLO
WORLD
)

# ループで参照する
for item in "${array[@]}"
do
  # find の複数条件 () で囲むことで、評価順序を明示する。
  # find -print0 は find コマンドの区切り文字に ヌル文字を使用する。 ※ファイル名に空白、改行文字が入っている時に正しく処理する為。
  #   通常は、-print の意味で、改行文字で区切られる。
  # xargs -0 標準入力から受け取るデータをヌル文字区切りで解釈する為の指定。find -print0 と組み合わせて使用する必要がある。
  find . \( -name "*.log" -o -name "*.txt" -o -name "*.md" \) -print0 | xargs -0 grep -e "${item}"
done

echo
