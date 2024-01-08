#!/usr/bin/ruby
require 'cgi'

# * You can access the parameters FirstName and LastName using CGI#[] directly
cgi = CGI.new
cgi['FirstName'] # =>  ["Karan"]
cgi['LastName']  # =>  ["Chauhan"]


# * You can also access the parameters using CGI#params, which returns a hash
cgi = CGI.new
h = cgi.params  # =>  {"FirstName"=>["Karan"],"LastName"=>["Chauhan"]}
h['FirstName']  # =>  ["Karan"]
h['LastName']   # =>  ["Chauhan"]

cgi = CGI.new
cgi.keys        # =>  ["FirstName", "LastName"]


# ^ Ruby will take care of GET and POST methods automatically. There is no separate treatment for these two different methods.
cgi = CGI.new
cgi['name']        # => "Karan"
cgi.params['name'] # => ["Karan", "John", "Jai"]
cgi.keys           # => ["name"]
cgi.params         # => {"name"=>["Karan", "John", "Jai"]}


# ~ #####CREATING A SIMPLE HTML FORM#####
cgi = CGI.new("html4")
cgi.out {
  cgi.html {
      cgi.head { "\n"+cgi.title{"This Is a Test"} } +
      cgi.body { "\n"+
        cgi.form {"\n"+
            cgi.hr +
            cgi.h1 { "A Form: " } + "\n"+
            cgi.textarea("get_text") +"\n"+
            cgi.br +
            cgi.submit
        }
      }
  }
}
# ^ The form method of the CGI class can accept a method parameter, which will set the HTTP method ( GET, POST, and so on...) to be used on form submittal. The default, used in this example, is POST.
