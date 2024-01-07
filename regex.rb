string = "Karan Chauhan"
if string =~ /Karan/ # =~ to check if string contains a pattern
  puts "String contains your name"
else
  puts "String does not contain your name"
end


line = "Start to end"
if line =~ /^Start/ # '^' Matches the start of line
  puts "String starts with Start"
end

if line =~ /end$/ # '$' Matches the end of line
  puts "String ends with end"
end



fruit = "apple"
if fruit =~/[aeiou]/ # [] Matches any one of the enclosed characters
    puts "String contains a vowel"
end


#Quantifiers
# '*: Matches 0 or more occurrences.
# +: Matches 1 or more occurrences.
# '?': Matches 0 or 1 occurrence.
# {n}: Matches exactly n occurrences.
# {n,}: Matches n or more occurrences.
# {n,m}: Matches between n and m occurrences.

words = "abccc"
if words =~ /c{2,}/ # Matches 2 or more occurrences of 'c'
  puts "String contains at least 2 consecutive 'c's"
end


sum = "1+1=2"
if sum =~/\+/ # Matches a '+' character and '\' is used to escape the special character
  puts "String contains a '+' character"
end


name = "Name: Karan"
if match = /Name: (.*)/.match(name) # () is used to capture a group of characters
  puts "Name: #{match[1]}" # match[0] contains the whole string
end


greet = "Hello"
if greet =~ /hello/i # 'i' is used to make the match case insensitive
  puts "String contains Hello (case insensitive)"
end


i #ignore case
o # Performs #{} interpolations only once, the first time the regexp literal is evaluated.
x # Ignores whitespace and allows comments in regular expressions
m # Matches multiple lines, recognizing newlines as normal characters
u,e,s,n # Interprets the regexp as Unicode (UTF-8), EUC, SJIS, or ASCII. If none of these modifiers is specified, the regular expression is assumed to use the source encoding.
+ # Matches one or more occurrences of the preceding character, subexpression, or character class.
? # Matches zero or one occurrence of the preceding character, subexpression, or character class.
. # Matches any single character except a newline character.
* # Matches zero or more occurrences of the preceding character, subexpression, or character class.
^ # Matches beginning of line.
$ # Matches end of line.
() # Enclose subexpressions.
[] # Enclose a character class of single characters.
{} # Enclose a subexpression with repetition information.
| # Matches either the expression before or the expression after the operator.
\ # Escapes the next character.


# * Literal Characters
/ruby/ # Matches the string 'ruby'
¥ # Matches Yen sign. Multibyte characters are supported in Ruby 1.9 and Ruby 1.8.


# * Characters Classes
/[Rr]uby/ #Matches "Ruby" or "ruby".
/rub[ye]/ #Matches "ruby" or "rube".
/[aeiou]/ #Matches any one lowercase vowel.
/[0-9]/ #Matches any digit; same as /[0123456789]/.
/[a-z]/ #Matches any lowercase ASCII letter.
/[A-Z]/ #Matches any uppercase ASCII letter.
/[a-zA-Z]/ #Matches any ASCII letter.
/[0-9a-f]/ #Matches any hexadecimal digit.
/[ \t\r\n\f]/ #Matches any whitespace character.
/[AEIOU]/ #Matches any uppercase vowel.
/[^aeiou]/ #Matches any character except a lowercase vowel.
/[^0-9]/ #Matches any non-digit character; same as /[^0123456789]/.
/[^aeiou]/ #Matches any character except a lowercase vowel.
/[^0-9a-f]/ #Matches any character except a hexadecimal digit.


# * Special Characters Classes
/./ # Matches any character except newline.
/./m # In multi-line mode, matches newline, too.
/\d/ # Matches a digit: /[0-9]/.
/\D/ # Matches a non-digit: /[^0-9]/.
/\s/ # Matches a whitespace character: /[ \t\r\n\f]/.
/\S/ # Matches non-whitespace: /[^ \t\r\n\f]/.
/\w/ # Matches a single word character: /[A-Za-z0-9_]/.
/\W/ #Matches a non-word character: /[^A-Za-z0-9_]/.


# * Repetition Cases
/ruby?/ #Matches "rub" or "ruby": the y is optional.
/ruby*/ #Matches "rub" plus 0 or more ys.
/ruby+/ #Matches "rub" plus 1 or more ys.
/\d{3}/ #Matches three consecutive digits.
/\d{3,}/ #Matches three or more consecutive digits.
/\d{3,5}/ #Matches three, four, or five consecutive digits.


# * Non Greedy Repetition
/<.*>/ #Greedy repetition: matches "<ruby>perl>".
/<.*?>/ #Non-greedy: matches "<ruby>" in "<ruby>perl>".


# * Grouping with Parentheses
/\D\d+/ #No group: + repeats \d.
/(\D\d)+/ #Grouped: + repeats \D\d pair.
/([Rr]uby(, )?)+/ #Match "Ruby", "Ruby, ruby, ruby", etc.


# * Back References
/([Rr])uby&\1ails/ #Matches "Ruby&rails" or "ruby&ails".
/(['"])(?:(?!\1).)*\1/ #Single or double-quoted string. \1 matches whatever the 1st group matched . \2 matches whatever the 2nd group matched, etc.


# * Alternatives
/ruby|rube/ #Matches "ruby" or "rube".
/rub(y|le))/ #Matches "ruby" or "ruble".
/ruby(!+|\?)/ #Matches "ruby" followed by one or more ! or one ?.


# * Anchors
/^Ruby/ #Matches "Ruby" at the start of a string or internal line.
/Ruby$/ #Matches "Ruby" at the end of a string or line.
/\ARuby/ #Matches "Ruby" at the start of a string.
/Ruby\Z/ #Matches "Ruby" at the end of a string.
/\bRuby\b/ #Matches "Ruby" at a word boundary.
/\brub\B/ #Matches "rub" at a non-word boundary.
/Ruby(?=!)/ #Positive lookahead assertion: Ruby followed by "!".
/Ruby(?!!)/ #Negative lookahead assertion: Ruby not followed by "!".


# * Special Syntax with Parentheses
phone = "2004-959-559 #This is Phone Number"

# Delete Ruby-style comments
phone = phone.sub!(/#.*$/, "")
puts "Phone Num : #{phone}"

# Remove anything other than digits
phone = phone.gsub!(/\D/, "")
puts "Phone Num : #{phone}"

# Result: Phone Num : 2004-959-559, Phone Num : 2004959559
