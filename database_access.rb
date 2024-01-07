# The Ruby DBI module provides a database-independent interface for Ruby scripts. DBI stands for Database Independent Interface for Ruby, which means DBI provides an abstraction layer between the Ruby code and the underlying database, allowing you to switch database implementations really easily. It defines a set of methods, variables, and conventions that provide a consistent database interface, independent of the actual database being used.

# * ADO (ActiveX Data Objects)
# * DB2
# * Frontbase
# * mSQL
# * MySQL
# * ODBC
# * Oracle
# * OCI8 (Oracle)
# * PostgreSQL
# * Proxy/Server
# * SQLite
# * SQLRelay

require 'active_record'

# Establish a connection to the SQLite database (in-memory for this example)
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

class User < ActiveRecord::Base
end

=begin
# * In bash run this command to generate a migration file
ruby -r active_record -e "ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:'); ActiveRecord::Migration.create_table(:users) { |t| t.string :name; t.string :email }; ActiveRecord::Migrator.migrate('db/migrate')"
=end


=begin
# * Run the migration to create the users table:
ruby -r './app' -e "ActiveRecord::Migrator.migrate('db/migrate')"
=end


# Create a new user
user = User.create(name: 'John Doe', email: 'john@example.com')

# Find a user by name
found_user = User.find_by(name: 'John Doe')

# Update user's email
found_user.update(email: 'john.doe@example.com')

# Delete the user
found_user.destroy
