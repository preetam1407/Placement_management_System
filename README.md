# Placement Management System
## Initial Setup
*Note:*     
The recommanded version of python is python 3.8.    
Application run on localhost:5000       
kindly find the required files related to web app in the final branch.

*Step 1:*   
Clone this project

*Step 2:*    
Run the following Command in terminal.    
"pip3 install -r requirements.txt"

*Step 3:*    
- Create a file and place in the root directory of the project: db.yaml
- Add the following code in db.yaml file:      

mysql_host: 'localhost'   

mysql_user: 'root'     

<!-- Enter your password in field below      -->
mysql_password: '**********'      

mysql_db: 'placement_management_system'


*Step 4:*     
Setting up the databases management system:      
- kindly find the sql file in the following folder. 
- Open these databases in .sql files in MySQL Workbench and run the files. 
- Now our database is setup.

*Step 5:*      
Run the application by executing the command:      
"python3 app.py"     
if the above command throws error, try with the below command:   
"python app.py"    

## Screenshots of the task execution
Kindly find the screenshots of the operations in the attached document.
