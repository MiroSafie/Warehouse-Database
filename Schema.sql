CREATE TABLE Products(
    ID INT NOT NULL,
    product VARCHAR(225) NOT NULL,
    balance INT NOT NULL,
    inventory_turnover INT NOT NULL,
    price INT NOT NULL,
    profit INT NOT NULL,
    PRIMARY KEY (ID) 
);

CREATE TABLE Product_positions(
    ID INT NOT NULL,
    position VARCHAR(225) NOT NULL,
    product_ID INT,
    balance_in_position INT NOT NULL,
    PRIMARY KEY(ID),
    FOREIGN KEY(product_ID) REFERENCES Products(ID)
);


CREATE TABLE Workers(
    ID INT NOT NULL,
    full_name VARCHAR(225) NOT NULL,
    hire_date DATE NOT NULL,
    end_date date,
    mail VARCHAR(225),
    phone VARCHAR(13),
    PRIMARY KEY (ID)
);


CREATE TABLE Customers(
    ID INT NOT NULL,
    PRIMARY KEY (ID) 
);

CREATE TABLE order_category(
    ID INT NOT NULL,
    CATEGORY VARCHAR(225)
    PRIMARY KEY (ID)
);

INSERT INTO order_category (ID,CATEGORY) VALUES
(1,"Online"),
(2,"Business"),
(3,"Cold"),
(4,"Internal");

CREATE TABLE Orders(
    ID INT NOT NULL,
    customer_ID INT,
    order_date DATE NOT NULL,
    order_state VARCHAR(225) NOT NULL,
    order_category INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (customer_ID) REFERENCES Customers(ID),
    FOREIGN KEY (order_category) REFERENCES order_category(ID)
);

CREATE TABLE Ordered_products(
    order_ID INT,
    product_ID INT,
    Product_position_ID INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_ID) REFERENCES Orders(ID),
    FOREIGN KEY (product_ID) REFERENCES Products(ID),
    FOREIGN KEY (Product_position_ID) REFERENCES Product_positions(ID)
);

CREATE TABLE Route(
    ID INT NOT NULL,
    duration TIME NOT NULL,
    destination VARCHAR(225) NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Sent_orders(
    Order_ID INT,
    Sent_date DATETIME NOT NULL,
    route_ID INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(ID),
    FOREIGN KEY (route_ID) REFERENCES Route(ID)
);

CREATE TABLE Incoming_shipments(
    ID INT NOT NULL,
    ETA DATETIME NOT NULL,
    price INT NOT NULL,
    PRIMARY KEY (ID)
);

CREATE TABLE Incoming_products(
    shipment_ID INT,
    product_ID INT,
    quantity INT NOT NULL,
    FOREIGN KEY (shipment_ID) REFERENCES Incoming_shipments(ID),
    FOREIGN KEY (product_ID) References Products(ID)
);

CREATE TABLE Events(
    ID INT NOT NULL,
    Event VARCHAR(225) NOT NULL,
    goal INT,
    PRIMARY KEY(ID)
);

INSERT INTO EVENTS (ID,Event,goal) VALUES
(1,"Online collection",100),
(2,"Business collection",70),
(3,"Cold collection",50),
(4,"Internal collection",50),
(5,"Packaging",60),
(6,"Stocking",NULL),
(7,"Lunch",NULL),
(8,"Clocked in",NULL),
(9,"Clocked out",Null);


CREATE TABLE Activity(
    Event_ID INT,
    Worker_ID INT,
    Start_time DATETIME NOT NULL,
    quata INT,
    FOREIGN KEY (Event_ID) REFERENCES Events(ID),
    FOREIGN KEY (Worker_ID) REFERENCES Workers(ID)
);

CREATE TABLE Work_schedule(
    date DATE NOT NULL,
    Worker_ID INT,
    hours TIME NOT NULL,
    start_time DATETIME NOT NULL,
    FOREIGN KEY(Worker_ID) REFERENCES Workers(ID)
);



#);
