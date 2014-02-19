require 'sqlite3'
require_relative '../lib/student'
require_relative '../lib/department'

DB = {:conn => SQLite3::Database.new("db/school.db")}
