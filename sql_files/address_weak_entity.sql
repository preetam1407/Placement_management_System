use placement_management_system;
DROP TABLE IF EXISTS placement_management_system.address; 

CREATE TABLE placement_management_system.address (
  person_id INT,
  zip_code int NOT NULL,
  city VARCHAR(50) NOT NULL,
  state VARCHAR(50) NOT NULL,
  address_line VARCHAR(255) NOT NULL,
  parent_id INT,
  PRIMARY KEY (person_id, parent_id),
  constraint located_at FOREIGN KEY (parent_id) REFERENCES person(person_id)
  on update cascade
  on delete cascade
);

INSERT INTO placement_management_system.address (person_id, zip_code, city, state, address_line, parent_id)
SELECT 
    p.person_id,
    FLOOR(RAND()*999999)+1,
    CASE FLOOR(RAND()*30)+1
		WHEN 1 THEN 'Mumbai'
        WHEN 2 THEN 'Delhi' 
		WHEN 3 THEN 'Bengaluru' 
		WHEN 4 THEN 'Hyderabad' 
		WHEN 5 THEN 'Ahmedabad' 
		WHEN 6 THEN 'Chennai' 
		WHEN 7 THEN 'Kolkata' 
		WHEN 8 THEN 'Surat' 
		WHEN 9 THEN 'Pune' 
		WHEN 10 THEN 'Jaipur' 
		WHEN 11 THEN 'Lucknow' 
		WHEN 12 THEN 'Kanpur' 
		WHEN 13 THEN 'Nagpur' 
		WHEN 14 THEN 'Visakhapatnam' 
		WHEN 15 THEN 'Bhopal' 
		WHEN 16 THEN 'Patna' 
		WHEN 17 THEN 'Ludhiana' 
		WHEN 18 THEN 'Agra' 
		WHEN 19 THEN 'Nashik' 
		WHEN 20 THEN 'Vadodara' 
		WHEN 21 THEN 'Faridabad' 
		WHEN 22 THEN 'Ghaziabad' 
		WHEN 23 THEN 'Rajkot' 
		WHEN 24 THEN 'Amritsar' 
		WHEN 25 THEN 'Varanasi' 
		WHEN 26 THEN 'Srinagar' 
		WHEN 27 THEN 'Dhanbad' 
		WHEN 28 THEN 'Jammu' 
		WHEN 29 THEN 'Thiruvananthapuram' 
        ELSE 'Guwahati'
    END AS city,
    CASE FLOOR(RAND()*28)+1
        WHEN 1 THEN 'Andhra Pradesh'
        WHEN 2 THEN 'Arunachal Pradesh'
        WHEN 3 THEN 'Assam'
        WHEN 4 THEN 'Bihar'
        WHEN 5 THEN 'Chhattisgarh'
        WHEN 6 THEN 'Goa' 
        WHEN 7 THEN 'Gujarat' 
        WHEN 8 THEN 'Haryana' 
        WHEN 9 THEN 'Himachal Pradesh' 
        WHEN 10 THEN 'Jharkhand'
        WHEN 11 THEN 'Karnataka' 
        WHEN 12 THEN 'Kerala' 
        WHEN 13 THEN 'Madhya Pradesh' 
        WHEN 14 THEN 'Maharashtra'
        WHEN 15 THEN 'Manipur' 
        WHEN 16 THEN 'Meghalaya' 
        WHEN 17 THEN 'Mizoram' 
        WHEN 18 THEN 'Nagaland' 
        WHEN 19 THEN 'Odisha' 
        WHEN 20 THEN 'Punjab' 
        WHEN 21 THEN 'Rajasthan' 
        WHEN 22 THEN 'Sikkim' 
        WHEN 23 THEN 'Tamil Nadu' 
        WHEN 24 THEN 'Telangana' 
        WHEN 25 THEN 'Tripura' 
        WHEN 26 THEN 'Uttar Pradesh' 
        WHEN 27 THEN 'Uttarakhand' 
        ELSE 'West Bengal'
    END AS state,
    CASE FLOOR(RAND()*27)+1
        WHEN 1 THEN 'Flat 101, Mayfair Residency'
        WHEN 2 THEN 'Joggers Park Road, Kalyani Nagar'
        WHEN 3 THEN 'Near Golds Gym'
		WHEN 4 THEN 'Building No. 3, Shanti Nagar'
		WHEN 5 THEN 'Kandivali East'
		WHEN 6 THEN 'P.O. Box 548, Race Course Road'
		WHEN 7 THEN '5th Floor, Golden Tower'
		WHEN 8 THEN 'MG Road'
		WHEN 9 THEN 'Mehrauli-Gurgaon Road, DLF Phase 1'
		WHEN 10 THEN 'Sahyadri Farms, Vadgaon'
		WHEN 11 THEN 'Nana Peth'
		WHEN 12 THEN 'Opposite Shivaji Park, Dadar West'
		WHEN 13 THEN 'Yerwada'
		WHEN 14 THEN 'Koregaon Park'
		WHEN 15 THEN 'Golf Course Road'
		WHEN 16 THEN 'Ring Road'
		WHEN 17 THEN 'M.G. Marg'
		WHEN 18 THEN 'Salt Lake City'
		WHEN 19 THEN 'Sector 62, Noida'
		WHEN 20 THEN 'Kondhwa Road'
		WHEN 21 THEN 'Bavdhan'
		WHEN 22 THEN 'Aundh-Baner Link Road'
		WHEN 23 THEN 'Wakad-Hinjewadi Road'
		WHEN 24 THEN 'Kharadi Bypass Road'
		WHEN 25 THEN 'Erandwane'
		WHEN 26 THEN 'Bhamburda'
        ELSE 'Building No. 3, Shanti Nagar'
    END AS address_line,
    p.person_id
FROM person p;
select * from person where person_id = 10111;
SELECT * FROM address;


