# printf, xargs

```
printf "file1\nfile2\nfile3\n" | xargs -I{} echo ファイル名: {}
```

# find

```
find . \( -name "*.log" -o -name "*.txt" -o -name "*.md" \) -print0 | xargs -0 cat
```

# sort

```
sort -t, -k2 file.csv
```


# grep

## -E, --extended-regexp
パターンを 拡張正規表現（ERE, Extended Regular Expression）として解釈します。

|（OR）や +（直前の1回以上出現）など、表現力の高い演算子が使用できます。

例: grep -E "foo|bar" は "foo" または "bar" に一致する行を表示。

## -F, --fixed-strings
パターンを単なる リテラル文字列（固定文字列）として解釈します。

正規表現を一切使わないため、検索が非常に高速。

例: grep -F "a.b" は "a.b" そのもの（ピリオドも含めて）に一致する行のみを検索。

## -G, --basic-regexp
パターンを 基本正規表現（BRE, Basic Regular Expression）として解釈します。

拡張正規表現の一部演算子（例: +, ?, |など）はエスケープが必要です。

例: grep -G "foo\|bar" は "foo" または "bar" に一致。

## -P, --perl-regexp
パターンを Perl互換正規表現（PCRE, Perl Compatible Regular Expressions）として解釈します。

Lookahead/Lookbehindなど高度な構文が利用可能（ただし環境により未対応の場合あり）。

例: grep -P "(?<=error )[0-9]+" は "error " の後ろの数字に一致。

## -e, --regexp=PATTERNS
マッチさせたい パターンそのものを都度指定します。

オプション単体では正規表現種・解釈法は変わらず、他オプション（-E, -F, -G, -P）と組み合わせて指定。

また複数-eでOR条件を簡潔に書けます。

例: grep -e "error" -e "fail" は "error" または "fail" に一致。


sort コマンドにて、下記のようにsortすることはできるでしょうか。

入力データ
/N20/test
/N10/test
/N2/test
/N1/test

出力データ
/N1/test
/N2/test
/N10/test
/N20/test
