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
    tokens = str.split /\b/

    lastOperator = "{" # '{' so that first node is root's child

    for token in tokens
      if /^[a-zA-Z\s]+$/.test token
        node = new Node token
        if lastOperator == "{"
          stack[0].children.push node
          stack.unshift node
        else if lastOperator == "|"
          stack.shift()
          stack[0].children.push node
          stack.unshift node
          
      else
        lastOperator = token

    # console.log JSON.stringify root, null, 2

    root.children[0].toString()