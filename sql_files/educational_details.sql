use placement_management_system;
DROP TABLE IF EXISTS placement_management_system.educational_details; 

CREATE TABLE placement_management_system.educational_details (
  person_id INT UNIQUE PRIMARY KEY,
  board_for_tenth ENUM('ICSE', 'CBSE', 'State Board', 'OTHER') NOT NULL,
  board_of_twelfth ENUM('ICSE', 'CBSE', 'State Board', 'OTHER') NOT NULL,
  tenth_percentage DECIMAL(5,2) NOT NULL,
  twelfth_percentage DECIMAL(5,2) NOT NULL,
  competitive_exam_name ENUM('JEE Advanced', 'Math Olympiad', 'GATE', 'IIT JAM') NOT NULL,
  competitive_exam_rank INT NOT NULL,
  constraint education FOREIGN KEY (person_id) REFERENCES student (person_id)
  on update cascade
  on delete cascade
);

-- Insert data for each student in the student table
-- Generate sample data for the educational_details table
INSERT INTO placement_management_system.educational_details 
  (person_id, board_for_tenth, board_of_twelfth, tenth_percentage, twelfth_percentage, competitive_exam_name, competitive_exam_rank)
SELECT 
  student.person_id,
  CASE
    WHEN RAND() < 0.25 THEN 'ICSE'
    WHEN RAND() < 0.50 THEN 'CBSE'
    WHEN RAND() < 0.75 THEN 'State Board'
    ELSE 'OTHER'
  END AS board_for_tenth,
  CASE
    WHEN RAND() < 0.25 THEN 'ICSE'
    WHEN RAND() < 0.50 THEN 'CBSE'
    WHEN RAND() < 0.75 THEN 'State Board'
    ELSE 'OTHER'
  END AS board_of_twelfth,
  ROUND(RAND() * 100, 2) AS tenth_percentage,
  ROUND(RAND() * 100, 2) AS twelfth_percentage,
  CASE
    WHEN RAND() < 0.25 THEN 'JEE Advanced'
    WHEN RAND() < 0.50 THEN 'Math Olympiad'
    WHEN RAND() < 0.75 THEN 'GATE'
    ELSE 'IIT JAM'
  END AS competitive_exam_name,
  FLOOR(RAND() * 10000) AS competitive_exam_rank
FROM 
  placement_management_system.student;

-- Verify the inserted data
SELECT * FROM placement_management_system.educational_details;
