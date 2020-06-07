# マークアップ言語 第5回レポート

- 201811528 春名航亨 <[s1811528@s.tsukuba.ac.jp](mailto:s1811528@s.tsukuba.ac.jp)>
  - 情報学群 知識情報・図書館学類 3年次
- 2020/06/01 編集・提出

## 課題1: data0511.xmlの中から、指定した年に出版された書籍を出版年月日の刊行順に並べて出力するsample5-1.xsl

以下に作成した`sample5-1.xsl`のコードを示す。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:param name="year" select="2000" />

    <xsl:template match="/">
        <output>
            <memo>PublishedYear: <xsl:value-of select="$year" /></memo>
            <xsl:apply-templates select="books/item[date[year=$year]]">
                <xsl:with-param name="year" select="$year" />
                <xsl:sort select="date/month" data-type="number" order="descending" />
                <xsl:sort select="date/day" data-type="number" order="descending" />
            </xsl:apply-templates>
        </output>
    </xsl:template>

    <xsl:template match="item">
        <item>
            <isbn><xsl:value-of select="isbn" /></isbn>
            <title><xsl:value-of select="title" /></title>
            <date>
                <xsl:value-of select="concat(date/year,'-',
                                      format-number(date/month, '00'),'-',
                                      format-number(date/day, '00'))" />
            </date>
            <creator><xsl:value-of select="creator" /></creator>
        </item>
    </xsl:template>

</xsl:stylesheet>
```

## 課題2: xsltprocを使ってsample5-2.xmlにsample5-2.xslを適用し、その動作を確認

(省略)

## 課題3: sample5-2.xmlの/input/dataに書かれた文字列を\w+に分割するためのXSLTスタイルシートsample5-3.xsl

　以下に作成した`sample5-3.xsl`のコードを示す。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />

    <xsl:template match="/">
        <output>
            <xsl:apply-templates select="input/data[.!='']" />
        </output>
    </xsl:template>

    <xsl:template match="data">
        <data>
            <xsl:call-template name="split">
                <xsl:with-param name="cdr" select="normalize-space(text())" />
            </xsl:call-template>
        </data>
    </xsl:template>

    <xsl:template name="split">
        <xsl:param name="cdr" select="''" />
        <xsl:choose>
            <xsl:when test="contains($cdr, ' ')">
                <word>
                    <xsl:value-of select="substring-before($cdr,' ')" />
                </word>
                <xsl:call-template name="split">
                    <xsl:with-param name="cdr" select="substring-after($cdr, ' ')" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                 <word>
                    <xsl:value-of select="$cdr" />
                </word>
            </xsl:otherwise>
          </xsl:choose>
    </xsl:template>

</xsl:stylesheet>
```

　また以下に変換結果`sample5-3.xml`を示す。

```xml
<?xml version="1.0" encoding="UTF-8"?>
<output>
  <data>
    <word>筑波大学</word>
    <word>情報学群</word>
    <word>情報メディア創成学類</word>
  </data>
  <data>
    <word>College</word>
    <word>of</word>
    <word>Media</word>
    <word>Arts,</word>
    <word>Science</word>
    <word>and</word>
    <word>Technology,</word>
    <word>University</word>
    <word>of</word>
    <word>Tsukuba</word>
  </data>
</output>
```

## 課題4: 本課題の感想/質問

　課題3のテキストノードが空の時無視する処理に手こずったが59行目のように`elm[.!='']`と解り、かなり便利だと思った。
