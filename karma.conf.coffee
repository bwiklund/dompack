module.exports = (config) ->
  config.set
    
    basePath: ""
    
    frameworks: ["jasmine"]

    preprocessors:
      "*.coffee": ["coverage"]
      "test.coffee": ["coffee"]

    files: [
      "minidom.coffee"
      "spec.coffee"
    ]
    
    exclude: []
    
    reporters: ["progress","coverage"]

    coverageReporter:
      type: 'html'
      dir: '.coverage'
    
    port: 9876
    
    colors: true
    
    logLevel: config.LOG_INFO
    
    autoWatch: true
    
    browsers: ["PhantomJS"]
    
    captureTimeout: 60000
    
    singleRun: false

