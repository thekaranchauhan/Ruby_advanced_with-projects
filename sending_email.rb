=begin
# ^ SMTP handles sending e-mail and routing e-mail between mail servers.
# ^ Ruby provides Net::SMTP class for client-side connection and provides two class methods new and start.

# * The new takes two parameters −
  # ^ The server name defaulting to localhost.
  # ^ The port number defaulting to the well-known port 25.

# * The start method takes these parameters −
# ^ The server − IP name of the SMTP server, defaulting to localhost.
# ^ The port − Port number, defaulting to 25.
# ^ The domain − Domain of the mail sender, defaulting to ENV["HOSTNAME"].
# ^ The account − Username, default is nil.
# ^ The password − User password, defaulting to nil.
# ^ The authtype − Authorization type, defaulting to cram_md5.

# * The start method takes these parameters −
# ^ The source − A string or array or anything with an each iterator returning one string at a time.
# ^ The sender − A string that will appear in the from field of the email.
# ^ The recipients − A string or an array of strings representing the recipients' addressee(s).
=end

require 'net/smtp'

message = <<MESSAGE_END
From: Private Person <me@fromdomain.com>
To: A Test User <test@todomain.com>
Subject: SMTP e-mail test

This is a test e-mail message.
MESSAGE_END

Net::SMTP.start('localhost') do |smtp|
  smtp.send_message message, 'me@fromdomain.com', 'test@todomain.com'
end



# ~ ##### Sending an HTML e-mail using Ruby #####
require 'net/smtp'

message = <<MESSAGE_END
From: karan Chauhan <fromabc@gmail.com>
To: A Test User <toxyz@gmail.com>
MIME-Version: 1.0
Content-type: text/html
Subject: SMTP e-mail test

This is an e-mail message to be sent in HTML format

<b>This is HTML message.</b>
<h1>This is headline.</h1>
MESSAGE_END

Net::SMTP.start('localhost', 1025) do |smtp| # ? Setup MailHog server in localhost by installing MailHog
  smtp.send_message message, 'fromabc@gmail.com', 'toxyz@gmail.com'
end


# ~ ##### Sending Attachments as an e-mail #####

require 'net/smtp'

filename = "/tmp/test.txt"
# Read a file and encode it into base64 format
filecontent = File.read(filename)
encodedcontent = [filecontent].pack("m")   # base64

marker = "AUNIQUEMARKER"
body = <<EOF
This is a test email to send an attachement.
EOF

# Define the main headers.
part1 = <<EOF
From: Private Person <me@fromdomain.net>
To: A Test User <test@todmain.com>
Subject: Sending Attachement
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary = #{marker}
--#{marker}
EOF

# Define the message action
part2 = <<EOF
Content-Type: text/plain
Content-Transfer-Encoding:8bit

#{body}
--#{marker}
EOF

# Define the attachment section
part3 = <<EOF
Content-Type: multipart/mixed; name = \"#{filename}\"
Content-Transfer-Encoding:base64
Content-Disposition: attachment; filename = "#{filename}"

#{encodedcontent}
--#{marker}--
EOF

mailtext = part1 + part2 + part3

# Let's put our code in safe area
begin
  Net::SMTP.start('localhost', 1025) do |smtp| # ? Setup MailHog server in localhost by installing MailHog
    smtp.sendmail(mailtext, 'me@fromdomain.net', ['test@todmain.com'])
  end
rescue Exception => e
  print "Exception occured: " + e
end
