
USE CodeFirst

INSERT INTO Authors ([Name]) VALUES
('Robert J. Williams'),
('Tracy Smith'),
('Karen Hawkins')

INSERT INTO Tags ([Name]) VALUES ('Python'), ('Web'), ('Web APIs'), ('Programming')

INSERT INTO Courses
SELECT
	[Title] = 'Introduction to Web APIs',
	[Description] = 'A straightforward course on Developing Web APIs',
	[Level] = 1,
	[FullPrice] = 150.00,
	Authors.Id AS 'Author_Id',
	Categories.Id AS 'Category_Id'
FROM Authors, Categories
WHERE
	Authors.Name = 'Robert J. Williams' AND
	Categories.Name = 'Web Development'

INSERT INTO Courses
SELECT
	[Title] = 'Advanced Python',
	[Description] = 'Learn all there is to Python',
	[Level] = 3,
	[FullPrice] = 219.99,
	Authors.Id AS 'Author_Id',
	Categories.Id AS 'Category_Id'
FROM Authors, Categories
WHERE
	Authors.Name = 'Karen Hawkins' AND
	Categories.Name = 'Programming Languages'

INSERT INTO TagCourses
SELECT
	Tags.Id AS 'Tag_Id',
	Courses.Id AS 'Course_Id'
FROM Courses, Tags
WHERE
	Courses.Title = 'Introduction to Web APIs' AND
	Tags.Name IN ('Web', 'Web APIs', 'Programming')

INSERT INTO TagCourses
SELECT
	Tags.Id AS 'Tag_Id',
	Courses.Id AS 'Course_Id'
FROM Courses, Tags
WHERE
	Courses.Title = 'Advanced Python' AND
	Tags.Name IN ('Python', 'Programming')

-- SELECT * FROM Authors
-- SELECT * FROM Courses
-- SELECT * FROM Categories
-- SELECT * FROM Tags
-- SELECT * FROM TagCourses
