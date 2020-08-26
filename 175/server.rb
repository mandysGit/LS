require "socket"

server = TCPServer.new("localhost", 3003)

loop do
  # waits until someone sends a request to server,
  # server accepts the request and opens a connection to the client
  client = server.accept

  # gets the first line of client request
  request_line = client.gets
  puts request_line

  # sends first lien of client request to client so it appears in browser
  client.puts request_line
  client.close
end
