#!/bin/bash

# 配列要素は空白文字で区切る
# 空白を複数要素に分割したくない場合は""で囲む
array=(
"HELLO WORLD"
"HELLO"
"WORLD"
HELLO WORLD
HELLO
WORLD
)

# 配列のすべての要素を、1つずつ個別の文字列として取り出す
# echo ${array[@]}

# ループで参照する
for item in "${array[@]}"
do
  echo $item
done

echo

# ループで参照する
# ${array[@]} を ""で囲まないと、空白文字で別要素になる
for item in ${array[@]}
do
  echo $item
done

