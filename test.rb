require 'webrick'

server = WEBrick::HTTPServer.new({
  DocumentRoot: '.',
  BindAddress:    "0.0.0.0",
  Port:           8080,
  CGIInterpreter: WEBrick::HTTPServlet::CGIHandler::Ruby,
  
})

server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')

server.mount('/indicate.cgi', WEBrick::HTTPServlet::CGIHandler, 'indicate.rb')

server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')

server.mount('/goya_ver2.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya2.rb')

server.start