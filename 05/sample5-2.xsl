<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <output>
	        <xsl:apply-templates select="input/data" />
	    </output>
	</xsl:template>

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
		    	<xsl:with-param name="str" select="substring($str, 2)" />
			</xsl:call-template>
    	</xsl:if>
	</xsl:template>
</xsl:stylesheet>