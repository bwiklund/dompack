compressedDOM = "html{head{title|This works}}body{p|I think"
expectedHTML = "<html><head><title>This works</title></head><body><p>I think</p></body></html>"

describe "minidom", ->
  # it "has a benchmark", ->
  #   # this obviously not real right now

  #   # { is nested, } closes nesting. closing tags are implicit at the end of the doc to save a few bytes
    
    

  #   console.log "compressed bytes:  ", compressedDOM.length
  #   console.log "expanded bytes:    ", expectedHTML.length
  #   console.log "compression ratio: ", (compressedDOM.length / expectedHTML.length * 100).toFixed(2)

  #   expect( true ).toBe( false )


  it "can inflate an easy string", ->

    expanded = Minidom.inflate "html{head{title"

    expect( expanded ).toBe "<html><head><title></title></head></html>"