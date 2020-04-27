#!/usr/bin/python3
import copy
# https://ja.wikipedia.org/wiki/XSL_Transformations#%E3%83%86%E3%83%B3%E3%83%97%E3%83%AC%E3%83%BC%E3%83%88%E9%96%A2%E6%95%B0
"""
<?xml version="1.0" encoding="ISO-8859-1" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
但しxpathはx""とする
"""
def string_replaceall(      # <xsl:template name="String_replaceAll">
    this=match(xml,x"''"),  # <xsl:param name="this" select="''" />
    substring="",           # <xsl:param name="substring" />
    replacement=""          # <xsl:param name="replacement" />
  )
  if not this == nil: # <xsl:if test="not ($this='')"><xsl:choose>
    if substring in this: # <xsl:when test="contains ($this, $substring)">
      print(substring-before(this, substring)) # <xsl:value-of select="substring-before ($this, $substring)" />
      print(replacement)                       # <xsl:copy-of select="$replacement" /> - 指定ノード以下の全要素をコピーし結果ツリーに出力
      string_replaceall(                       # <xsl:call-template name="String_replaceAll">
        this=substring-after(this, substring), # <xsl:with-param name="this" select="substring-after ($this, $substring)" />
        substring=substring,                   # <xsl:with-param name="substring" select="$substring" />
        replacement=replacement                # <xsl:with-param name="replacement" select="$replacement" />
      ) # </xsl:call-template>
    # </xsl:when>
    else: # <xsl:otherwise>
      print(this) # <xsl:value-of select="$this" /> - 指定された表現の内容が出力
    # </xsl:otherwise>
  # </xsl:choose></xsl:if>
# </xsl:template>
# </xsl:stylesheet>
