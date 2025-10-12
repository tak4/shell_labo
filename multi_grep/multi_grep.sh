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
  # find の複数条件 () で囲むことで、評価順序を明示
  find . \( -name "*.log" -o -name "*.txt" -o -name "*.md" \) -print0 | xargs grep -e "${item}"
done

echo
