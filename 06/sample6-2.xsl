<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:rss="http://purl.org/rss/1.0/" xmlns:dc="http://purl.org/dc/elements/1.1/" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:key name="subject" match="/rdf:RDF/rss:item/dc:subject/text()" use="."/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="rdf:RDF/rss:channel/rss:description"/>
        </title>
      </head>
      <body>
        <h1>
          <xsl:value-of select="/rdf:RDF/rss:channel/rss:description"/>
        </h1>
        <div>
          <xsl:value-of select="concat('日時：', /rdf:RDF/rss:channel/dc:date)"/>
        </div>
        <!--
                    https://stackoverflow.com/questions/2291567/how-to-use-xslt-to-create-distinct-values
                 -->
        <xsl:for-each select="/rdf:RDF/rss:item/dc:subject/text()[                                         generate-id() =                                             generate-id(                                                 key('subject',.)[1]                                             )                                         ]">
          <xsl:variable name="sub" select="."/>
          <h2>
            <xsl:value-of select="."/>
          </h2>
          <ul>
            <xsl:apply-templates select="/rdf:RDF/rss:item[dc:subject = $sub]"/>
          </ul>
        </xsl:for-each>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="rss:item">
    <li>
      <xsl:element name="a">
        <xsl:attribute name="href">
          <xsl:value-of select="rss:link"/>
        </xsl:attribute>
        <xsl:value-of select="rss:title"/>
      </xsl:element>
    </li>
  </xsl:template>
</xsl:stylesheet>
     <li>
            <xsl:element name="a">
                <xsl:attribute name="href">
                    <xsl:value-of select="rss:link" />
                </xsl:attribute>
                <xsl:value-of select="rss:title" />
            </xsl:element>
        </li>
    </xsl:template>

</xsl:stylesheet>