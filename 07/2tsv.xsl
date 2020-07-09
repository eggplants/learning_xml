<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text" encoding="utf-8"/>
  <xsl:template match="/">
    <xsl:text>タイトル	著者	出版社	価格	出版年月日
</xsl:text>
    <xsl:apply-templates select="//item"/>
  </xsl:template>
  <xsl:template match="item">
    <xsl:value-of select="normalize-space(title)"/>
    <xsl:text>	</xsl:text>
    <xsl:value-of select="normalize-space(creator)"/>
    <xsl:text>	</xsl:text>
    <xsl:choose>
      <xsl:when test="publisher[not(node())]">
        <xsl:text>NoData</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="normalize-space(publisher)"/>
      </xsl:otherwise>
    </xsl:choose>
    <xsl:text>	</xsl:text>
    <xsl:value-of select="price"/>
    <xsl:text>	</xsl:text>
    <xsl:value-of select="concat(date/year,'-',                                     format-number(date/month, '00'),'-',                                     format-number(date/day, '00'))"/>
    <xsl:text>
</xsl:text>
  </xsl:template>
</xsl:stylesheet>
),'-',
                                    format-number(date/day, '00'))" />
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>