<?xml version="1.0" encoding="UTF-8"?>
<!-- DTD: xslt(XSL Transformations)のルート構造定義(今回は省略？) -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- XMLテンプレート: パース書式 -->
  <!-- 
matchとnameはどっちかいっこ
<xsl:template
     match="パターン(XPath)"
     name="あるテンプレート名"
     priority="優先度"
     mode="matchの重複時の別定義のためのモード名">

    ・・・テンプレート・・・

</xsl:template>
-->
  <xsl:output method="html" vrsion="4.01" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html lang="ja">
      <head>
        <title>練習用XML</title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="国/名前"/>
        </h1>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
