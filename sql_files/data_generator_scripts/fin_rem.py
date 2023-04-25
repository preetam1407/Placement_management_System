from fin_person import * 

import random
import string 

attr_st = ["person_id", "cpi", "backlogs", "category",  "gender", "dob", "professional_experience", "personal_mail", "year_of_graduation",   "current_program", "cv", "major_disciplines", "minor_disciplines" , "date_of_joining", "parent_id"]
engineering_divisions = ["Mechanical Engineering", 
                         "Electrical Engineering", 
                         "Civil Engineering", 
                         "Chemical Engineering", 
                         "Aerospace Engineering", 
                         "Computer Engineering", 
                         "Environmental Engineering", 
                         "Biomedical Engineering", 
                         "Materials Science and Engineering", 
                         "Industrial Engineering", 
                         "Nuclear Engineering", 
                         "Petroleum Engineering"]

for i in range(len(student_ids)):
    info = [] 
    for j in attr_st:
        match j:
            case "person_id":
                info.append(student_ids[i]) 
            case "cpi":
                info.append(str(round(random.uniform(0, 10), 2)).replace("'", "")) 
            case "backlogs":
                if (random.choice([0, 1])):
                    info.append(True) 
                else:
                    info.append(False) 
            case "category":
                if (random.choice([0, 1])):
                    info.append(NULL) 
                else:
                    cats = ["GEN", "SC", "ST", "OBC", "OTHER"] 
                    cat = cats[random.randint(0, 4)] 
                    info.append("'" + cat + "'") 
            case "gender":
                n = random.choice([0, 1, 2])
                if (n == 0 ):
                    info.append("'Male'") 
                if (n == 1):
                    info.append("'Female'") 
                if (n == 2):
                    info.append("'Other'") 
            case "dob":
                date = str(random.randint(1, 28)).zfill(2)
                month = str(random.randint(1, 12)).zfill(2) 
                year = str(random.randint(1995, 2003))
                info.append("'" + year.replace("'", "") + "-" + month.replace("'", "") + "-" + date.replace("'", "") + "'") 
            case "professional_experience":
                if (random.choice([0, 1])): 
                    info.append(str(0).replace("'", "")) 
                else:
                    info.append(str(random.randint(0, 24)).replace("'", "")) 
            case "personal_mail":
                if (random.choice([0, 1])):
                    info.append(NULL) 
                else:
                    mail = "'" + info[0].replace("'", "") + str(i) + "@gmail.com'"  
                    info.append(mail) 
            case "year_of_graduation":
                info.append(str(random.randint(2023, 2027)).replace("'", ""))

            case "date_of_joining":
                date = str(random.randint(1, 28)).zfill(2)
                month = str(random.randint(1, 12)).zfill(2) 
                year = str(random.randint(2024, 2025))
                info.append("'" +  year.replace("'", "") + "-" + month.replace("'", "") + "-" + date.replace("'", "") + "'")  
            case "current_program":
                if (random.choice([0, 1])):
                    info.append("'BTECH'") 
                else:
                    info.append("'MTECH'") 
            case "cv":
                info.append("'" + '0x123456789abcdef' + "'")
            case "major_disciplines":

                disc = ""
                for i in range(15):
                    disc += str(random.choice([0, 1])).replace("'", "")
                info.append("'" + disc + "'") 

            case "minor_disciplines":

                disc = ""
                for i in range(15):
                    disc += str(random.choice([0, 1])).replace("'", "")
                info.append("'" + disc + "'") 

                
            case "parent_id": 
                info.append(info[0])
                
    tuple_info = tuple(info) 
    with open('fin_students.txt','a') as f:
        f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    f.close()


attr_cp = ["person_id", "company_rep", "company_name", "website", "type_of_org", "industry_sector", "no_of_members", "no_of_rooms_required", "start_date", "end_date", "parent_id"] 
engineering_companies = ['Siemens', 'ABB', 'General Electric', 'Honeywell', 'Schneider Electric', 'Rockwell Automation', 'Emerson Electric', 'Mitsubishi Electric', 'Yokogawa Electric', 'Hitachi']
for i in range(len(company_details_ids)):
    info = []
    for j in attr_cp:
        match j:
            case "person_id":
                info.append(company_details_ids[i]) 
            case "company_rep":
                r = ["HR", "CTO", "CEO", "Product Manager"] 
                n = random.randint(0,3 ) 
                info.append("'" + r[n] + "'") 
            case "company_name":
                n = random.randint(0, 9) 
                info.append("'" + engineering_companies[n]  + "'")
            case "website":
                if (random.choice([0, 1])): 
                    info.append(NULL) 
                else:
                    info.append("'" + "https://" + info[0].replace("'", "") + "'") 
            case "type_of_org":
                n = random.randint(0, 11) 
                info.append("'" +   engineering_divisions[n] + "-based" + "'" )
            case "industry_sector":
                ind = ["Public", "Private", "Semi-Private"] 
                info.append("'" + ind[random.randint(0, 2)] + "'") 
            case "no_of_members":
                info.append(random.randint(3, 7)) 
            case "no_of_rooms_required":
                 info.append(random.randint(3, 7))    
            case  "start_date":
                date = str(random.randint(1, 28)).zfill(2)
                month = str(random.randint(5, 8)).zfill(2) 
                year = str(2023)
                info.append("'" + year.replace("'", "") + "-" + month.replace("'", "") + "-" + date.replace("'", "") + "'") 
            case  "end_date":
                date = str(random.randint(1, 28)).zfill(2)
                month = str(random.randint(9, 12)).zfill(2) 
                year = str(2023)
                info.append("'" + year.replace("'", "") + "-" + month.replace("'", "") + "-" + date.replace("'", "") + "'") 
            case "parent_id":
                info.append(info[0])
            

    tuple_info = tuple(info) 
    with open('fin_company.txt','a') as f:
        f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    f.close()

attr_ad = ["person_id", "designation", "parent_id"]

for i in range(len(admin_ids)):
    info = []
    for j in attr_ad:
        match j:
            case "person_id":
                info.append(admin_ids[i]) 
            case "designation":
                d = ["Technical Team Lead", "Internal Coordinator", "Placement Coordinator", "Social Media Lead", "Head-CDS", "Faculty Coordinator-Internships"]
                n = random.randint(0,5 ) 
                info.append("'" + d[n] + "'") 
            case "parent_id":
                info.append(info[0])
    tuple_info = tuple(info) 
    with open('fin_admins.txt','a') as f:
        f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    f.close()
    

                