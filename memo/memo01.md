# 第一回メモ
- コンパイルは`xsltproc`
- lintは`xmllint <file>`
- templ"""a"""te
  - typoしがち
- マークアップ言語
  - HTML
  - XML
  - JSON
- 親子構造(木構造)があるなあ
- HTMLエンティティで文字参照ができる
  - 実体参照だと一部の記号がバグる場合があるから
    - <, >, !, #とか
- 大文字小文字の区別あり
- コメントは`<- ->`
- XMLの構造
  - XML宣言
  - DTD
    - 構造定義
  - XMLインスタンス
    - 本文
- XML宣言
  - `<?xml version="1.0" encoding="UTF-8"?>`
- 文書の種類
  - 整形式XML文書 <-こっちをあつかう
    - XML宣言など不必要？
  - 検証済みXML文書
- XSLTでコンパイル
  - プログラミング言語
  - DSL?


- 課題
  - (SAMPLE1, 2をブラウザで表示)
  - 感想文をmanabaで送信
  - 4/30まで