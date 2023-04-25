-- create database placement_management_system;
use placement_management_system;
DROP TABLE IF EXISTS placement_management_system.company_details; 
SELECT * FROM job_profile WHERE job_id=37886093;
CREATE TABLE placement_management_system.company_details (
  person_id int not null PRIMARY KEY, -- job_id
  job_id varchar(50) not null,  -- person_id
  company_rep VARCHAR(50) NOT NULL,
  company_name VARCHAR(100) NOT NULL,
  website VARCHAR(100),
  type_of_org VARCHAR(50) NOT NULL,
  industry_sector VARCHAR(50) NOT NULL,
  no_of_members VARCHAR(50)  NOT NULL,
  no_of_rooms_required VARCHAR(50)  NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  parent_id int,
  parent_id_1 varchar(50),
  FOREIGN KEY(parent_id) REFERENCES person(person_id),
  constraint process FOREIGN KEY(parent_id_1) REFERENCES job_profile(job_id)
);

DELIMITER ??
CREATE TRIGGER check_positive_days
BEFORE INSERT ON placement_management_system.company_details
FOR EACH ROW
BEGIN
    IF DATEDIFF(NEW.start_date, NEW.end_date) < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'The date is in the past. Please enter a future date.';
    END IF;
END;
DELIMITER ;

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
-- (10006,'0000000001','Product Manager','ABB',NULL,'Computer Engineering-based','Public',4,5,'2023-05-28','2023-09-28','0000000001',10006),
-- (10008,'0000000001','CTO','Siemens',NULL,'Materials Science and Engineering-based','Private',6,7,'2023-06-20','2023-11-18','0000000001',10008),
-- (10016,'0000000001','Product Manager','Rockwell Automation',NULL,'Mechanical Engineering-based','Public',5,7,'2023-08-25','2023-12-25','0000000001',10016),
(10019,'0000000001','Product Manager','Emerson Electric','https://10019','Mechanical Engineering-based','Private',7,3,'2023-07-22','2023-10-25','0000000001',10019),
(10024,'0000000001','Product Manager','Mitsubishi Electric','https://10024','Civil Engineering-based','Semi-Private',7,3,'2023-06-20','2023-10-24','0000000001',10024),
(10027,'0000000001','CTO','Hitachi',NULL,'Aerospace Engineering-based','Public',4,5,'2023-06-20','2023-12-24','0000000001',10027),
(10032,'0000000001','Product Manager','Mitsubishi Electric','https://10032','Materials Science and Engineering-based','Public',7,5,'2023-06-07','2023-09-15','0000000001',10032),
(10034,'0000000001','CEO','Honeywell',NULL,'Petroleum Engineering-based','Semi-Private',6,4,'2023-07-01','2023-09-09','0000000001',10034),
(10035,'0000000001','Product Manager','Siemens',NULL,'Industrial Engineering-based','Public',4,6,'2023-08-09','2023-12-23','0000000001',10035),
(10043,'0000000002','CTO','ABB',NULL,'Environmental Engineering-based','Private',3,4,'2023-06-20','2023-11-27','0000000002',10043);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10045,'0000000002','CTO','Honeywell',NULL,'Environmental Engineering-based','Private',7,4,'2023-06-25','2023-11-27','0000000002',10045),
(10050,'0000000002','HR','Siemens','https://10050','Civil Engineering-based','Semi-Private',7,3,'2023-05-27','2023-09-28','0000000002',10050),
(10052,'0000000002','HR','Siemens',NULL,'Computer Engineering-based','Public',3,3,'2023-07-11','2023-12-12','0000000002',10052),
(10053,'0000000002','CEO','Mitsubishi Electric','https://10053','Aerospace Engineering-based','Public',6,6,'2023-07-18','2023-12-27','0000000002',10053),
(10060,'0000000002','CEO','Siemens','https://10060','Computer Engineering-based','Semi-Private',7,6,'2023-06-11','2023-11-22','0000000002',10060),
(10064,'0000000002','HR','Yokogawa Electric','https://10064','Petroleum Engineering-based','Semi-Private',5,4,'2023-06-22','2023-10-04','0000000002',10064),
(10067,'0000000002','CEO','Hitachi','https://10067','Petroleum Engineering-based','Private',7,6,'2023-05-14','2023-12-26','0000000002',10067),
(10070,'0000000002','HR','Hitachi',NULL,'Computer Engineering-based','Semi-Private',7,7,'2023-05-21','2023-10-17','0000000002',10070),
(10072,'0000000002','HR','Mitsubishi Electric',NULL,'Civil Engineering-based','Public',4,4,'2023-07-16','2023-12-26','0000000002',10072),
(10076,'0000000002','Product Manager','Emerson Electric',NULL,'Industrial Engineering-based','Semi-Private',4,5,'2023-08-07','2023-10-24','0000000002',10076),
(10077,'0000000003','Product Manager','Honeywell','https://10077','Environmental Engineering-based','Private',3,6,'2023-06-06','2023-11-14','0000000003',10077);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10079,'0000000003','CTO','Schneider Electric',NULL,'Nuclear Engineering-based','Semi-Private',3,4,'2023-07-12','2023-10-09','0000000003',10079),
(10080,'0000000003','HR','Siemens',NULL,'Petroleum Engineering-based','Semi-Private',4,7,'2023-05-25','2023-12-13','0000000003',10080),
(10083,'0000000004','CEO','Schneider Electric','https://10083','Mechanical Engineering-based','Semi-Private',6,3,'2023-06-16','2023-12-05','0000000004',10083),
(10094,'0000000004','Product Manager','Yokogawa Electric','https://10094','Petroleum Engineering-based','Public',5,6,'2023-05-26','2023-10-23','0000000004',10094),
(10097,'0000000005','CTO','Hitachi',NULL,'Environmental Engineering-based','Private',7,3,'2023-07-14','2023-09-19','0000000005',10097),
(10098,'0000000006','CTO','Hitachi','https://10098','Nuclear Engineering-based','Private',3,4,'2023-08-08','2023-10-21','0000000006',10098),
(10101,'0000000007','HR','Emerson Electric','https://10101','Industrial Engineering-based','Public',5,3,'2023-05-20','2023-09-13','0000000007',10101),
(10105,'0000000008','CEO','General Electric','https://10105','Biomedical Engineering-based','Public',4,4,'2023-08-22','2023-09-28','0000000008',10105),
(10107,'0000000009','CTO','General Electric','https://10107','Chemical Engineering-based','Private',6,7,'2023-05-05','2023-10-26','0000000009',10107),
(10109,'0000000010','Product Manager','Yokogawa Electric',NULL,'Petroleum Engineering-based','Semi-Private',7,5,'2023-05-19','2023-12-19','0000000010',10109),
(10113,'0000000011','HR','Emerson Electric',NULL,'Petroleum Engineering-based','Private',4,3,'2023-05-19','2023-11-15','0000000011',10113);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10118,'0000000012','CTO','Honeywell',NULL,'Chemical Engineering-based','Public',3,6,'2023-08-07','2023-11-05','0000000012',10118),
(10120,'0000000013','CEO','Rockwell Automation',NULL,'Petroleum Engineering-based','Private',3,7,'2023-06-22','2023-11-13','0000000013',10120);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10124,'00000000014','Product Manager','Siemens','https://10124','Materials Science and Engineering-based','Public',7,6,'2023-08-05','2023-11-18','00000000014',10124);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10130,'00000000015','Product Manager','Mitsubishi Electric','https://10130','Petroleum Engineering-based','Semi-Private',3,6,'2023-07-09','2023-11-23','00000000015',10130);

INSERT INTO placement_management_system.company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id)
VALUES
(10133,'00000000016','HR','Rockwell Automation',NULL,'Materials Science and Engineering-based','Semi-Private',5,7,'2023-08-10','2023-12-26','00000000016',10133),
(10136,'00000000017','CEO','Hitachi','https://10136','Petroleum Engineering-based','Semi-Private',7,7,'2023-07-11','2023-12-08','00000000017',10136),
(10142,'00000000018','CTO','General Electric',NULL,'Environmental Engineering-based','Private',6,6,'2023-07-16','2023-10-26','00000000018',10142),
(10150,'00000000019','Product Manager','General Electric','https://10150','Nuclear Engineering-based','Semi-Private',7,7,'2023-07-21','2023-11-11','00000000019',10150);


select * from company_details;	
