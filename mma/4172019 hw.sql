Select i.OrderNumber, i.orderdate, i.customername, p.Code, p.description, p.price, l.Quantity, i.Total as 'Total'
	From LineItem l
    INNER JOIN invoice i on i.ID = l.invoiceID
    INNER JOIN product p on p.ID = l.productID;