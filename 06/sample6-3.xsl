<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="utf-8"/>
  <xsl:template match="/">
    <html>
      <head>
        <title>
          <xsl:value-of select="rss/channel/title"/>
        </title>
        <xsl:element name="meta">
          <xsl:attribute name="name">
                        description
                    </xsl:attribute>
          <xsl:attribute name="content">
            <xsl:value-of select="rss/channel/description"/>
          </xsl:attribute>
        </xsl:element>
      </head>
      <body>
        <h1>
          <xsl:value-of select="concat('直近の更新:',                                           count(rss/channel/item) ,'件')"/>
        </h1>
        <ol>
          <xsl:apply-templates select="rss/channel/item"/>
        </ol>
      </body>
    </html>
  </xsl:template>
  <xsl:template match="item">
    <li>
      <details>
        <summary>
          <xsl:value-of select="title"/>
        </summary>
        <img src="{concat(substring(enclosure/@url, 0, 93),'&amp;surface=0')}"/>
        <ul>
          <li>
                        配布サイト:
                        <a href="{link}"><xsl:value-of select="link"/></a>
                    </li>
          <li>
            <xsl:value-of select="concat('更新日時　: ', pubDate)"/>
          </li>
        </ul>
      </details>
    </li>
  </xsl:template>
</xsl:stylesheet>
="{link}">
                            <xsl:value-of select="link" />
                        </a>
                    </li>
                    <li>
                        <xsl:value-of select="concat('更新日時　: ', pubDate)" />
                    </li>
                </ul>
            </details>
        </li>
    </xsl:template>

</xsl:stylesheet>