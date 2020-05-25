# 第4回

## XPath式:軸

- `軸::ノードテスト[述語]`が本来の記法

## XSLTの条件分岐

- xsl:if
  - `<xsl:if test="XPath式">（処理）</xsl:if>`
  - XPathが真なら処理を実行する

```xml
<xsl:templatematch="item">
  <xsl:if test="contains(url/@resource, 'kodansha.jp')">
    関連ＵＲＬは講談社です。
  </xsl:if>
  <xsl:if test="price &gt; 1000">
    <xsl:value-of select="price" />
  </xsl:if>
</xsl:template>
```

- xsl:choose
  - xsl:whenを順番に評価して真なら実行(残りは評価しない)
  - testを評価して偽なら次の選択肢(when全て偽ならotherwise実行)

```xsl
<xsl:choose>
  <xsl:when test="XPath式">（処理）</xsl:when>
  <xsl:when test="XPath式">（処理）</xsl:when>
  ...（xsl:whenの繰り返し）
  <xsl:otherwise>（処理）</xsl:otherwise>
</xsl:choose>
```

```xsl
<xsl:template match="item">
  <xsl:choose>
    <xsl:when test="@url">URLが指定されています。</xsl:when>
    <xsl:when test="@isbn">ISBNが指定されています。</xsl:when>
    <xsl:otherwise>URLもISBNも指定されていません。</xsl:otherwise>
  </xsl:choose>
</xsl:template>
```

## XSLTの繰り返し

- xsl:for-each
  - 機能はxsl:apply-templatesと同じだが別のテンプレート規則を呼び出すのではなく、同じテンプレートの中で処理を実行する
  - `<xsl:for-eachselect=”XPath式”>（処理）</xsl:for-each>`

```xsl
<xsl:for-each select=”item”>
  <tr>
    <td><xsl:value-of select=”name” /></td>
    <td><xsl:value-of select=”price”/></td>
  </tr>
</xsl:for-each>
```

## XSLTのソート（xsl:sort）

- xsl:sort
  - xsl:apply-templatesとxsl:for-eachはselect属性で指定したノード集合（要素や属性）を処理する
  - xsl:sortを使うと、処理する順序を変更することができる
  - xsl:sortはxsl:apply-templateやxsl:for-eachと組み合わせて使う（単体では機能しない）
  - Key: 学籍番号, 名前の読み（辞書順）, 文字列の長さ（関数を利用する）...
  - select属性にソートのためのキーを指定
  - data-type属性にsortのデータ型を指定(text or number)
  - order属性に降順, 昇順を指定(assending or descending)
  - lang属性には、ソートキーに使う言語の名前トークンを指定する
    - jaやen など
    - 言語によってソート順が変わるが、SLTプロセッサの実装に依存する
  - 複数のxsl:sort を並べると段階的にソートが可能
  - 例）野菜とくだものの例で、産地でソートした後に値段の高い順にソートする

```xsl
<xsl:apply-templates select="item">
  <xsl:sort select=“pref" data-type="text" />
  <xsl:sortselect=“price” data-type="number" order="descending" />
</xsl:apply-templates>
```

```xsl
<xsl:sort
  select = "XPath式" data-type = {"text"|"number"}
  order = {"ascending"|"descending"} lang= "名前トークン"
  case-order = {"upper-first"|"lower-first"}/>
```

```xsl
<xsl:template match="/attendees">
  <ul>
    <xsl:apply-templates select="name">
      <xsl:sort select="family" data-type="text" order="ascending" />
    </xsl:apply-templates>
  </ul>
</xsl:template>
<xsl:template match="name">
  <li>
    <xsl:value-ofselect=”family” />,<xsl:value-ofselect=”given” />
  </li>
</xsl:template>
<!-- <ul>
  <li>Baker, Thomas</li>
  <li>Miller, Eric</li>
  <li>Wagner, Harry</li>
  <li>Weibel, Stuart</li>
  <li>杉本,重雄</li>
</ul> -->
```
