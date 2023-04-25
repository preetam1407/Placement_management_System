use placement_management_system;

CREATE TABLE filters (
  job_id VARCHAR(50),
  job_profile varchar(50),
  job_category varchar(50),
  PRIMARY KEY (job_id),
  constraint job_filters FOREIGN KEY (job_id) REFERENCES job_profile(job_id)
);

select * from filters;

INSERT INTO filters (job_id, job_profile, job_category) VALUES
("0000000010", "Other", "Other");

INSERT INTO filters (job_id, job_profile, job_category) VALUES
("00000000019", "EE", "Remote"),
("00000000018", "ME", "Full-time"),
("00000000017", "Finance", "In-person"),
("00000000014", "CSE", "Other");




