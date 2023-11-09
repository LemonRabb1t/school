REM   Script: Session 01
REM   cps

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee VARCHAR2(10) NOT NULL, 
    tax VARCHAR2(10) NOT NULL, 
    total VARCHAR2(10) NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES ('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', '30.15', '12.10', '50.24', 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',email 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee VARCHAR2(10) NOT NULL, 
    tax VARCHAR2(10) NOT NULL, 
    total VARCHAR2(10) NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES ('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', '30.15', '12.10', '50.24', 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
 
-- display no male customers 
SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',email 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee VARCHAR2(10) NOT NULL, 
    tax VARCHAR2(10) NOT NULL, 
    total VARCHAR2(10) NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES ('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', '30.15', '12.10', '50.24', 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer;

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',email 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee VARCHAR2(10) NOT NULL, 
    tax VARCHAR2(10) NOT NULL, 
    total VARCHAR2(10) NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES ('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', '30.15', '12.10', '50.24', 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee VARCHAR2(10) NOT NULL, 
    tax VARCHAR2(10) NOT NULL, 
    total VARCHAR2(10) NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES ('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', '30.15', '12.10', '50.24', 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking(billing_id, booking_id, bill_date, status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES ('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',email 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee INTEGER  NOT NULL, 
    tax INTEGER  NOT NULL, 
    total INTEGER NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', '11.14', '30.91', '110.91', 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',email 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id VARCHAR2(10) PRIMARY KEY, 
    ticket_number VARCHAR2(10) NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number VARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0102', '1' , 'Vip', 'A', '34', 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '25', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0107', '3' , 'Backstage', 'C', '66', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0103', '2' , 'General', 'B', '21', 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0104', '3' , 'Backstage', 'C', '69', 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES ('0106', '4' , 'General', 'D', '420', 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee INTEGER  NOT NULL, 
    tax INTEGER  NOT NULL, 
    total INTEGER NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id VARCHAR(10) NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard','0102' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', 11.14, 30.91, 110.91, 'Debit', 'Interact', '0103' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', '90.11', '13.81', '203.19', 'Debit', 'Visa', '0104' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', '91.23', '30.91', '0.91', 'Debit', 'Mastercard', '0105' );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', '28.41', '38.11', '21.54', 'Debit', 'Visa', '0106' );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',phone_no 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_numer, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
    ORDER BY section_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id integer PRIMARY KEY, 
    ticket_number integer NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number integerVARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0102, 1, 'Vip', 'A', 34, 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 25, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0107, 3 , 'Backstage', 'C', 66, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 21, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0104, 3 , 'Backstage', 'C', 69, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0106, 4 , 'General', 'D', 420, 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee float  NOT NULL, 
    tax float  NOT NULL, 
    total float NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id integer NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard',0102 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', 11.14, 30.91, 110.91, 'Debit', 'Interact', 0103 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', 90.11, 13.81, 203.19, 'Debit', 'Visa', 0104 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', 91.23, 30.91, 0.91, 'Debit', 'Mastercard', 0105 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', 28.41, 38.11, 21.54, 'Debit', 'Visa', 0106 );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',phone_no 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

SELECT * FROM customer;

CREATE TABLE ticket_type ( 
    ticket_id integer PRIMARY KEY, 
    ticket_number integer NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number integerVARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0102, 1, 'Vip', 'A', 34, 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 25, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0107, 3 , 'Backstage', 'C', 66, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 21, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0104, 3 , 'Backstage', 'C', 69, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0106, 4 , 'General', 'D', 420, 'Gojo and Geto reunion', '15/10/2024 20:43' );

SELECT * FROM ticket_type;

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee float  NOT NULL, 
    tax float  NOT NULL, 
    total float NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id integer NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard',0102 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', 11.14, 30.91, 110.91, 'Debit', 'Interact', 0103 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', 90.11, 13.81, 203.19, 'Debit', 'Visa', 0104 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', 91.23, 30.91, 0.91, 'Debit', 'Mastercard', 0105 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', 28.41, 38.11, 21.54, 'Debit', 'Visa', 0106 );

SELECT * FROM billingbooking;

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

SELECT * FROM showinfo;

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

SELECT * FROM ticket_distribution;

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id integer, 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * FROM ticket_restriction;

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',phone_no 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

CREATE TABLE ticket_type ( 
    ticket_id integer PRIMARY KEY, 
    ticket_number integer NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number integerVARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0102, 1, 'Vip', 'A', 34, 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 25, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0107, 3 , 'Backstage', 'C', 66, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 21, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0104, 3 , 'Backstage', 'C', 69, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0106, 4 , 'General', 'D', 420, 'Gojo and Geto reunion', '15/10/2024 20:43' );

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee float  NOT NULL, 
    tax float  NOT NULL, 
    total float NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id integer NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard',0102 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', 11.14, 30.91, 110.91, 'Debit', 'Interact', 0103 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', 90.11, 13.81, 203.19, 'Debit', 'Visa', 0104 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', 91.23, 30.91, 0.91, 'Debit', 'Mastercard', 0105 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', 28.41, 38.11, 21.54, 'Debit', 'Visa', 0106 );

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id integer, 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT StudentName, Degree 
FROM student 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',phone_no 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

DROP TABLE customer;

DROP TABLE ticket_type;

DROP TABLE billingbooking;

DROP TABLE ticket_restriction;

DROP TABLE ticket_distribution;

DROP TABLE showinfo;

CREATE TABLE customer( 
    customer_id VARCHAR2(50) PRIMARY KEY , 
    first_name VARCHAR2(50) NOT NULL , 
    last_name VARCHAR2(50) NOT NULL , 
    email VARCHAR2(100) NOT NULL , 
    phone_no VARCHAR2(30) NOT NULL, 
    DOB VARCHAR2(20) NOT NULL, --yyyymmdd 
    gender VARCHAR2(1) NOT NULL);

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111001', 'Git' , 'Hub', 'github@poul.com', '4166666666', '20110101' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB, gender) 
VALUES ('AAAA#111003', 'Do' , 'Le', 'mmmdonut@hole.com', '111111111', '20131102' ,'F');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('BBBB#100211', 'Sea' , 'Lantern', 'sealantern222@gmail.com', '20031211', '01012000' ,'O');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100311', 'Korean' , 'Barbeque', 'koreanbbq@hotmail.com', '437777777', '20000130' ,'M');

INSERT INTO customer(customer_id, first_name, last_name, email, phone_no, DOB,  gender) 
VALUES ('CCCC#100322', 'Orac' , 'Le', 'oracle@hotmail.com', '829372982', '20020419' ,'F');

CREATE TABLE ticket_type ( 
    ticket_id integer PRIMARY KEY, 
    ticket_number integer NOT NULL, 
    ticket_class VARCHAR2(100) NOT NULL, 
    section_number VARCHAR2(10) NOT NULL, 
    seat_number integerVARCHAR2(10) NOT NULL, 
    show_name VARCHAR2(500) NOT NULL, 
    show_time_date VARCHAR2(100) NOT NULL 
);

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0102, 1, 'Vip', 'A', 34, 'Beyonce’s back to school bash', '08/02/2023 10:10' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 25, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0107, 3 , 'Backstage', 'C', 66, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0103, 2 , 'General', 'B', 21, 'Taylor Swift and the Swift Moves she got', '09/20/2023 21:39' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0104, 3 , 'Backstage', 'C', 69, 'Bruno Mars is going to space', '12/10/2024 20:43' );

INSERT INTO ticket_type(ticket_id, ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date) 
VALUES (0106, 4 , 'General', 'D', 420, 'Gojo and Geto reunion', '15/10/2024 20:43' );

CREATE TABLE billingbooking ( 
    billing_id VARCHAR(20) PRIMARY KEY, 
    booking_id VARCHAR2(20) NOT NULL, 
    bill_date VARCHAR2(11) NOT NULL, 
    status VARCHAR2(10) NOT NULL, 
    service_fee float  NOT NULL, 
    tax float  NOT NULL, 
    total float NOT NULL, 
    payment_type VARCHAR2(30) NOT NULL, --Credit/Deb 
    payment_comp VARCHAR2(30) NOT NULL, -- mastercard, visa, interact 
    ticket_id integer NOT NULL 
);

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp,ticket_id) 
VALUES 						('AAAA#1111', 'ABAB#2222' , '08/30/2023', 'P', 30.15, 12.10, 50.24, 'Credit', 'Mastercard',0102 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('BBBB#1112', 'CCCC#4444' , '09/11/2034', 'W', 11.14, 30.91, 110.91, 'Debit', 'Interact', 0103 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('CDEF#1113', 'DDDD#5555' , '03/23/2000', 'P', 90.11, 13.81, 203.19, 'Debit', 'Visa', 0104 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('DDDDD#1112', 'EEEE#6666' , '09/11/2034', 'W', 91.23, 30.91, 0.91, 'Debit', 'Mastercard', 0105 );

INSERT INTO billingbooking	(billing_id, booking_id, 	bill_date, 	status, service_fee, tax, total, payment_type, payment_comp, ticket_id) 
VALUES 						('EEEE#1113', 'FFFF#7777' , '03/23/2000', 'P', 28.41, 38.11, 21.54, 'Debit', 'Visa', 0106 );

CREATE TABLE showinfo ( 
    show_id VARCHAR2(10) PRIMARY KEY , 
    show_title VARCHAR2(100) NOT NULL, 
    artist_performers VARCHAR2(50) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    all_show_times_dates VARCHAR2(40) NOT NULL, 
    show_description VARCHAR2(100) NOT NULL, 
    available_ticket_classes VARCHAR2(40) NOT NULL 
);

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('AA#4444', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/02/2023 10:10', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('BB#2222', 'Beyonce’s back to school bash' , 'BEYONCE', 'Scotiabank Arena', '08/03/2023 17:41', 'BEYONCE yippe', 'Vip, G, Vip++' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('CC#1111', 'Bruno Mars is going to space' , 'Bruno Mars', 'TSMU Theatre', '09/29/2023 20:30', 'Space time wooooo', 'G, B, Vip' );

INSERT INTO showinfo(show_id, show_title, artist_performers, location, all_show_times_dates, show_description, available_ticket_classes) 
VALUES ('DD#1111', 'Gojo and Geto reunion' , 'gege</3', ' KFC ', '10/15/2023 20:30', 'half time', 'G, B, Vip' );

CREATE TABLE ticket_distribution ( 
    distribution_reciept VARCHAR2(10) PRIMARY KEY , 
    ticket_id VARCHAR2(10) , 
    customer_fname VARCHAR2(50) , 
    customer_lname VARCHAR2(50) NOT NULL, 
    customer_email VARCHAR2(50) NOT NULL, 
    customer_phone_no VARCHAR2(10) NOT NULL, 
    show_time_date VARCHAR2(40) NOT NULL, 
    location VARCHAR2(50) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('AAAA#1111', '0102', 'Git', 'Hub', 'github@poul.com', '4166666666', '08/02/2023 10:10', 'Scotiabank Arena');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('BBBB#2222', '0104', 'Sea', 'Lantern', 'sealantern222@gmail.com', '6477777777', '09/29/2023 20:30', 'TMSU Theatre');

INSERT INTO ticket_distribution(distribution_reciept, ticket_id, customer_fname, customer_lname, customer_email, customer_phone_no, show_time_date, location) 
VALUES ('CCCC#3333', '1111', 'Angie', 'AAA', 'angeaaa@hotmail.com', '8932943013', '09/20/2023 19:39', 'Toronto Epic Number One Theatre');

CREATE TABLE ticket_restriction ( 
    restriction_id VARCHAR2(10) PRIMARY KEY , 
    ticket_id integer, 
    show_id VARCHAR2(10) NOT NULL, 
    reason_for_restriction VARCHAR2(500) NOT NULL, 
    FOREIGN KEY (ticket_id) REFERENCES ticket_type(ticket_id) 
);

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#333', '0102', 'AA#4444', 'Must be over 19');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('AA#334', '0102', 'AA#4444', 'Limited to 1 purchase per customer');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#335', '0106', 'DD#1111', 'Must bring a dog');

INSERT INTO ticket_restriction( restriction_id, ticket_id, show_id, reason_for_restriction) 
VALUES ('BA#336', '0104', 'CC#1111', 'Should have parental figure');

SELECT * 
FROM customer 
WHERE last_name = 'Le';

SELECT first_name, gender 
FROM customer 
WHERE gender <> 'M';

SELECT first_name, gender 
FROM customer 
WHERE gender = 'M';

SELECT first_name, 'has email: ',email 
FROM customer;

SELECT first_name, 'has phone number: ',phone_no 
FROM customer;

ORDER BY first_name; 


SELECT substr(DOB,1,4) byr,first_name 
FROM customer 
ORDER BY byr;

SELECT SUBSTR(phone_no,1,3)Acode, first_name 
FROM customer 
ORDER BY Acode;

SELECT show_name, 'has an order in ticket class: ',ticket_class 
FROM ticket_type 
ORDER BY ticket_class;

SELECT show_name, section_number, seat_number 
FROM ticket_type 
ORDER BY show_name;

SELECT show_name 
FROM ticket_type;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' 
ORDER BY show_name;

SELECT ticket_class, show_name 
FROM ticket_type 
WHERE ticket_class = 'Vip' OR ticket_class = 'Backstage' 
ORDER BY show_name;

SELECT show_name, show_time_date AS Date_and_Time 
FROM ticket_type 
ORDER BY show_name;

SELECT ticket_number, ticket_class, section_number, seat_number, show_name, show_time_date 
FROM ticket_type 
WHERE show_name = 'Taylor Swift and the Swift Moves she got' 
ORDER BY ticket_number;

SELECT * 
FROM billingbooking 
WHERE total > 100;

SELECT bill_date, tax, ticket_id 
FROM billingbooking 
    ORDER BY bill_date;

SELECT payment_type, total 
FROM billingbooking 
WHERE payment_type='Debit' 
ORDER BY total;

SELECT bill_date, service_fee, payment_type 
FROM billingbooking 
ORDER BY bill_date;

SELECT payment_comp, total 
FROM billingbooking 
WHERE payment_comp='Mastercard' 
ORDER BY total;

SELECT bill_date, status, service_fee, tax, total 
FROM billingbooking 
WHERE status='W' 
ORDER BY total;

SELECT * 
FROM billingbooking;

SELECT show_title, show_description 
FROM showinfo;

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'Taylor Swift';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers = 'BEYONCE';

SELECT show_id, show_title, location, all_show_times_dates 
FROM showinfo 
WHERE artist_performers <> 'Bruno Mars';

SELECT show_id, show_title, location, all_show_times_dates as Date_Time 
FROM showinfo 
WHERE location = 'Scotiabank Arena';

SELECT show_title, artist_performers as Artists 
FROM showinfo;

SELECT show_title, artist_performers, available_ticket_classes 
FROM showinfo;

SELECT restriction_id, reason_for_restriction 
FROM ticket_restriction;

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE ticket_id = '0102';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction <> 'Must be over 19';

SELECT ticket_id, reason_for_restriction 
FROM ticket_restriction 
WHERE reason_for_restriction = 'Must bring a dog';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id = 'AA#4444';

SELECT ticket_id, show_id, reason_for_restriction 
FROM ticket_restriction 
WHERE show_id <> 'AA#4444';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location = 'Scotiabank Arena';

SELECT customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE location <> 'Scotiabank Arena';

SELECT distribution_reciept, customer_fname, customer_lname 
FROM ticket_distribution;

SELECT distribution_reciept, ticket_id 
FROM ticket_distribution;

SELECT distribution_reciept, customer_fname, customer_lname, customer_email 
FROM ticket_distribution 
WHERE customer_email = 'github@poul.com';

SELECT distribution_reciept, customer_fname, customer_lname, customer_email, customer_phone_no 
FROM ticket_distribution 
WHERE customer_phone_no = '6477777777';

SELECT * 
FROM ticket_distribution 
WHERE distribution_reciept = 'BBBB#2222';

