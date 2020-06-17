# マークアップ言語 第7回レポート

- 201811528 春名航亨 <[s1811528@s.tsukuba.ac.jp](mailto:s1811528@s.tsukuba.ac.jp)>
  - 情報学群 知識情報・図書館学類 3年次
- 2020/06/14 編集・提出

## 課題1: data0511.xmlをtsvに変換する2tsv.xsl


以下に作成した`2tsv.xsl`のコードを示す。
なお表見出し行を1行目に挿入し、publisherの欠損値にNoDataを挿入している。
また月日が一桁の場合、0を補完している。

```xsl
<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="text" encoding="utf-8" />
    <xsl:template match="/">
        <xsl:text>タイトル&#x9;著者&#x9;出版社&#x9;価格&#x9;出版年月日&#xa;</xsl:text>
        <xsl:apply-templates select="//item" />
    </xsl:template>

    <xsl:template match="item">
        <xsl:value-of select="normalize-space(title)" />
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="normalize-space(creator)" />
        <xsl:text>&#x9;</xsl:text>
        <xsl:choose>
            <xsl:when test="publisher[not(node())]">
                <xsl:text>NoData</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="normalize-space(publisher)" />
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="price" />
        <xsl:text>&#x9;</xsl:text>
        <xsl:value-of select="concat(date/year,'-',
                                     format-number(date/month, '00'),'-',
                                     format-number(date/day, '00'))" />
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
```

<br>
<br>
<br>
<br>
<br>

## 課題2: Rubyスクリプトの中でXSLTスタイルシートを利用

まず`ruby xslt-test01.rb input.xsl input.xml`のように実行する`xslt-test01.rb`を作成した。

```ruby
require 'xslt'
# $ gem install libxslt-ruby

puts->(xsl, xml){
LibXSLT::XSLT::Stylesheet.new(
    LibXML::XML::Document.file(xsl)
).apply(
    XML::Document.file(xml)
)
}.call($*[0], $*[1])
```

またCGIで表示する際にヘッダを挿入する`xslt-test02.rb`を作成した。

```ruby
require 'cgi'
require 'xslt'

cgi = CGI.new

puts cgi.header("text/html; charset=UTF-8"), ->(xsl, xml){
LibXSLT::XSLT::Stylesheet.new(
    LibXML::XML::Document.file(xsl)
).apply(
    XML::Document.file(xml)
)
}.call($*[0], $*[1])
```

上記のRubyの2ファイルは前回の`sample6-3.xsl`と`index.rss`を引数に与えて実行を確認した。

## 課題3: 本課題の感想/質問

今回の課題を行ったあと、全学計算機上でRubyCGIでRSSを処理するプログラムを作成してみたが、思いのほか簡単に作成できた。最終課題で作成するコンテンツに生かしたい。
