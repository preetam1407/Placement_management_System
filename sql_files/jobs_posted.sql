-- drop table applies_to;
use placement_management_system;
CREATE TABLE jobs_posted (
  job_id VARCHAR(50),
  person_id int,
  PRIMARY KEY (job_id),
  FOREIGN KEY (person_id) REFERENCES placement_management_system.company_details(person_id),
  FOREIGN KEY (job_id) REFERENCES job_profile(job_id)
);


select * from jobs_posted;


