#!/bin/bash

word_file="search_dict.txt"
target_dir="./target"

# -- memo --
# while ...; do ... done :
#   条件が成功する間、do と done の間を繰り返す。
# read -r keyword : 
#   標準入力から1行読み込む
#   1行を keyword に読み込む。-r により、バックスラッシュを特別扱いせずそのまま読み込む。
# IFS= : 
#   空白指定なので、read が行頭・行末の空白を取り除かないようにする。
# find -type f : 
#   見つける対象をファイル限定にする
# find -exec
#   見つかったファイルに対して実行するコマンド
# grep -n
#   行番号の表示
# grep -H
#   ファイル名の表示
# grep -e
#   検索パターン  -で開始してもオプションとして扱われない
# find -- : 
#   コマンドライン引数の「オプションはここまで」という区切り。
#   対象ファイル名が -data.txt でも、grep のオプションと誤解されない。
# find {} :
#   find が見つけたファイル名に置き換わる
# find + :
#   findが見つけたファイル名をまとめてgrepに渡す
while IFS= read -r keyword || [[ -n "$keyword" ]]; do
  [[ -z "$keyword" ]] && continue
  find "$target_dir" -type f -exec grep -nH -e "$keyword" -- {} +
done < "$word_file"

# 個別動作確認
# find {} + の動作確認 printfへ渡す
# find "$target_dir" -type f -exec sh -c '
#   printf "batch start\n"
#   for path do
#     printf "  <%s>\n" "$path"
#   done
# ' sh {} +
