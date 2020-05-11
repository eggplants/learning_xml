<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" version="4.01" encoding="UTF-8" indent="yes" />
  <xsl:template match="/">
    <html lang="ja">
      <head>
        <meta charset="utf-8" />
        <meta name="description" content="サンプル書誌データ一覧." />
        <meta name="keywords" content="マークアップ言語,筑波大学" />
        <meta name="author" content="春名航亨" />
        <meta name="twitter:card" content="summary" />
        <meta name="twitter:creator" content="@egpl0" />
        <meta name="twitter:site" content="@egpl0" />
        <meta property="og:url" content="https://www.u.tsukuba.ac.jp/~s1811528/markup/bib.html" />
        <meta property="og:title" content="サンプル書誌データ一覧." />
        <meta property="og:description" content="サンプル書誌データ一覧." />
        <meta property="og:image" content="https://www.u.tsukuba.ac.jp/~s1811528/selfie.png" />
        <title>
          <xsl:value-of select="books/metadata/title" />
        </title>
        <link rel="icon" type="image/x-icon" href="https://www.u.tsukuba.ac.jp/~s1811528/fav.ico" />
        <!-- 
            <script type="text/javascript" charset="utf-8" src="openWindow.js"></script>
            <link rel="stylesheet" type="text/css" href=""/>
        -->
        </head>
        <body>
          <h1>
            <xsl:value-of select="books/metadata/title" />
          </h1>
          <hr />
          <div>
          作成日：            <xsl:value-of select="books/metadata/date_created" />
          </div>
          <div>
            <xsl:value-of select="count(books/item)" />
          件のメタデータ
          </div>
          <hr />
          <xsl:apply-templates select="books/item" />
        </body>
      </html>
    </xsl:template>

    <xsl:template match="item">
      <details>
        <summary>
        No.<xsl:value-of select="@no" />
：        <xsl:value-of select="title" />
      </summary>
      <table>
        <tr>
          <td>管理番号:</td>
          <td>
            <xsl:value-of select="@no" />
          </td>
        </tr>
        <tr>
          <td>題名:</td>
          <td>
            <xsl:value-of select="title" />
          </td>
        </tr>
        <tr>
          <td>著者:</td>
          <td>
            <xsl:value-of select="creator" />
          </td>
        </tr>
        <tr>
          <td>出版社:</td>
          <td>
            <xsl:value-of select="publisher" />
          </td>
        </tr>
        <tr>
          <td>説明:</td>
          <td>
            <details>
              <summary>説明表示</summary>
              <xsl:value-of select="description" />
            </details>
            <button onclick="openWindow()">
             別ウィンドウで読む
            </button>
            <script>
              function openWindow(){
                <![CDATA[
                  n = window.open("", "Newwindow","width=280,height=480");
	                n.document.open();
	                n.document.write('<html lang="ja"><head>');
	                n.document.write("<title>]]><xsl:value-of select="title" /><![CDATA[の内容詳細</title>");
	                n.document.writeln("<body>");
	                n.document.write(`]]><xsl:value-of select="description" /><![CDATA[`);
	                n.document.write("</body></html>");
	                n.document.close();
                }]]>
            </script>
          </td>
        </tr>
        <tr>
          <td>価格:</td>
          <td>
            <xsl:value-of select="price" />
          </td>
        </tr>
        <tr>
          <td>出版日時:</td>
          <td>
            <xsl:apply-templates select="date" />
          </td>
        </tr>
        <tr>
          <td>ISBN:</td>
          <td>
            <xsl:value-of select="isbn" />
          </td>
        </tr>
        <tr>
          <td>キーワード:</td>
          <td>
            <xsl:apply-templates select="keywords" />
          </td>
        </tr>
        <tr>
          <td>購入リンク:</td>
          <td>
            <xsl:apply-templates select="url" />
          </td>
        </tr>
      </table>
    </details>
  </xsl:template>

  <xsl:template match="date">
    <xsl:for-each select="./*">
      <xsl:value-of select="." />
      <xsl:if test="not(position() = last())">/</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="keywords">
    <xsl:for-each select="keyword">
      <xsl:value-of select="." />
      <xsl:if test="not(position() = last())">,</xsl:if>
    </xsl:for-each>
  </xsl:template>

  <xsl:template match="url">
    <xsl:variable name="link" select="@resource"/>
    <xsl:variable name="minus_http" select="substring-after($link,'//')"/>
    <a href="{$link}">
      <xsl:value-of select="substring-before($minus_http,'/')"/>
    </a>
  </xsl:template>
</xsl:stylesheet>