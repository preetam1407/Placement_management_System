use placement_management_system;
CREATE TABLE queries (
  query_id INT AUTO_INCREMENT PRIMARY KEY,
  person_role VARCHAR(50),
  person_id int,
  message varchar(50),
  email_id varchar(50) UNIQUE,
  query_date varchar(50),
  constraint person_queries FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES
("student", 10000, "this is a message", "prakriti.saroj@iitgn.ac.in", "13-04-2023"),
("company_rep", 10006, "this is another message", "prakriti.saroj@iitgn.ac.in1", "14-04-2023"),
("company_rep", 10008, "this is a yet another message", "prakriti.saroj@iitgn.ac.in2", "15-04-2023"),
("student", 10007, "another message", "prakriti.saroj@iitgn.ac.in3", "15-04-2023");

INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES
("student", 10015, "this is a message", "prakriti.saroj@iitgn.acv.in", "13-04-2023"),
("company_rep", 10016, "this is another message", "prakriti.saroj@iitgln.ac.in1", "14-04-2023");

INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES
("company_rep", 10098, "this is a yet another message", "prakriti.saroj@iitgn.ac.in2", "15-04-2023");

INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES
("student", 10017, "this is a message", "prakr9iti.saroj@iitgn.acv.in", "13-04-2023"),
("company_rep", 10018, "this is another message", "prakritoi.saroj@iitgln.ac.in1", "14-04-2023");

INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES
("company_rep", 10098, "this is a yet another message", "prakkriti.saroj@iitgn.ac.in2", "15-04-2023");


select * from queries;





