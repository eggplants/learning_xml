# マークアップ言語 第4回レポート

- 201811528 春名航亨 <[s1811528@s.tsukuba.ac.jp](mailto:s1811528@s.tsukuba.ac.jp)>
- 2020/05/25 編集・提出

## 課題1: sample4.xslを改良したid属性で昇順に並べるsample4-1.xsl

以下に作成した`sample4-1.xsl`のコードを示す。

```xsl
...(15行目まで略)...
<xsl:apply-templates select="list/item">
  <xsl:sort select="@id" data-type="number" />
</xsl:apply-templates>
...(以下略)...
```

## 課題2: sample4.xslを改良した値段で降順に並べるXsample4-2.xsl

以下に作成した`sample4-2.xsl`のコードを示す。

```xsl
...(15行目まで略)...
<xsl:apply-templates select="list/item">
  <xsl:sort select="price" data-type="number" order="descending" />
</xsl:apply-templates>
...(以下略)...
```

## 課題3: sample4.xslを改良した値段で降順ソート->id属性順でタイブレークするsample4-3.xsl

以下に作成した`sample4-3.xsl`のコードを示す。

```xsl
...(15行目まで略)...
<xsl:apply-templates select="list/item">
  <xsl:sort select="price" data-type="number" order="descending" />
  <xsl:sort select="@id" data-type="number" />
</xsl:apply-templates>
...(以下略)...
```

## 課題4

### 1) sample4.xmlを改良した品名順に並べるための情報を追加したsample4-4.xml

以下に作成した`sample4-4.xml`のコードを示す。
なお、name要素のひらがな読みをruby要素として追加した。

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<list>
  <meta>
    <shop>八百広</shop>
    <address>茨城県つくば市吾妻</address>
    <phone>029-85x-xxxx</phone>
    <businessHours>9:30-21:00</businessHours>
  </meta>
  <item id="11" category="果物">
    <ruby>みかん</ruby>
      <name>みかん</name>
      <price>300</price>
      <pref>熊本県</pref>
  </item>
  <item id="9" category="野菜">
    <ruby>ぶろっこりー</ruby>
      <name>ブロッコリー</name>
      <price>250</price>
      <pref>千葉県</pref>
  </item>
  <item id="3" category="野菜">
    <ruby>はくさい</ruby>
      <name>白菜</name>
      <price>300</price>
      <pref>群馬県</pref>
  </item>
  <item id="10" category="野菜">
        <ruby>きゃべつ</ruby>
      <name>キャベツ</name>
      <price>150</price>
      <pref>千葉県</pref>
  </item>
  <item id="4" category="野菜">
        <ruby>だいこん</ruby>
      <name>大根</name>
      <price>100</price>
      <pref>茨城県</pref>
  </item>
  <item id="1" category="果物">
        <ruby>みかん</ruby>
      <name>みかん</name>
      <price>400</price>
      <pref>愛媛県</pref>
  </item>
  <item id="5" category="果物">
        <ruby>きうい</ruby>
      <name>キウイ</name>
      <price>300</price>
      <pref>愛媛県</pref>
  </item>
  <item id="2" category="果物">
        <ruby>りんご</ruby>
      <name>りんご</name>
      <price>400</price>
      <pref>青森県</pref>
  </item>
  <item id="7" category="野菜">
        <ruby>ほうれんそう</ruby>
      <name>ほうれん草</name>
      <price>200</price>
      <pref>千葉県</pref>
  </item>
  <item id="8" category="果物">
        <ruby>なし</ruby>
      <name>なし</name>
      <price>400</price>
      <pref>茨城県</pref>
  </item>
</list>
```

### 2) sample4.xslを改良した品名順に並べるsample4-4.xsl

以下に作成した`sample4-4.xsl`のコードを示す。

```xsl
...(15行目まで略)...
<xsl:apply-templates select="list/item">
  <xsl:sort select = "ruby" data-type ="text" lang= "ja" />
</xsl:apply-templates>
...(以下略)...
```

## 課題6: sample4-6.xslを改良した様々な演算を行うsample4-6-1.xsl

以下に作成した`sample4-6-1.xsl`のコードを示す。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <output>
      <xsl:apply-templates select="input/expr" />
    </output>
  </xsl:template>

  <xsl:template match="expr">
    <data>
      <xsl:choose>
        <xsl:when test="@operator='add'">
          <xsl:value-of select="p1 + p2" />
        </xsl:when>
        <xsl:when test="@operator='sub'">
          <xsl:value-of select="p1 - p2" />
        </xsl:when>
        <xsl:when test="@operator='multiply'">
          <xsl:value-of select="p1 * p2" />
        </xsl:when>
        <xsl:when test="@operator='divide'">
          <xsl:value-of select="p1 div p2" />
        </xsl:when>
        <xsl:when test="@operator='mod'">
          <xsl:value-of select="p1 mod p2" />
        </xsl:when>
        <xsl:otherwise>
          Undifined:<xsl:value-of select="@operator" />
        </xsl:otherwise>
      </xsl:choose>
    </data>
  </xsl:template>

</xsl:stylesheet>
```

## 課題7: 本課題の感想/質問

- 今回の課題は割と簡単だった。
- 前回課題2の表作成の際、果物と野菜の処理を別々に書いてしまい後悔していたが、次回の授業で、上手く実装出来なかった「名前付きテンプレート」を扱われるということで楽しみだ。
