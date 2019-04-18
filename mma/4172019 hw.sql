Select i.OrderNumber as 'PO#', i.orderdate as 'Date Ordered', i.customername as 'Customer', p.Code, p.description as 'Book Description', p.price as 'Price', l.Quantity, i.Total as 'Total'
	From LineItem l
    INNER JOIN invoice i on i.ID = l.invoiceID
    INNER JOIN product p on p.ID = l.productID;