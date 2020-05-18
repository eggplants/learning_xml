<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="UTF-8" />
    <xsl:template match="/">
        <html>
            <body>
                <h1>
                    <xsl:value-of select="concat(list/meta/shop, '商品一覧')" />
                </h1>
                <xsl:apply-templates select="/list"/>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="list">
        <h2>野菜</h2>
        <table border="1">
            <tr>
                <th>商品名</th>
                <th>価格</th>
            </tr>
            <xsl:for-each select="item[@category='野菜']">
                <tr>
                    <td><xsl:value-of select="name"/>(<xsl:value-of select="pref"/>)</td>
                    <td><xsl:value-of select="price"/>&#x5186;</td>
                </tr>
            </xsl:for-each>
        </table>
        <h2>果物</h2>
        <table border="1">
            <tr>
                <th>商品名</th>
                <th>価格</th>
            </tr>
            <xsl:for-each select="item[@category='果物']">
                <tr>
                    <td><xsl:value-of select="name"/>(<xsl:value-of select="pref"/>)</td>
                    <td><xsl:value-of select="price"/>&#x5186;</td>
                </tr>
            </xsl:for-each>
        </table>
    </xsl:template>
</xsl:stylesheet>