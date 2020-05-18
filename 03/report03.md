# マークアップ言語 第3回レポート

- 201811528 春名航亨 <[s1811528@s.tsukuba.ac.jp](mailto:s1811528@s.tsukuba.ac.jp)>
- 2020/05/18 編集・提出

## 課題1: sample3.xml中の条件に適合したノード集合を取得するXPath式

```xpath
# (ア)種別（category属性）が「果物」の商品名（name要素）
/list/item[@category='果物']/name

# (イ)商品識別子（id属性）が「2」の商品名
/list/item[@id=2]/name

# (ウ)6番目の商品（item要素）の商品名
/list/item[6]/name

# (エ)茨城県産の果物の商品名(pref要素の値が「茨城県」かつcategory属性の値が「果物」であるname要素)
/list/item[@category='果物']/name[../pref='茨城県']

# (オ)熊本県産か青森県産の商品の商品名
/list/item/name[../pref='熊本県' or ../pref='青森県']

# (カ)産地のリスト（重複してもかまわない）
/list/item/pref

# (キ)みかんの産地
/list/item/pref[../name='みかん']

# (ク)価格が300円より安い商品名
/list/item/name[../price &lt; 300]

# (ケ)価格が200円以下の野菜の商品名
/list/item[@category='野菜']/name[../price &lt;= 200]
```

## 課題2: `sample3.xml`の商品を野菜/果物別に表出力する`sample3-1.xsl`を作成

以下に作成した`sample3-1`のコードを示す。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <html>
            <body>
                <h1>
                    <xsl:value-of select="concat(list/meta/shop, '商品一覧')" />
                </h1>
                <xsl:apply-templates select="/list"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="list">
        <h2>野菜</h2>
        <table border="1">
            <tr>
                <th>商品名</th>
                <th>価格</th>
            </tr>
            <xsl:for-each select="item[@category='野菜']">
                <tr>
                    <td><xsl:value-of select="name"/>(<xsl:value-of select="pref"/>)</td>
                    <td><xsl:value-of select="price"/>&#x5186;</td>
                </tr>
            </xsl:for-each>
        </table>
        <h2>果物</h2>
        <table border="1">
            <tr>
                <th>商品名</th>
                <th>価格</th>
            </tr>
            <xsl:for-each select="item[@category='果物']">
                <tr>
                    <td><xsl:value-of select="name"/>(<xsl:value-of select="pref"/>)</td>
                    <td><xsl:value-of select="price"/>&#x5186;</td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>
```

## 課題3: `data0511.xml`中の条件に適合したノード集合を取得するXPath式(絶対パスのみ)

```xpath
# (ア)2018年に出版されたitem
/books/item[date[year=2018]]

# (イ)2018年に出版されたitemのtitle
/books/item[date[year=2018]]/title

# (ウ)keywordに「小説」を持つitem
/books/item[keywords[keyword='小説']]

# (エ)2018年に出版され、かつ、keywordに「小説」を持つitemのtitle
/books/item[date[year=2018] and keywords[keyword='小説']]/title

# (オ)publisherが「講談社」または「小学館」であるitemのtitle
/books/item[publisher='講談社' or publisher='小学館']/title

# (カ)keywordに「小説」を持ち、かつ、priceが1500円より高いitemのtitle
/books/item[keywords[keyword='小説'] and price &gt; 1500]/title

# (キ)関連URL
/books/item/url/@resource

# (ク)関連URLのリンク先にkodansha.co.jp を含むitem（ヒント：contains関数を使う）
/books/item/url[contains(@resource, 'kodansha.co.jp')]/@resources

```

## 課題4: 授業の質問・感想

### 本課題の感想

XPathはクローラ作成時に用いたことはあったが文字列操作関連の関数や数値演算の存在を初めて知れた。
今回の課題2は工夫すれば表作成の部分を短く書けるはずだが方法が思いつかなかったので悔しい。

### 質問

別授業でXMLスキーマやDTD定義を主に行っているが、XSLTやXML Schemaはそれぞれ多機能だと感じる。現在のXSLT2.0にもXMLスキーマが組み込まれているらしい。(参照: [XSLT 2.0 を利用してスキーマに対応した処理を行う])
後学のために両者の関係や特徴、また現在のXSLT2.0について知りたい。

[XSLT 2.0 を利用してスキーマに対応した処理を行う]: https://www.ibm.com/developerworks/jp/xml/library/x-schemaxslt.html
