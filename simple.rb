
# !/usr/bin/ruby -w
# simple.rb - simple MySQL script using Ruby MySQL module

require 'mysql'

begin
  # connect to the MySQL server
  dbh = Mysql.real_connect("localhost", "root", "", "sophian_test")

  # get server version string and display it
  puts "Server version: " + dbh.get_server_info
rescue Mysql::Error => e
  puts "Error code: #{e.errno}"
  puts "Error message: #{e.error}"
  puts "Error SQLSTATE: #{e.sqlstate}" if e.respond_to?("sqlstate")
ensure

  # process a simple SELECT statement
  
  res = dbh.query("SELECT COUNT(*) FROM iknow_15k")

  while row = res.fetch_row do
    printf "%s\n", row[0]
  end
  puts "Number of rows returned: #{res.num_rows}"

  res.free

  # disconnect from server
  dbh.close if dbh
end
