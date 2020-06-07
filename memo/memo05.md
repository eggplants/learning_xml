# 第5回

## 変数(xsl:vaiable)

### 文法

- 値は、文字列、数値、ブール値、ノード集合
- `xsl:stylesheet`か`xsl:template`の子要素として記述
- 変数名の前に「$」を付け参照

```xsl
<xsl:variable name="x" select="title" />
...
<xsl:value-of select="$x" />
```

- 変数の有効範囲に注意
  - グローバル
    - xsl:stylesheetのどこでも使える
  - ローカル
    - xsl:templateのそのテンプレート内でのみ有効

```xsl
<xsl:variable
    name="修飾名（変数名）"
    select="'処理書いてない時に渡る値'">
    (ここの返り値/値を変数に代入)
</xsl:variable>
```

### 例

```xsl
<xsl:variable name="str" select="item/title"/>

<xsl:variable name="x">3</xsl:variable>

<xsl:variable name="y">
    <xsl:value-of
        select="concat('題名:',title)" />
</xsl:variable>

<xsl:variable name="z">
    <xsl:apply-templates select="item" />
</xsl:variable>

<xsl:variable name="z">
    <xsl:apply-templates select="item" />
</xsl:variable>

<xsl:template match="item">
    <ul>
        <li><xsl:value-of select="title"/></li>
        <li><xsl:value-of select="creator"/></li>
    <ul>
</xsl:template>

```

## パラメータ

- 引数の設定
  - `xsl:with-param`

```xsl
<xsl:with-param
    name="key"
    select="'処理無い時の値'">
    （処理）
</xsl:with-param>
```

- `xsl:param`を含んだテンプレートに渡す

```xsl
<xsl:apply-templates select="foo">
    <xsl:with-param name="x" select="'10'" />
    <xsl:with-param name="y">0.5</xsl:with-param>
</xsl:apply-templates>
```

- 引数の要求
  - `xsl:param`
  - XSLTプロセッサを起動する時
    - `xsltproc -param x 1 -param y "'a'" ...`
    - 参照はxsl:variableと同じ（$を前に付ける）
  - xsl:templateを呼び出す時

```xsl
<xsl:param
    name="修飾名（変数名）"
    select="デフォルト値">
    (ここの返り値/値を変数に代入)
</xsl:param>
```

## 名前付きテンプレート

- 名前付きテンプレート定義
  - `xsl:template`
  - 処理に名前を付け、まとめることができる
  - `xsl:template`の`name`にテンプレート名
    - （match属性ではない）
  - 呼び出しは`xsl:apply-templates`でない`xsl:call-template`
- 名前付きテンプレート呼び出し
  - `xsl:call-template`

```xsl
<xsl:template name="print-title">
  <xsl:value-of select="item/title" />
</xsl:template>

<xsl:template match="/articles">
  <xsl:call-template name="print-title" />
</xsl:template>

<!--
xsl:apply-templates やxsl:for-each などと違い、カレントノードは変わらない
パラメータを使うこともできる（xsl:paramとxsl:with-param）
-->

<xsl:template name="print-title">
  <xsl:param name="p1" select="''" />
  <xsl:value-of select="$p1"/>
</xsl:template>

<xsl:template match="/articles">
  <xsl:call-template name="print-title">
    <xsl:with-param name="p1" select="metadata/title" />
  </xsl:call-template>
</xsl:template>
```

- 再帰

```xsl
<xsl:template match="data">
  <data>
    <xsl:call-template name="slicechar">
      <xsl:with-param name="str" select="text()" />
    </xsl:call-template>
  </data>
  </xsl:template>
  <xsl:template name="slicechar">
    <xsl:param name="str" select="''" />
  <xsl:if test="string-length($str) &gt; 0">
    <char>
      <xsl:value-of select="substring($str, 1, 1)" />
    </char>
    <xsl:call-template name="slicechar">
      <xsl:with-param name="str" select="substring($str,2)" />
    </xsl:call-template>
  </xsl:if>
</xsl:template>
```