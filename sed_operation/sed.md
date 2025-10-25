# 指定した単語を含む行のみ出力
```
sed -n '/test/p' sample.txt
```
-n 自動出力を抑止 sedでは渡したテキストはそのまま標準出力に出力されるが、それを抑止する。
pコマンドと組み合わせることで、指定単語を含む行のみ出力する

# 置換 各行の1つ目の test を置換
```
sed 's/test/hello/' sample.txt
```

# 置換 各行の全ての test を置換
```
sed 's/test/hello/g' sample.txt
```

# 置換 元のファイルを更新する -i
```
sed -i 's/test/hello/g' sample.txt
```

# POSIX正規表現
```
sed -n '/test[[:space:]][[:digit:]]\+/p' sample.txt
sed -n '/test[[:space:]][[:digit:]]\{1,\}/p' sample.txt
sed -n '/test[[:space:]][0-9]\{1,\}/p' sample.txt
sed -n '/t..t/p' sample.txt
```

[[:space:]] 空白文字  
[[:digit:]] 数字  
+, {} はバックスラッシュを付与する  
. はバックスラッシュ不要

# 部分的な文字列の取り出し
```
sed -n 's/.\+\(test[[:space:]][[:digit:]]\+\).\+/\1/p' sample.txt
```
\1 後方参照

