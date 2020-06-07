<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
    <xsl:output method="xml" encoding="UTF-8" indent="yes" />
    <xsl:param name="year" select="2000" />

    <xsl:template match="/">
        <output>
            <memo>PublishedYear: <xsl:value-of select="$year" /></memo>
            <xsl:apply-templates select="books/item[date[year=$year]]">
                <xsl:with-param name="year" select="$year" />
                <xsl:sort select="date/month" data-type="number" order="descending" />
                <xsl:sort select="date/day" data-type="number" order="descending" />
            </xsl:apply-templates>
        </output>
    </xsl:template>

    <xsl:template match="item">
        <item>
            <isbn><xsl:value-of select="isbn" /></isbn>
            <title><xsl:value-of select="title" /></title>
            <date>
                <xsl:value-of select="concat(date/year,'-',
                                      format-number(date/month, '00'),'-',
                                      format-number(date/day, '00'))" />
            </date>
            <creator><xsl:value-of select="creator" /></creator>
        </item>
    </xsl:template>

</xsl:stylesheet>
