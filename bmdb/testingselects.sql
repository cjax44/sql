SELECT CONCAT(a.firstname, a.lastname) as 'Name', m.title as 'Movie Title', g.name as 'Genre', c.role as 'Role'
	FROM Movie m
	INNER JOIN Credit c on m.ID = c.movieID
    INNER JOIN MovieGenre mg on m.ID = mg.movieID
    INNER JOIN Actor a on a.ID = c.actorID
    INNER JOIN Genre g on g.ID = mg.genreID;