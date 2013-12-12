compressedDOM = "html{head{title:This works}}body{p:I think"
expectedHTML = "<html><head><title>This works</title></head><body><p>I think</p></body></html>"

describe "minidom", ->
  # it "has a benchmark", ->
  #   # this obviously not real right now

  #   # { is nested, } closes nesting. closing tags are implicit at the end of the doc to save a few bytes
    
    

  #   console.log "compressed bytes:  ", compressedDOM.length
  #   console.log "expanded bytes:    ", expectedHTML.length
  #   console.log "compression ratio: ", (compressedDOM.length / expectedHTML.length * 100).toFixed(2)

  #   expect( true ).toBe( false )


  it "can inflate a purely nested string", ->
    expect(
      Minidom.inflate "html{head{title"
    ).toBe(
      "<html><head><title></title></head></html>"
    )


  it "can inflate a string with siblings", ->
    expect(
      Minidom.inflate "html{head{title|meta|script"
    ).toBe(
      "<html><head><title></title><meta></meta><script></script></head></html>"
    )


  it "can inflate a string with close tags", ->
    expect(
      Minidom.inflate "html{head{title}body{p"
    ).toBe(
      "<html><head><title></title></head><body><p></p></body></html>"
    )


  it "can inflate a string with text nodes", ->
    expect(
      Minidom.inflate "div{p:This is a string"
    ).toBe(
      "<div><p>This is a string</p></div>"
    )
