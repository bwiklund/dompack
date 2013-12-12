class Node
  constructor: (@name) ->
    @children = []

  toString: ->
    childrenStr = @children.map( (c) -> c.toString() ).join('')
    "<#{@name}>#{childrenStr}</#{@name}>"


# the least intresting class in the world... for now
class TextNode
  constructor: (@text) ->
  toString: -> @text


tokenize = (str) ->
  # this is not going to be the long term solution, but should
  # work fine for the mvp
  _tokens = str.split /\b/#/((?<=[\{\}\|\:])|(?=[\{\}\|\:]))/

  # connect on spaces
  tokens = []
  accum = []
  for token in _tokens
    if /[a-zA-Z\s]/.test token
      accum.push token
    else
      tokens.push accum.join ''
      accum.length = 0
      tokens.push token
  tokens.push accum

  tokens


buildTree = (tokens) ->
  root = new Node
  stack = [root]
  lastOperator = "{"
  for token in tokens
    if /^[a-zA-Z\s]+$/.test token
      if lastOperator == ":"
        stack[0].children.push new TextNode token
      else
        node = new Node token
        stack[0].children.push node
        stack.unshift node

    else
      lastOperator = token

      if token == "{"
        null
      else if token == "|"
        stack.shift()
      else if token == "}"
        stack.shift()
        stack.shift()

  root


@Minidom =
  inflate: (str) ->
    tree = buildTree tokenize str
    tree.children[0].toString()