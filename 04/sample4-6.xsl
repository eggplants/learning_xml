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
        <xsl:value-of select="p1+p2" />
      </xsl:when>
      <xsl:when test="@operator='sub'">
        <xsl:value-of select="p1 - p2" />
      </xsl:when>
      <xsl:when test="@operator='multiply'">
        <xsl:value-of select="p1*p2" />
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
