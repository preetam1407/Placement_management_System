-- drop table applies_to;
use placement_management_system;
CREATE TABLE applies_to (
  job_id VARCHAR(50),
  person_id int,
  is_protected varchar(50),
  curr_status varchar(50),
  PRIMARY KEY (job_id, person_id),
  FOREIGN KEY (person_id) REFERENCES student(person_id),
  FOREIGN KEY (job_id) REFERENCES job_profile(job_id)
);

-- select * from applies_to;

-- select * from applies_to where person_id="21110142" and job_id="00000000015";
-- select * from company_details where person_id="69929164"


