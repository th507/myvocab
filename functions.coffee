###
Add more links to vocabuary.com word page.
Created by tux, Sat Feb  8 23:48:59 CST 2014
###

DEBUG = true
DEBUG = false

# FIXME: doesn't work when the page is changed via ajax.

container = "div.wordPage"
word = $("#{ container } h1").text()

if DEBUG
  console.log "word: #{ word }"

sites = [
  {
    'name': 'Dictionary.com',
    'link': 'http://dictionary.reference.com/browse/',
  },
  {
    'name': 'Etymology',
    'link': 'http://etymonline.com/index.php?search=',
  },
  {
    'name': 'Youdao',
    'link': 'http://dict.youdao.com/search?q=',
  },
]

links = ("<a target='_blank' class='ext-link' href='#{ site["link"] }#{ word }'>#{ site["name"] }</a>" for site in sites)

if DEBUG
  console.log links

mangle = () ->
  $(link).appendTo "div.tools" for link in links

mangle()
