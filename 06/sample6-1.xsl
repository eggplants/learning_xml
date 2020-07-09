<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <list>
      <xsl:apply-templates select="list/item"/>
    </list>
  </xsl:template>
  <xsl:template match="item">
    <xsl:element name="{name}">
      <xsl:attribute name="id">
        <xsl:value-of select="@id"/>
      </xsl:attribute>
      <xsl:attribute name="pref">
        <xsl:value-of select="pref"/>
      </xsl:attribute>
      <xsl:value-of select="price"/>
    </xsl:element>
  </xsl:template>
</xsl:stylesheet>
te>
            <xsl:value-of select="price" />
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
