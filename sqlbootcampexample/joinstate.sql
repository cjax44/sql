
Select c.Name, c.City, s.Name as 'State'
	From Customer c
    JOIN State s
    on s.StateCode = c.State;