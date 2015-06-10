class Course
	attr_accessor :id, :name, :department_id

  def self.create_table
  	sql = <<-SQL
    CREATE TABLE IF NOT EXISTS courses (
      id INTEGER PRIMARY KEY,
      name TEXT,
      department_id TEXT
    )
    SQL

    DB[:conn].execute(sql)
  end

  def self.drop_table
  	sql = "DROP TABLE IF EXISTS courses"
    DB[:conn].execute(sql)
  end

  def attribute_values
    [name, department_id]
  end

  def insert
    sql = <<-SQL
      INSERT INTO courses
      (name, department_id)
      VALUES
      (?,?)
    SQL
    DB[:conn].execute(sql, attribute_values)

    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM courses")[0][0]
  end

  def self.new_from_db(row)
    self.new.tap do |s|
      s.id = row[0]
      s.name =  row[1]
      s.department_id = row[2]
    end
  end

  def self.find_by_name(name)
    sql = <<-SQL
      SELECT *
      FROM courses
      WHERE name = ?
      LIMIT 1
    SQL

    DB[:conn].execute(sql,name).map do |row|
      self.new_from_db(row)
    end.first
  end

  def self.find_all_by_department_id(department_id)
  	sql = <<-SQL
      SELECT *
      FROM courses
      WHERE department_id = ?
    SQL

    DB[:conn].execute(sql,department_id).map do |row|
      self.new_from_db(row)
    end

  end

  def update
    sql = <<-SQL
      UPDATE courses
      SET name = ?,department_id = ?
      WHERE id = ?
    SQL
    DB[:conn].execute(sql, attribute_values, id)
  end


end
