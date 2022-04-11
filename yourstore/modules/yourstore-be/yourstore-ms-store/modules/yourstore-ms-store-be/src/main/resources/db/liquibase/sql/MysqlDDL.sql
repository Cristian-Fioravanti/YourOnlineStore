CREATE TABLE utente (
	user_id INTEGER NOT NULL,
	oauth_id INTEGER UNIQUE,
	name VARCHAR(80),
	surname VARCHAR(80),
	email VARCHAR(80),
	is_admin BOOLEAN
);
CREATE TABLE ordine (
	order_id INTEGER NOT NULL,
	date DATE,
	total_cost INTEGER,
	address VARCHAR(80),
	user_id INTEGER  NOT NULL 
);
CREATE TABLE order_item (
	amount INTEGER NOT NULL,
	order_id INTEGER  NOT NULL ,
	product_id INTEGER  NOT NULL 
);
CREATE TABLE product (
	product_id INTEGER NOT NULL
);
ALTER TABLE utente
	ADD PRIMARY KEY (user_id);
ALTER TABLE utente	
	MODIFY user_id INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE ordine
	ADD PRIMARY KEY (order_id);
ALTER TABLE ordine	
	MODIFY order_id INTEGER NOT NULL AUTO_INCREMENT;
ALTER TABLE product
	ADD PRIMARY KEY (product_id);
ALTER TABLE order
	ADD CONSTRAINT FK_order__user FOREIGN KEY (user_id) REFERENCES utente(user_id);
ALTER TABLE order_item
	ADD CONSTRAINT FK_order_item__order FOREIGN KEY (order_id) REFERENCES ordine(order_id);
ALTER TABLE order_item
	ADD CONSTRAINT FK_order_item__product FOREIGN KEY (product_id) REFERENCES product(product_id);

