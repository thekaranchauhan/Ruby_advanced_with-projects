# ^ A simple client program that connects to a server and prints out the server's response.

require 'socket'        # Sockets are in standard library

hostname = 'localhost'
port = 2000

s = TCPSocket.open(hostname, port)

while line = s.gets     # Read lines from the socket
  puts line.chop       # And print with platform line terminator
end
s.close                 # Close the socket when done


# ^ A simple server program that listens to connections; when it receives one, it sends a message and closes the connection.
require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
  client = server.accept        # Wait for a client to connect
  client.puts(Time.now.ctime)   # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.close                  # Disconnect from the client
}


# ^ Multi-CLient TCP Server
require 'socket'                 # Get sockets from stdlib

server = TCPServer.open(2000)    # Socket to listen on port 2000
loop {                           # Servers run forever
  client = server.accept        # Wait for a client to connect
  client.puts(Time.now.ctime)   # Send the time to the client
  client.puts "Closing the connection. Bye!"
  client.close                  # Disconnect from the client
}


# ^ A tiny web browser
require 'socket'

host = 'www.yourdomain.com'     # The web server
port = 80                           # Default HTTP port
path = "/index.htm"                 # The file we want

# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"

socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response at first blank line into headers and body
headers,body = response.split("\r\n\r\n", 2)
print body


# ^ To implement the similar web client, you can use a pre-built library like Net::HTTP for working with HTTP.
require 'net/http'                  # The library we need
host = 'www.tutorialspoint.com'     # The web server
path = '/index.htm'                 # The file we want

http = Net::HTTP.new(host)          # Create a connection
headers, body = http.get(path)      # Request the file
if headers.code == "200"            # Check the status code
  print body
else
  puts "#{headers.code} #{headers.message}"
end
