
# OBJECTIVE: Insert MySQL data into an appropriate array/hash in Ruby
# Use sophian_test.iknow_15k
# Make an array of users. Each element of that array is itself a hash.
# The hash contains the following keys: user_id, date, study_time

require 'rubygems'
require 'mysql'

class UserStudyData

  def initialize
    @dbh = Mysql.real_connect("localhost", "root", "", "sophian_test")
  end

  def run
    q = ''
    q = <<-QUERY
    SELECT  iknow_15k.user_id,
            iknow_15k.date,
            iknow_15k.study_time
    FROM iknow_15k
    QUERY
    
    # By User
    f_user = File.open("iknow_15k_ruby.csv", 'w')
    f_user.puts(['user_id', 'date', 'study_time'].join(','))

    # User Data
    users = query(q)
    t0 = Time.now.to_i
    index = 0

    puts "Found #{users.num_rows} users..."

    users.each do |user_id, date, study_time|
      user_id = user_id.to_i
      row = {
        :user_id     => user_id,
        :date        => date,
        :study_time  => study_time
      }

      f_user.puts([row[:user_id], row[:date], row[:study_time]].join(','))
    end

    f_user.close
    puts "Output written to iknow_15k_ruby.csv"
    puts "Total time spent: #{Time.now.to_i-t0} seconds"
  end

  private

  def query(q)
    @dbh.query(q)
  end

end

usd = UserStudyData.new
usd.run
