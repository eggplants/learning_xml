<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    
    <xsl:template match="/">
        <output>
	        <xsl:apply-templates select="input/data[.!='']" />
	    </output>
	</xsl:template>

	<xsl:template match="data">
    	<data>
			<xsl:call-template name="split">
	    		<xsl:with-param name="cdr" select="normalize-space(text())" />
			</xsl:call-template>
    	</data>
	</xsl:template>

	<xsl:template name="split">
    	<xsl:param name="cdr" select="''" />
		<xsl:choose>
    		<xsl:when test="contains($cdr, ' ')">
				<word>
	    			<xsl:value-of select="substring-before($cdr,' ')" />
				</word>
				<xsl:call-template name="split">
			    	<xsl:with-param name="cdr" select="substring-after($cdr, ' ')" />
				</xsl:call-template>
			</xsl:when>
			<xsl:otherwise>
			 	<word>
	    			<xsl:value-of select="$cdr" />
				</word>
			</xsl:otherwise>
  		</xsl:choose>
	</xsl:template>

</xsl:stylesheet>
