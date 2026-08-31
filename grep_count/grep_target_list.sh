#!/bin/bash

while IFS= read -r word || [ -n "$word" ]; do
    [ -z "$word" ] && continue
    
    # ヒットした行の先頭に [ワード] を付与して表示
    grep "$word" 検索対象ファイル.txt | sed "s/^/[$word] /"
done < target_list.txt
