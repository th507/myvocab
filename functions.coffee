###
Add more links to vocabuary.com word page.
Created by tux, Sat Feb  8 23:48:59 CST 2014
###

DEBUG = true
DEBUG = false

container = "div.wordPage"

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
  {
    'name': 'Google Images',
    'link': 'http://images.google.com/images?q='
  }
]

mangle = () ->
  # First remove existing elements then add them again.
  $("#{ container } a.ext-link").remove()
  word = $.trim $("#{ container } h1").text()
  links = ("<a target='_blank' class='ext-link' href='#{ site["link"] }#{ word }'>#{ site["name"] }</a>" for site in sites)
  if DEBUG
    console.log "word: #{ word }"
    console.log links

  $(link).appendTo "#{ container } div.tools" for link in links

DOMModificationHandler = ->
  # http://stackoverflow.com/q/11084819
  $(this).unbind "DOMSubtreeModified"
  setTimeout (->
    mangle()
    $(container).bind "DOMSubtreeModified", DOMModificationHandler
  ), 4000
$(container).bind "DOMSubtreeModified", DOMModificationHandler

# This is for mangling the page after the page content is changed by ajax requests.
# dbclick does not work.
$(document).click mangle
