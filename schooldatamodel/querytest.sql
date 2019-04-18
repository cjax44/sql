Select CONCAT(s.FirstName, ' ', s.LastName) as 'Student Name', CONCAT(s.streetaddress, ' ', s.city, ' ', s.state) as 'Address', s.email as 'Email', c.Name, CONCAT(i.first, ' ', i.last) as 'Instructor Name', e.Grade
	FROM enrollment e
    INNER JOIN student s
		on e.studentID = s.ID
	INNER JOIN course c
		on e.courseID = c.ID
	INNER JOIN instructor i
		on i.courseID = c.ID
	ORDER BY s.FirstName DESC;
    
    