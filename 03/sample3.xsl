<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>sample3</title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="concat(list/meta/shop, '商品一覧')"/>
        </h1>
        <ul>
          <!-- (A) -->
          <xsl:apply-templates select="/list/item[@category='野菜']/name[../price&lt;=200]"/>
        </ul>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="name">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>
  <xsl:template match="pref">
    <li>
      <xsl:value-of select="."/>
    </li>
  </xsl:template>
</xsl:stylesheet>
</xsl:template>

    <xsl:template match="pref">
        <li>
            <xsl:value-of select="." />
        </li>
    </xsl:template>

</xsl:stylesheet>
