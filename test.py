from lxml.etree import*
import os
# import requests
""" xmlのパーステスト """
p=print # 環境は持ち運べない
parser = XMLParser(remove_blank_text=True)
tree = parse("./sample01/sample01.xsl")
p(tree.getroot(),tree.getroot().tag,sep="\n")
p(tostring(tree.getroot()))
