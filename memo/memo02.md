# 第二回メモ

## 基本的な書き方

1, XML宣言

- 文字コードの指定

2, XSLTスタイルシートのルート要素

- 名前空間の指定

3, HTMLで出力するように指定
4, 変換ルールを記述

- xsl:template
- XSLTの要素でXML文書を変換

## XSLTの基本的要素

- `xsl:stylesheet`
  - XSLTスタイルシートのルール

  - ここの`http://www.w3.org/1999/XSL/Transform`が名前空間

```xsl
<xsl:stylesheetxmlns:xsl=”http://www.w3.org/1999/XSL/Transform”
verrsion=”1.0”>

...

</xsl:stylesheet>
```

- `xsl:template`
  - 変換ルールが書かれたまとまり
  - XSLTスタイルシートはtemplateの集まり
  - match属性:`match="/XPath/"`にマッチした部分のxmlをテンプレートに沿って処理する

```xsl
<xsl:template match=”要素名・属性名”>（
(出力したい内容）
</xsl:template>
```

- `xsl:value-of`
  - 要素の内容を呼び出す

```xsl
<xsl:value-ofselect=”要素・属性を指定する式” />
```

- `xsl:apply-templates`
  - `select`要素にマッチしたテンプレートを呼び出す(要素属性に適用)
  - `select`属性にマッチした要素をそのまま出力(value-ofは空要素)

```xsl
<xsl:apply-templates select=”要素・属性を指定する式” />

## sample

```xsl
<?xml version="1.0" encoding=”UTF-8">
<xsl:stylesheetxmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
version="1.0">
  <xsl:outputmethod="html" indent="yes"  encoding=”UTF-8"
  version="4.01" />

  <xsl:templatematch="/">
    <html lang="ja">
     <head>
        <title><xsl:value-ofselect=“全体/題名” /></title>
     </head>
      <body><xsl:apply-templatesselect=“全体/本文” /></body>
   </html>
  </xsl:template>

  <xsl:templatematch="全体/本文">
   <h1><xsl:value-ofselect=“見出し” /></h1>
   <xsl:for-eachselect="段落">
     <p><xsl:value-ofselect=“.” /></p>
   </xsl:for-each>
  </xsl:template>

</xsl:stylesheet>
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xml" href="sample02.xsl"?>
<全体>
	<題名>Sample02</題名>
	<本文>
		<見出し>複数段落を表示する</見出し>
                <段落>一段落目の内容です。</段落>
                <段落>二段落目の内容です。</段落>
                <段落>三段落目の内容です。</段落>
	</本文>
</全体>

```
