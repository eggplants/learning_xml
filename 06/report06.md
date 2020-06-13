# マークアップ言語 第6回レポート

- 201811528 春名航亨 <[s1811528@s.tsukuba.ac.jp](mailto:s1811528@s.tsukuba.ac.jp)>
  - 情報学群 知識情報・図書館学類 3年次
- 2020/06/08 編集・提出

## 課題1: sample3.xmlを指定のXML文書に変換するsample6-1.xsl

以下に作成した`sample6-1.xsl`のコードを示す。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <list>
            <xsl:apply-templates select="list/item" />
        </list>
    </xsl:template>

    <xsl:template match="item">
        <xsl:element name="{name}">
            <xsl:attribute name="id">
                <xsl:value-of select="@id" />
            </xsl:attribute>
            <xsl:attribute name="pref">
                <xsl:value-of select="pref" />
            </xsl:attribute>
            <xsl:value-of select="price" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
```

## 課題2: sample6-2.xmlを指定のHTML文書に変換するsample6-2.xsl

以下に作成した`sample6-2.xsl`のコードを示す。
サブジェクト名は`/rdf:RDF/rss:item/dc:subject/text()`をキーとしてユニークなものを`xsl:for-each`で回している。

```xsl
<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rss="http://purl.org/rss/1.0/"
    xmlns:dc="http://purl.org/dc/elements/1.1/">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:key name="subject" match="/rdf:RDF/rss:item/dc:subject/text()" use="." />


    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="rdf:RDF/rss:channel/rss:description" />
                </title>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="/rdf:RDF/rss:channel/rss:description" />
                </h1>
                <div>
                    <xsl:value-of select="concat('日時：', /rdf:RDF/rss:channel/dc:date)" />
                </div>

                <xsl:for-each select="/rdf:RDF/rss:item/dc:subject/text()[
                                        generate-id() =
                                            generate-id(
                                                key('subject',.)[1]
                                            )
                                        ]">
                    <xsl:variable name="sub" select="."/>
                    <h2>
                        <xsl:value-of select="." />
                    </h2>
                    <ul>
                        <xsl:apply-templates select="/rdf:RDF/rss:item[dc:subject = $sub]" />
                    </ul>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="rss:item">
        <li>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="rss:link" />
                </xsl:attribute>
                <xsl:value-of select="rss:title" />
            </xsl:element>
        </li>
    </xsl:template>

</xsl:stylesheet>
```

## 課題3: 朝日新聞以外のRSSを変換するsample6-3.xsl

今回はデスクトップマスコットソフト「SSP」のキャラクターデータ通知フィード[GCさくら]のRSS([http://buynowforsale.shillest.net/ghosts/ghosts/index.rss])を使用した。
以下に作成した`sample6-3.xsl`のコードを示す。

```xsl
<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="rss/channel/title" />
                </title>
                <xsl:element name="meta">
                    <xsl:attribute name="name">
                        description
                    </xsl:attribute>
                    <xsl:attribute name="content">
                        <xsl:value-of select="rss/channel/description" />
                    </xsl:attribute>
                </xsl:element>
            </head>
            <body>
                <h1>
                    <xsl:value-of select="concat('直近の更新:',
                                          count(rss/channel/item) ,'件')" />
                </h1>
                <ol>
                    <xsl:apply-templates select="rss/channel/item" />
                </ol>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="item">
        <li>
            <details>
                <summary>
                    <xsl:value-of select="title" />
                </summary>
                <img src="{concat(substring(enclosure/@url, 0, 93),'&#38;surface=0')}" />
                <ul>
                    <li>
                        配布サイト:
                        <a href="{link}">
                            <xsl:value-of select="link" />
                        </a>
                    </li>
                    <li>
                        <xsl:value-of select="concat('更新日時　: ', pubDate)" />
                    </li>
                </ul>
            </details>
        </li>
    </xsl:template>

</xsl:stylesheet>
```

## 課題4: 本課題の感想/質問

- かなりXPathについての理解が深まってきた。今回の課題2での全カテゴリを繰り返す部分のようにノードのuniqを取る方法についてだったり、XPathの文字列操作の関数についてだったりと的確にわからない部分をググるための検索語を習熟しつつある。「データ表現と処理」の授業と合わせて理解を深めたい。

[GCさくら]: http://buynowforsale.shillest.net/ghosts/about.html
[http://buynowforsale.shillest.net/ghosts/ghosts/index.rss]: http://buynowforsale.shillest.net/ghosts/ghosts/index.rss
