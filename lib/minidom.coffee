class Node
  constructor: (@name) ->
    @children = []

  toString: ->
    childrenStr = @children.map( (c) -> c.toString() ).join('')
    "<#{@name}>#{childrenStr}</#{@name}>"



@Minidom =

  inflate: (str) ->
    root = new Node
    stack = [root]

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


    # lastOperator = "{" # '{' so that first node is root's child
    lastOperator = "{"
    
    for token in tokens
      if /^[a-zA-Z\s]+$/.test token
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
        # else
        #   throw new Error("invalid operator: #{token} (i think)")

    # console.log JSON.stringify root, null, 2

    root.children[0].toString()