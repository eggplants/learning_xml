# 第6回

## xsl:element

- `xml/html`の要素を出力(明示的)
- `name`属性に`name="{elementname}"`とかける
  - XML文書中の要素/属性を取り出せる

```xsl
<xsl:element
    name="修飾名(要素名)"
    namespace="URI"
    use-attribute-sets="修飾名">
    ...
    （テンプレート）
    ...
</xsl:element>
```

```xsl
<xsl:template match="/">
    <xsl:element name="output"> <!-- <output> -->
        <xsl:element name="title"> <!-- <title> -->
            <xsl:value-of select="$title" /> <!-- {{title}} -->
        </xsl:element> <!-- </title> -->
    ：
    </xsl:element> <!-- </output> -->
</xsl:template>
```

## xsl:attribute

- 親elementに属性を追加
- 属性値は処理の返り値

```xsl
<xsl:attribute
    name="修飾名"
    namespace="URI">
    ...
    （処理）
    ...
</xsl:attribute>
```

```xsl
<a>
    <xsl:attribute name="href">
        <xsl:value-of select="item/url/@resource" />
    </xsl:attribute>
    <xsl:value-of select="item/title" />
</a>
```

## xsl:text

- ただの文字列を出力(明示的)
- `disable-output-escaping="no"`でエスケープ
- 出力に通常削除される空白文字を含めることができる
  - 空白文字= {タブ,改行,空白,…}

```xsl
<xsl:text
    disable-output-escaping={ "yes" | "no" }>
    (#PCDATA)
</xsl:text>
```

## 名前空間（Namespace）

- 要素名と属性名の重複を防ぐ仕組み
- XMLの名前空間は:
  - NamespacesinXML1.0(Third Edition)
  - [www.w3.org/TR/xml-names/](https://www.w3.org/TR/xml-names/)
- 宣言
  - `<xsl:stylesheet xmlns:xsl="http://www...">`
- 使用
  - `<名前空間接頭辞:要素名>`で呼び出す
- 名前がかぶったとしても名前空間分けておけば困らない(常に一意性を確保できる)
