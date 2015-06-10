Objective: You are going to build an ORM, which stands for <a href="http://en.wikipedia.org/wiki/Object-relational_mapping">Object Relational Mapper</a>. ORM's are super powerful tools that abstract away raw SQL statements, giving you access to methods for searching, sorting, associating, just to name a few. Ruby on Rails is powered by an ORM called Active Record, which is what makes Rails so awesome.

Right now your ORM Student class has the ability to:

1. Insert students into the database with their associated attributes.
2. Delete students from the database.
3. Create a new instance of a student from the database.(Students will exist in the database in a row, you will create an instance (object) so you can use that object.)
4. Find a student by their name or id.
5. Update a student's attributes in the database and have it persist(continue to exist).
6. Add a course to a student.

After completing this lab, your Course, Department and Registration classes will have similar functionality. In order to make them talk to each other, you will have to use an <a href="http://www.sql-join.com/">SQL join</a> 
<img src="join.png"> 

For example, you will be able to find all courses by department and let students register for classes, utilizing a join.

Use your Student class and the specs as a guide to complete the lab.


