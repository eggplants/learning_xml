<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes" />
<xsl:template match="/">
  <html lang="ja">
    <body>
      <ul>
	      <xsl:apply-templates select="/books/item/" />
      </ul>
    </body>
  </html>
</xsl:template>

<xsl:template match="item">
  <li><xsl:value-of select="title" /></li>
</xsl:template>
</xsl:stylesheet>
