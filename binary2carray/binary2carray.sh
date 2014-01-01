#!/bin/sh
# 指定したファイルのデータ を 16進数 のC言語バイナリ配列にする
# (配列名)は第1引数で指定
# (入力ファイル)と(出力ファイル)はリダイレクトで指定可能
# 使い方
# ./binary2carray (配列名) < (入力ファイル) > (出力ファイル)
objname=${1:-objname}
od -A n -v -t x1 | sed -e '1i\
const unsigned char '$objname'[] = {
s/\([0-9a-f][0-9a-f]\) */0x\1,/g
$s/,$//
$a\
};
'
: <<'#__COMMENT_OUT__'
===== 解析 =====

objname=${1:-objname}
 第1引数をobjnameへ設定
 第1引数が無い場合は、"objname"をobjnameに設定する

od -A n -v -t x1
 -A n -> オフセットは非表示
 -v -> 省略しないで全部ダンプする
 -t x1 -> 1byteずづ16進数でダンプする

sed -e '1i\
 -> 1行目に続く文字列を挿入する

s/\([0-9a-f][0-9a-f]\) */0x\1,/g
 -> 16進数 1byte分を 0xXX, の形式へ置換

$s/,$//
 -> 最後の,を除去

$a\
};
 -> };を追加
#__COMMENT_OUT__
