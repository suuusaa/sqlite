create table product (
    product_id integer primary key,
    product_name text NOT NULL,
    product_description text,
	product_price integer,
    product_stock integer,
    product_image text,
    category_id integer,
    supplier_id integer,
    foreign key (category_id) REFERENCES category(category_id),
    foreign key (supplier_id) REFERENCES supplier(supplier_id)
);

create table customer (
    customer_id integer primary key,
    customer_name text,
    customer_email text,
    customer_phone text,
    customer_address text
);

create table request (
    request_id integer primary key,
    request_date text,
    request_total integer,
    customer_id integer,
    request_status text,
    foreign key (customer_id) REFERENCES customer(customer_id)
);

create table category (
    category_id integer primary key,
    category_name text unique
);

create table review (
    review_id integer primary key,
    product_rating integer,
    comment text,
    reviwe_date text,
    product_id integer,
    customer_id integer,           
    foreign key (product_id) REFERENCES product(product_id),  
    foreign key (customer_id) REFERENCES customer(customer_id)  
);

create table supplier (
    supplier_id integer primary key,
    supplier_name text,
    supplier_contact text
);

create table request_detail (
    request_id integer,
    product_id integer,
    product_quantity integer,
    request_price integer,
    primary key (request_id, product_id),
    foreign key (request_id) REFERENCES request(request_id),
    foreign key (product_id) REFERENCES product(product_id)
);