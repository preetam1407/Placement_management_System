import random
import string 
NULL = None

first_names = first_names = ['Oliver', 'Ethan', 'Aiden', 'Liam', 'Lucas', 'Noah', 'Mason', 'Logan', 'Elijah', 'Caleb', 
               'Emma', 'Olivia', 'Ava', 'Sophia', 'Isabella', 'Mia', 'Charlotte', 'Amelia', 'Emily', 'Abigail',
               'Michael', 'William', 'James', 'Benjamin', 'Elijah', 'Daniel', 'Matthew', 'Lucas', 'Jackson', 'Jacob',
               'Mary', 'Elizabeth', 'Sarah', 'Margaret', 'Emma', 'Anna', 'Grace', 'Minnie', 'Ida', 'Clara',
               'John', 'Robert', 'William', 'David', 'James', 'George', 'Charles', 'Joseph', 'Edward', 'Henry']

last_names = ['Smith', 'Johnson', 'Brown', 'Taylor', 'Miller', 'Anderson', 'Jones', 'Wilson', 'Moore', 'Martin',
              'Lee', 'Davis', 'Garcia', 'Rodriguez', 'Martinez', 'Jackson', 'Perez', 'Hall', 'Young', 'Allen',
              'Clark', 'Wright', 'Walker', 'White', 'Harris', 'Lopez', 'Scott', 'Green', 'Adams', 'Baker',
              'Robinson', 'Nelson', 'Carter', 'Mitchell', 'Parker', 'Cooper', 'Reed', 'Cook', 'Bailey', 'Turner',
              'King', 'Morgan', 'Phillips', 'Campbell', 'Evans', 'Edwards', 'Collins', 'Murphy', 'Rivera']

middle_names = ['Lee', 'Ann', 'Marie', 'Nicole', 'Rose', 'Elizabeth', 'Grace', 'Claire', 'Mae', 'Louise',
                'Andrew', 'Thomas', 'James', 'Michael', 'David', 'Anthony', 'Christopher', 'Joseph', 'Robert', 'William']


student_ids = [] 
company_details_ids = [] 
admin_ids = [] 
attr = ['person_id', 'first_name', 'middle_name', 'last_name',  'mobile_number', 'email', "profile_photo", 'password_hash', 'nationality', 'person_role']
role = ["student", "company_rep", "admin"]
Indian_number = 1000000000
US_number = 1000000
nat = ["rffu", "Indian", "NULL", "American" ,  "Korean", "Australian", "Polish", "Sri Lankan", "Nepal" , "fhu"]
for i in range(1000): 
    info = [] 
    for j in attr:
        match j:
            case "person_id":
                id  = str(10000 + i).replace("'", "")
                info.append(id) 
            case "first_name":
                num = random.randint(0, 49)  
                name = first_names[num]
                info.append("'" + name + "'") 
            case "middle_name":
                num = random.choice([1, 2])
                if (num == 1):
                    o = random.randint(0, 19)  
                    name = middle_names[o]
                    # info.append(gen_name(random.randint(3, 10))) 
                    info.append("'" + name + "'") 
                else:
                    info.append(NULL)
            case "last_name":
                num = random.choice([1, 2])
                if (num == 1):
                    o = random.randint(0, 48)  
                    name = last_names[o]
                    # info.append(gen_name(random.randint(3, 10)))
                    info.append("'" + name + "'") 
                else:
                    info.append(NULL) 

            case "mobile_number":
                n = random.choice([1, 0]) 
                if (n):
                    ctr_code = 1 
                    # numb = str(Indian_number+i).replace("'", "")
                    numb = (Indian_number+i)
                else:
                    ctr_code = 0
                    # numb = str(str(US_number+i)).replace("'", "") 
                    numb = (US_number+i)
                dic = dict()
                dic["country_code"]= ctr_code
                dic["number"] = numb
                info.append("'" + str(dic) + "'")
            case "email":
                email_id = "'" + info[1].replace("'", "") + str(i)+ "@gmail.com'" 
                info.append(email_id)
            case "profile_photo":
                info.append('""') 
            case "password_hash":
                password ="'" +  info[1].replace("'", "") + str(i)  + str(random.randint(100, 200)) + "'" 
                info.append(password) 
            case "nationality":
                num = random.randint(1, 6) 
                # print(num)
                
                info.append( "'" +  nat[num] + "'" )
            case "person_role":
                n = random.choice([1, 2, 3])
                if (n == 1):
                    info.append("'company_rep'")
                    company_details_ids.append(info[0])
                elif (n == 2):
                    info.append("'admin'") 
                    admin_ids.append(info[0])
                else:
                    info.append("'student'")
                    student_ids.append(info[0])
    tuple_info = tuple(info) 
    with open('fin_persons.txt','a') as f:
        f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    f.close()
    # if (info[9] == "'student'"):
    #     with open('students.txt','a') as f:
    #         f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    #     f.close()
    # elif (info[0] == "'company'"):
    #     with open('hr.txt','a') as f:
    #         f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    #     f.close()
    # else:
    #     with open('admins.txt','a') as f:
    #         f.write("(" + ','.join(str(s) for s in tuple_info) + ')' + ',' + '\n')  
    #     f.close()

                

