class Student

  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]
  attr_reader :id
  attr_accessor :name, :grade
  def initialize(name,grade,id=nil)
    @id = id
    @name = name
    @grade = grade
  end
  def self.create_table
      sql = <<-SQL 
      CREATE TABLE IF NOT EXISTS students (
<<<<<<< HEAD
      id INTEGER PRIMARY KEY,
=======
      id INT PRIIMARY KEY,
>>>>>>> 150544f23b0ded001e0669cdc253f29b9aa9ae7c
      name TEXT,
      grade TEXT)
      SQL
      DB[:conn].execute(sql)
  end
  def self.drop_table
    sql = <<-SQL 
      DROP TABLE IF EXISTS students;
      SQL
      DB[:conn].execute(sql)
  end
  def save
    sql = <<-SQL
      INSERT INTO students (name, grade)
      VALUES (?, ?)
    SQL

    DB[:conn].execute(sql, self.name, self.grade)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0]
  end
<<<<<<< HEAD
  def self.create(name:,grade:)
    student = Student.new(name, grade)
    student.save
    student
  end
=======
>>>>>>> 150544f23b0ded001e0669cdc253f29b9aa9ae7c

end
