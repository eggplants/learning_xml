# 第7回

## RSSとは

- RDF Site Summary(RDFでのサイトの簡約), Really Simple Syndication(マジで簡潔な供給/放映)
- 主としてウェブサイトの更新情報を配信するための規格
- 見出しや要約、実際のページへのリンクなどが記述されている
- 用途
  - ソフトウェアがRSSをデータとして利用
  - 共通の記述形式である
    - 更新された情報の配信
    - 複数のウェブサイトの更新情報をまとめて見る
    - 自分のウェブページに、他のウェブページの更新状況を載せる

## 歴史

- 1995年Apple社MCF（Meta Content Framework）
- 1997年MS社CDF（Channel Definition Format）、UserLand社scriptingNews
- 1999年Netscape社RSS 0.90と0.91
- 2000年コミュニティベースでRSS 1.0
- 2003年ハーバード大RSS 2.0

現在はAtom 形式も使われている（[RFC4287](http://tools.ietf.org/html/rfc4287)）

## RSS（1.0）で決めている要素（一部）

- rss:channel
- rss:title
- rss:link
- rss:description
- rss:items
- rss:itemなど
- Dublin Coreで決めている要素と組み合わせている
  - dc:creator
  - dc:publisher
  - dc:language
  - dc:dateなど

例) CNN RSS [一覧](https://edition.cnn.com/services/rss)

## 仕様URL

- [RSS1.0](https://web.resource.org/rss/1.0/)
- [RSS2.0](https://cyber.harvard.edu/rss/rss.htm)
- [RDF](https://www.w3.org/RDF/).
- [Dublin Core](https://dublincore.org/)

## document関数

- document関数を使うと、複数のXML文書を入力として扱うことができる
- `ducument()`に外部XMLファイルパスを指定
- `for-each`でパス名が集められたXMLを回して`document`に与えると良い
- `<xsl:apply-templates select="document('data.xml')/list/item" />`

## XML to TSV(Tab Separated Values)

- `<xsl:output method="text" encoding="utf-8"/>`必須

```xsl
<!-- tab -->
<xsl:text>  </xsl:text>
<xsl:text>&#x9;</xsl:text>
<!-- breakline -->
<xsl:text>
</xsl:text>
<xsl:text>&#xa;</xsl:text>
```

```xsl
<xsl:output method="text" encoding="utf-8" />
<xsl:template match="/">
    <xsl:apply-templates select="//item" />
</xsl:template>

<xsl:template match="item">
    <xsl:value-of select="name" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="price" />
    <xsl:text>&#x9;</xsl:text>
    <xsl:value-of select="pref">
    <xsl:text>&#xa;</xsl:text>
</xsl:template>
```
