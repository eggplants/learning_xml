# 第三回

## XPath

- XML Path Language
- XML文書の中の特定のノード集合を指し示すための記法
- XSLTではmatch属性やselect属性で利用

## 記法

- ルートは`/`
- 親は`..`
- 要素`<foo />`はそのまま要素名`foo`で
- 要素`<item no="2">`の属性ノードは`item/@no`で
- テキストノードは`text()`
- 子孫ノードの中の指定したすべての要素は`/books//title/`で取得

## 絶対と相対

### 絶対ロケーションパス

- ルートノードが起点
- `/books/metadata`

### 相対ロケーションパス

- カレントノードが起点
- `item/title`

## 条件(t/fでこたえられる述語:Predicate)

- 記法は`.../属性名か要素名のノードテスト[述語式]/...`

```xpath
/books/item[publisher='小学館']
/books/item[date/year=2013]
/books/item[@no &lt;= 50]
```

### 位置による条件付け

- 述部が正の整数だとn番目の要素参照
- `item[2]`とか`/books/item[3]/title`

### 要素による条件付け

- 述部がノードテストだと要素が子孫に存在するかどうか判定
- `item[title]`とか`/books[item/title]`
- 要素が特定の値（文字列、数値等）を持つ
  - `item[publisher='小学館']`

### 属性による条件付け

- ある属性が存在するか
  - `/books/item[@no]`とか`/books[item/@no]`

- ある属性が特定の値（文字列、数値等）を持つか
  - `item[@no='5']`とか`item[@no &lt; '10']`

## 記法のいろいろ

### 述語の繰り返し可能

- `ノードテスト[述語][述語]...[述語]`
- `item[publisher=’小学館’][2]`

### 述語の入れ子

- `/books[item[140]]`

### 演算子

#### 比較: `=`, `!=`, `<`, `>`, `<=`, `>=`

- `<`は`&lt;`, `>`は`&gt;`と記述

#### 論理: `and`, `or`

- `item[title andauthor]/articles`
- `[metadata/title ormetadata/publisher]`

#### 数値演算: `＋`, `-`, `＊`, `div`, `mod`

## 関数

### ノード集合関数

- `position()`
  - 何番目の子ノードであるかを返す
  - `<xsl:apply-templates select=”item[position()=3]”/>`

- `last()`
  - 現在のノード集合のノード数を返す
  - `<xsl:apply-templates select=”item[last()]”/>`

- `count(node-set)`
  - 指定されたノード集合の大きさを返す
  - `<xsl:value-of select=”count(item)” />`

### 文字列関数

- `concat(p1, p2,..., pn)`
  - 文字列を連結する

- `concat(name, '(', …)`
- `contains(p1, p2)`
  - p1がp2を含んでいれば真を返す
  - `item[contains(keywords/keyword, '小説')]`

- `starts-with(p1, p2)`
  - p1がp2で始まっていれば真を返す

- `substring(p, m, n)`
  - 文字列pのm番目の文字からn文字を抽出する
  - `<xsl:value-of select="substring(title,8,5)"/>`

- `string-length(p)`

### ブール関数

- `boolean()`
- `true()`
- `false()`
- `not()`

### 数値関数

- `ceiling(数値)`
  - 指定された数値より小さくない最小の整数

- `floor(数値)`
  - 指定された数値より大きくない最大の整数

- `number(node)`

- `round(数値)`
  - 四捨五入

- `sum(node-set)`
  - 与えられた`node-set`の数値の合計
