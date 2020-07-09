<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="UTF-8"/>
  <xsl:template match="/">
    <html>
      <body>
        <table border="1">
          <tr>
            <th>ID</th>
            <th>品名</th>
            <th>産地</th>
            <th>値段</th>
          </tr>
          <xsl:apply-templates select="list/item">
            <xsl:sort select="ruby" data-type="text" lang="ja"/>
          </xsl:apply-templates>
        </table>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="item">
    <tr>
      <td>
        <xsl:value-of select="@id"/>
      </td>
      <td>
        <xsl:value-of select="name"/>
      </td>
      <td>
        <xsl:value-of select="pref"/>
      </td>
      <td><xsl:value-of select="price"/>円</td>
    </tr>
  </xsl:template>
</xsl:stylesheet>
