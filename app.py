from flask import Flask, render_template, request, redirect, session, url_for, flash
from flask_mysqldb import MySQL
from flask_sqlalchemy import SQLAlchemy
import yaml
import json
import os
from werkzeug.utils import secure_filename
from base64 import b64encode
from datetime import datetime

app = Flask(__name__)

# Configure db
db = yaml.safe_load(open('db.yaml'))
app.config['MYSQL_HOST'] = db['mysql_host']
app.config['MYSQL_USER'] = db['mysql_user']
app.config['MYSQL_PASSWORD'] = db['mysql_password']
app.config['MYSQL_DB'] = db['mysql_db']

mysql = MySQL(app)
UPLOAD_FOLDER = os.path.abspath(os.path.join(
    os.path.dirname(__file__), 'store_files'))
ALLOWED_EXTENSIONS = set(['txt', 'pdf', 'png', 'jpg', 'jpeg', 'gif'])
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER


# global variables
student_cpi = 0


def file_to_binary(filename):
    with open(filename, 'rb') as file:
        binary_data = file.read()
    return binary_data


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS


# ---------------------------------------------------LOGIN & REGISTER & LOGOUT--------------------------------------------------------------------


@app.route('/', methods=['GET', 'POST'])
def login():
    ip_address = request.remote_addr
    if 'ip_address' in session and session['ip_address'] != ip_address:
        session.clear()
    
    if request.method == 'POST':
        userDetails = request.form
        user_id = userDetails['user_id']
        password = userDetails['password']
        cur = mysql.connection.cursor()
        cur.execute(
            "SELECT * FROM person WHERE person_id=%s AND password_hash=%s", (user_id, password))
        user = cur.fetchone()
        isAuthenticated = ("--" not in user_id and len(user_id)<10)
        if user and isAuthenticated:
            # successful login, redirect to home page
            session['loggedin'] = True
            session['id'] = user[0]
            session['ip_address'] = ip_address
            return redirect(url_for('private'))
        
        else:
            # invalid login, show error message
            error = 'Invalid username or password'
            return render_template('login/login.html', error=error)

    else:
        return render_template('login/login.html'), {'Cache-Control': 'no-cache, no-store, must-revalidate'}


@app.route('/logout')
def logout():
    # Remove session data
    session.pop('ip_address', None)
    session.pop('loggedin', None)
    session.pop('id', None)

    return redirect(url_for('login'))


@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        print(userDetails)
        role = userDetails['role']
        print(role)
        if (role == "student"):
            return redirect('/student-registration')
        elif (role == "company_rep"):
            return redirect('/company_representative-registration')
        elif (role == "admin"):
            return redirect('/administrator-registration')
    else:
        return render_template('login/register.html')


# -----------------------------COMPANY REP REGISTRATION----------------------------------------------------------------------
@app.route('/company_representative-registration', methods=['GET', 'POST'])
def hr_reg():
    if request.method == 'POST':
        userDetails = request.form
        if 'file' not in request.files:
            flash('No file part')
            print('There is no file in registration form!')
            return redirect(request.url)

        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            print("NO files!!!!")
            return redirect(request.url)

        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
            profile_photo = file_to_binary(file_path)

        if 'jfile' not in request.files:
            flash('No resume file')
            print("No Resume file in registration form!!!!")
            return redirect(request.url)

        jfile = request.files['jfile']
        if jfile.filename == '':
            flash('No selected file')
            print("NO files!!!!")
            return redirect(request.url)

        if jfile and allowed_file(jfile.filename):
            filename = secure_filename(jfile.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            jfile.save(file_path)
            job_description = file_to_binary(file_path)

        person_id = userDetails['person_id'],
        first_name = userDetails['first_name'],
        middle_name = userDetails['middle_name'],
        last_name = userDetails['last_name'],
        country_code = userDetails['country_code'],
        mobile_number = userDetails['mobile_number'],
        email_id = userDetails['email_id'],
        profile_photo = profile_photo,
        password = userDetails['password'],
        nationality = userDetails['nationality'],
        company_name = userDetails['company_name'],
        company_id = userDetails['company_id'],
        company_rep = userDetails['company_rep'],
        hr_email = userDetails['hr_email'],
        job_id = userDetails['job_id'],
        job_designation = userDetails['job_designation'],
        job_description = job_description,
        job_location = userDetails['job_location'],
        service_bond = userDetails['service_bond'],
        terms_and_conditions = userDetails['terms_and_conditions'],
        six_month_intern_possibility = userDetails['six_month_intern_possibility'],
        early_onboarding_possibility = userDetails['early_onboarding_possibility'],
        particularly_early_onboarding_required = userDetails[
            'particularly_early_onboarding_required'],
        early_graduate_students_are_excluded = userDetails['early_graduate_students_are_excluded'],
        shortlist_from_resume = userDetails['shortlist_from_resume'],
        ppt = userDetails['ppt'],
        technical_test = userDetails['technical_test'],
        psychometric_test = userDetails['psychometric_test'],
        group_discussion = userDetails['group_discussion'],
        technical_interviews = userDetails['technical_interviews'],
        hr_interviews = userDetails['hr_interviews'],
        eligible_minor_disc = userDetails['eligible_minor_disc'],
        eligible_major_disc = userDetails['eligible_major_disc'],
        website = userDetails['website'],
        type_of_org = userDetails['type_of_org'],
        industry_sector = userDetails['industry_sector'],
        cutoff_cpi = userDetails['cutoff_cpi'],
        start_date = userDetails['start_date'],
        end_date = userDetails['end_date'],
        aptitude_test = userDetails['aptitude_test'],
        job_profiles = userDetails['job_profiles'],
        job_categories = userDetails['job_categories'],
        zip_code = userDetails['zip_code'],
        city = userDetails['city'],
        state = userDetails['state'],
        address_line = userDetails['address_line'],
        x = {"country_code": country_code, "number": mobile_number}
        cur = mysql.connection.cursor()
        print("hfrghh")
        print(job_profiles, job_categories)

        try:
            sql = "INSERT INTO person(person_id, first_name, middle_name, last_name, mobile_number, email, profile_photo, password_hash, nationality, person_role) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (person_id, first_name, middle_name, last_name, json.dumps(
                x), email_id, profile_photo, password, nationality, "company_rep")
            cur.execute(sql, values)
            mysql.connection.commit()
            print("Data for company representative inserted successfully")

            try:
                sql2 = "INSERT INTO job_profile(job_id, job_designation, job_description, job_location, cutoff_cpi, service_bond, terms_and_condition, six_month_intern_possibility, early_onboarding_possibility, particularly_early_onboarding_required,early_graduate_students_are_excluded, current_status, start_date, end_date, shortlist_from_resume,eligible_minor_disc,ppt ,eligible_major_disc,technical_test ,aptitude_test,psychometric_test,group_discussion,technical_interviews,hr_interviews) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                values2 = (job_id, job_designation, job_description, job_location, cutoff_cpi, service_bond, terms_and_conditions, six_month_intern_possibility, early_onboarding_possibility, particularly_early_onboarding_required, early_graduate_students_are_excluded,
                           "Job Posted", start_date, end_date, shortlist_from_resume,  eligible_minor_disc, ppt,  eligible_major_disc, technical_test, aptitude_test, psychometric_test, group_discussion, technical_interviews, hr_interviews)
                cur.execute(sql2, values2)

                mysql.connection.commit()
                print("Data for job profile inserted successfully")

                sql3 = "INSERT INTO filters (job_id, job_profile, job_category) VALUES(%s,%s,%s)"
                values3 = (job_id, job_profiles, job_categories)
                cur.execute(sql3, values3)
                print("Data for filters inserted successfully")

                try:
                    sql1 = "INSERT INTO company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    # sql1 = "INSERT INTO company_details (company_id, company_rep, company_name, website, type_of_org, industry_sector) VALUES (%s, %s, %s, %s, %s, %s)"
                    values1 = (person_id, job_id, company_rep, company_name, website, type_of_org,
                               industry_sector, '1', '1', start_date, end_date, job_id, person_id)
                    cur.execute(sql1, values1)
                    print("Data for company_details inserted successfully")
                    sql2 = "insert into jobs_posted(job_id, person_id) values (%s, %s)"
                    values2 = (job_id, person_id)
                    cur.execute(sql2, values2)
                    print("Data for jobs_posted inserted successfully")

                    sql3 = "INSERT INTO placement_management_system.address (person_id, zip_code, city, state, address_line, parent_id) VALUES (%s, %s, %s, %s, %s, %s)"
                    values3 = (person_id, zip_code, city, state, address_line, person_id)
                    cur.execute(sql3, values3)
                    print("Data for address inserted successfully")
                    mysql.connection.commit()
                    
                    # return redirect("/users")
                    return redirect('/company-dashboard/'+str(person_id[0]))

                except mysql.connection.Error as error:
                    # print("Failed to insert data into MySQL table: {}".format(error))
                    mysql.connection.rollback()  # Roll back changes in case of error
                    # return "An error occurred while inserting data, Error is {}".format(error)
                    error = "{}".format(error)
                    return render_template('login/company_rep.html', value=error)

            except mysql.connection.Error as error:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                error = "{}".format(error)
                return render_template('login/company_rep.html', value=error)

        except mysql.connection.Error as error:
            # print("Failed to insert data into MySQL table: {}".format(error))
            mysql.connection.rollback()  # Roll back changes in case of error
            error = "{}".format(error)
            return render_template('login/company_rep.html', value=error)
            # return "An error occurred while inserting data, Error is {}".format(error)
    else:
        print('Redirecting without saving the data!')
        return render_template('login/company_rep.html')


# -------------------------------------STUDENT REGISTRATION------------------------------------------------------------------
@app.route('/student-registration', methods=['GET', 'POST'])
def student_reg():
    print(request.method)
    if request.method == 'POST':
        userDetails = request.form
        if 'file' not in request.files:
            flash('No file part')
            print('There is no file in registration form!')
            return redirect(request.url)

        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            print("NO files!!!!")
            return redirect(request.url)

        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
            profile_photo = file_to_binary(file_path)

        if 'rfile' not in request.files:
            flash('No resume file')
            print("No Resume file in registration form!!!!")
            return redirect(request.url)

        rfile = request.files['rfile']
        if rfile.filename == '':
            flash('No selected file')
            print("NO files!!!!")
            return redirect(request.url)

        if rfile and allowed_file(rfile.filename):
            filename = secure_filename(rfile.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            rfile.save(file_path)
            resume = file_to_binary(file_path)

        person_id = userDetails['person_id'],
        first_name = userDetails['first_name'],
        middle_name = userDetails['middle_name'],
        last_name = userDetails['last_name'],
        country_code = userDetails['country_code'],
        mobile_number = userDetails['mobile_number'],
        email_id = userDetails['email_id'],
        profile_photo = profile_photo,
        password = userDetails['password'],
        nationality = userDetails['nationality'],
        cpi = userDetails['cpi'],
        backlogs = userDetails['backlogs'],
        dob = userDetails['dob'],
        category = userDetails['category'],
        gender = userDetails['gender'],
        experience = userDetails['experience'],
        personal_email = userDetails['personal_email'],
        curr_program = 'Btech',
        joining_date = userDetails['joining_date'],
        zip_code = userDetails['zip_code'],
        city = userDetails['city'],
        state = userDetails['state'],
        address_line = userDetails['address_line'],
        tenth_board = userDetails['10th_board'],
        twelfth_board = userDetails['12th_board'],
        tenth_per = userDetails['10th_board_percentage'],
        twelfth_per = userDetails['12th_board_percentage'],
        comp_exam = userDetails['competative_exam'],
        exam_rank = userDetails['exam_rank'],

        # year_of_graduation = userDetails['year_of_graduation'],
        resume = resume,
        major_disc = 'cse',
        minor_disc = 'cse'
        x = {"country_code": country_code, "number": mobile_number}
        cur = mysql.connection.cursor()

        try:
            print("Data for person inserted successfully")
            sql = "INSERT INTO person(person_id, first_name, middle_name, last_name, mobile_number, email, profile_photo, password_hash, nationality, person_role) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (person_id, first_name, middle_name, last_name, json.dumps(
                x), email_id, profile_photo, password, nationality, "Student")
            cur.execute(sql, values)
            mysql.connection.commit()
            print("Data for person inserted successfully")

            try:
                sql1 = "INSERT INTO student (person_id, cpi, backlogs, category, gender, dob, professional_experience, personal_mail, year_of_graduation, current_program, cv, major_disciplines, minor_disciplines, date_of_joining,parent_id) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                values1 = (person_id, cpi, backlogs, category, gender, dob, experience, personal_email,
                           userDetails['year_of_graduation'][0:4], curr_program, resume, major_disc, minor_disc, joining_date, person_id)
                cur.execute(sql1, values1)
                print("Data for student inserted successfully")

                sql2 = "INSERT INTO placement_management_system.address (person_id, zip_code, city, state, address_line, parent_id) VALUES (%s, %s, %s, %s, %s, %s)"
                values2 = (person_id, zip_code, city, state, address_line, person_id)
                cur.execute(sql2, values2)
                print("Data for address inserted successfully")

                sql3 = "INSERT INTO placement_management_system.educational_details  (person_id, board_for_tenth, board_of_twelfth, tenth_percentage, twelfth_percentage, competitive_exam_name, competitive_exam_rank) VALUES (%s, %s, %s, %s, %s, %s, %s)"
                values3 = (person_id, tenth_board, twelfth_board, tenth_per, twelfth_per, comp_exam, exam_rank)
                cur.execute(sql3, values3)
                print("Data for education inserted successfully")

                mysql.connection.commit()
                return redirect("/student-dashboard/"+str(person_id[0]))
            # return redirect('/company-dashboard/'+str(person_id[0]))
                # return redirect("/stu")

            except mysql.connection.Error as error:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                error = "{}".format(error)
                return render_template('login/student.html', value=error)

        except mysql.connection.Error as error:
            # print("Failed to insert data into MySQL table: {}".format(error))
            mysql.connection.rollback()  # Roll back changes in case of error
            error = "{}".format(error)
            print(error)
            return render_template('login/student.html', value=error)
            # return "An error occurred while inserting data, Error is {}".format(error)

        # cur.close()

    else:
        print("Redirecting without saving data!")
        return render_template('login/student.html')


# --------------------------------ADMIN REGISTRATION--------------------------------------------------------------------------
@app.route('/administrator-registration', methods=['GET', 'POST'])
def admin_reg():
    print(request.method)
    print(request.__dict__)
    if request.method == 'POST':
        userDetails = request.form
        if 'file' not in request.files:
            flash('No file part')
            print('There is no file in registration form!')
            return redirect(request.url)

        file = request.files['file']
        # If the user does not select a file, the browser submits an
        # empty file without a filename.
        if file.filename == '':
            flash('No selected file')
            print("NO files!!!!")
            return redirect(request.url)

        if file and allowed_file(file.filename):
            filename = secure_filename(file.filename)
            file_path = os.path.join(app.config['UPLOAD_FOLDER'], filename)
            file.save(file_path)
            profile_photo = file_to_binary(file_path)

        person_id = userDetails['person_id'],
        first_name = userDetails['first_name'],
        middle_name = userDetails['middle_name'],
        last_name = userDetails['last_name'],
        country_code = userDetails['country_code'],
        mobile_number = userDetails['mobile_number'],
        email_id = userDetails['email_id'],
        profile_photo = profile_photo,
        password = userDetails['password'],
        nationality = "Indian",
        designation = userDetails['designation'],
        zip_code = userDetails['zip_code'],
        city = userDetails['city'],
        state = userDetails['state'],
        address_line = userDetails['address_line'],
        x = {"country_code": country_code, "number": mobile_number}
        cur = mysql.connection.cursor()

        try:
            sql = "INSERT INTO person(person_id, first_name, middle_name, last_name, mobile_number, email, profile_photo, password_hash, nationality, person_role) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
            values = (person_id, first_name, middle_name, last_name, json.dumps(
                x), email_id, profile_photo, password, nationality, "admin")
            cur.execute(sql, values)
            mysql.connection.commit()
            print("Data for admin inserted successfully")

            try:
                sql1 = "INSERT INTO administrator (person_id, designation, parent_id) VALUES (%s, %s, %s)"
                values1 = (person_id, designation, person_id)
                cur.execute(sql1, values1)

                sql2 = "INSERT INTO placement_management_system.address (person_id, zip_code, city, state, address_line, parent_id) VALUES (%s, %s, %s, %s, %s, %s)"
                values2 = (person_id, zip_code, city, state, address_line, person_id)
                cur.execute(sql2, values2)
                print("Data for address inserted successfully")

                mysql.connection.commit()
                print("Data for admin inserted successfully")
                return redirect("/admin-dashboard/"+str(person_id[0]))

            except mysql.connection.Error as error:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                error = "{}".format(error)
                print(error)
                return render_template('login/admin.html', value=error)

        except mysql.connection.Error as error:
            # print("Failed to insert data into MySQL table: {}".format(error))
            mysql.connection.rollback()  # Roll back changes in case of error
            error = "{}".format(error)

            print(error)
            return render_template('login/admin.html', value=error)
            # return "An error occurred while inserting data, Error is {}".format(error)
    else:
        print('redirecting without saving the data!')
        return render_template('login/admin.html')


# ----------------------------------------------------STUDENT DASHBOARD---------------------------------------------------
@app.route('/student-dashboard/<person_id>')
def student_dashboard(person_id):
    if session.get('loggedin'):
        return redirect('/student-profile/'+str(person_id))
    return redirect('/')

def has_access(user_id, person_id):
    user_id = str(user_id)
    # print(user_id, person_id)
    for i in range(len(user_id)):
        if (user_id[i] != person_id[i]): 
            return False
    return True

@app.route('/student-profile/<person_id>')
def student_profile(person_id):
    if 'loggedin' in session:
        user_id = session['id'] 
        if not has_access(user_id, person_id):
            error = "You are not allowed to access this page"
            return render_template('dashboard/std_error.html', error=error, person_id=user_id)
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person WHERE person_id=%s", [person_id])
        person = cur.fetchone()
        cur.execute("SELECT * FROM address WHERE person_id=%s", [person_id])
        address = cur.fetchone()
        cur.execute(
            "SELECT * FROM educational_details WHERE person_id=%s", [person_id])
        education = cur.fetchone()
        # print("This is person====>>>", person)
        if person[6] is not None:
            convertedImage = b64encode(person[6]).decode("utf-8")
        else:
            convertedImage = " "
        cur.execute("SELECT * FROM student WHERE person_id=%s", [person_id])
        student = cur.fetchone()
        # print("This is student====>>>", student)
        if student[6] is not None:
            resumePDF = b64encode(student[10]).decode('utf-8')
        else:
            resumePDF = " "

        if person and student:
            return render_template('dashboard/student-profile.html', person_id=person_id, person=person, student=student, image=convertedImage, resumePDF=resumePDF, address=address, education=education)
        else:
            error = "The student is not present"
            return render_template('dashboard/std_error.html', error=error, person_id=person_id)
    return redirect('/')


@app.route('/student-all-jobs/<person_id>')
def student_all_jobs(person_id):
    if session.get('loggedin'):
        cur = mysql.connection.cursor()
        resultValue = cur.execute("SELECT * FROM job_profile")
        if resultValue > 0:
            jobDetails = cur.fetchall()
            return render_template('dashboard/all_jobs.html', jobDetails=jobDetails, person_id=person_id)
        return render_template('dashboard/all_jobs.html', person_id=person_id)
    else:
        return redirect('/')


@app.route('/jobs/<job_id>')
def show_job_profile(job_id):
    if session.get('loggedin'):
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM job_profile WHERE job_id=%s", [job_id])
        job = cur.fetchone()
        if job[2] is not None:
            jd = b64encode(job[2]).decode('utf-8')
        else:
            jd = " "
        if job:
            cur.execute(
                "SELECT * FROM company_details WHERE job_id=%s", [job_id])
            company = cur.fetchone()
            if company:
                cur.execute(
                    "select * from prog_details where job_id=%s", [job_id])
                details = cur.fetchall()
                # print(details)
                if details:
                    return render_template('dashboard/one_job_details.html', job=job, company=company, details=details, jd=jd)
                else:
                    return render_template('dashboard/one_job_details.html', job=job, company=company, jd=jd)
            else:
                return render_template('dashboard/one_job_details.html', job=job, jd=jd)
        else:
            error = "No Job ID exists with this id"
            return render_template('dashboard/std_error.html', error=error)
    else:
        return redirect('/')


@app.route('/update-details/<person_id>', methods=['GET', 'POST'])
def update_cpi(person_id):
    # if session.get('loggedin'):
    if request.method == 'POST':
        # Fetch form data
        userDetails = request.form
        newcpi = userDetails['cpi']
        experience = userDetails['experience']
        print("newcpi ", newcpi)
        print("experience ", experience)
        try:
            cur = mysql.connection.cursor()
            cur.execute("UPDATE student SET cpi = %s, professional_experience=%s WHERE person_id = %s", (
                        newcpi, experience, person_id))
            mysql.connection.commit()
            print("Data for cpi updated successfully")
            return redirect("/student-profile/"+str(person_id))

        except mysql.connection.Error as error:
            # print("Failed to insert data into MySQL table: {}".format(error))
            mysql.connection.rollback()  # Roll back changes in case of error
            # return "An error occurred while inserting data, Error is {}".format(error)
            # print(error)
            error = "{}".format(error)
            # return "An occurred please try again later"
            # alert = "Some error occurred please try again later"
            return redirect("/student-profile/"+str(person_id))
    return render_template('dashboard/update_cpi.html', person_id=person_id)


@app.route('/student-eligible-jobs/<person_id>')
def student_eligible_jobs(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM student where person_id=%s", [person_id])
        person = cur.fetchone()
        if (person):
            # print("inside person")
            std_cpi = (person[1])
            # print(type(std_cpi))
            # cur.execute("SELECT * FROM job_profile where cutoff_cpi <= 8.0")

            cur.execute(
                "SELECT * FROM job_profile where cutoff_cpi <= "+str(std_cpi))
            resultValue = cur.fetchall()

            if len(resultValue) > 0:
                jobDetails = resultValue
                return render_template('dashboard/eligible_jobs.html', jobDetails=jobDetails, person_id=person_id)
            else:
                error = "No jobs present!"
                return render_template('dashboard/std_error.html', error=error, person_id=person_id)
        else:
            error = "No such person exists"
            return render_template('dashboard/std_error.html', error=error, person_id=person_id)
    else:
        return redirect('/')


@app.route('/filters/<person_id>')
def student_filter(person_id):
    if 'loggedin' in session:
        return render_template('dashboard/job_filters.html', person_id=person_id)
    return redirect("/")

@app.route('/filter_jobs/<person_id>/<job_profile>')
def filter_job_profile(person_id, job_profile):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        resultValue = cur.execute(
            "SELECT * FROM filters where job_profile=%s", [job_profile])
        if resultValue > 0:
            jobs = cur.fetchall()
            job_ids = []
            for job in jobs:
                job_ids.append(job[0])
            filtered_job_profiles = []
            for job_id in job_ids:
                resultValue = cur.execute("SELECT * FROM job_profile where job_id=%s", [job_id])
                if (resultValue>0):
                    req_job = cur.fetchone()
                    filtered_job_profiles.append(req_job)
            return render_template('dashboard/all_jobs.html', person_id=person_id, jobDetails = filtered_job_profiles)
        return render_template('dashboard/std_error.html', person_id=person_id, jobs="No jobs found")
    return redirect("/")

@app.route('/job_category/<person_id>/<job_category>')
def filter_job_category(person_id, job_category):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        resultValue = cur.execute(
            "SELECT * FROM filters where job_category=%s", [job_category])
        if resultValue > 0:
            jobs = cur.fetchall()
            job_ids = []
            for job in jobs:
                job_ids.append(job[0])
            filtered_job_profiles = []
            for job_id in job_ids:
                resultValue = cur.execute("SELECT * FROM job_profile where job_id=%s", [job_id])
                if (resultValue>0):
                    req_job = cur.fetchone()
                    filtered_job_profiles.append(req_job)
            return render_template('dashboard/all_jobs.html', person_id=person_id, jobDetails = filtered_job_profiles)
        return render_template('dashboard/std_error.html', person_id=person_id, jobs="No jobs found")
    return redirect("/")


@app.route('/student-applied-jobs/<person_id>')
def student_applied_jobs(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        resultValue = cur.execute(
            "SELECT * FROM applies_to where person_id=%s", [person_id])
        if resultValue > 0:
            jobs = cur.fetchall()
            jobDetails = []
            for i in range(0, len(jobs)):
                jobId = jobs[i][0]
                cur = mysql.connection.cursor()
                result = cur.execute(
                    "SELECT * FROM job_profile where job_id=%s", [jobId])
                if result > 0:
                    detail = cur.fetchone()
                    jobDetails.append(detail)
            return render_template('dashboard/all_jobs.html', jobDetails=jobDetails, person_id=person_id)
        else:
            error = "No Jobs Present!"
            return render_template('dashboard/std_error.html', error=error, person_id=person_id)
    else:
        return redirect('/')


# -------------------------------------------------COMPANY DASHBOARD---------------------------------------------------------
@app.route('/company-dashboard/<person_id>')
def company_dashboard(person_id):
    if session.get('loggedin'):
        return redirect('/company-profile/'+str(person_id))
    return redirect('/')
    # return render_template('dashboard/company_view.html', person_id=person_id)


@app.route('/company-profile/<person_id>')
def company_profile(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person WHERE person_id=%s", [person_id])
        person = cur.fetchone()
        print("This is person====>>>", person)
        if person[6] is not None:
            convertedImage = b64encode(person[6]).decode("utf-8")
        else:
            convertedImage = " "
        cur.execute(
            "SELECT * FROM company_details WHERE person_id=%s", [person_id])
        hr = cur.fetchone()
        person = list(person)
        person[4] = json.loads(person[4])
        person = tuple(person)
        cur.execute("SELECT * FROM address WHERE person_id=%s", [person_id])
        address = cur.fetchone()
        if person and hr:
            return render_template('dashboard/company-profile.html', person_id=person_id, person=person, hr=hr, address=address, image=convertedImage)
        else:
            error = "The hr is not present"
            return render_template('dashboard/cmp_error.html', error=error, person_id=person_id)
    return redirect('/')


@app.route('/jobs-posted/<person_id>')
def posted_jobs(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        resultValue = cur.execute(
            "SELECT * FROM jobs_posted WHERE person_id=%s", [person_id])
        if resultValue > 0:
            jobs = cur.fetchall()
            jobDetails = []
            for i in range(0, len(jobs)):
                jobId = jobs[i][0]
                cur = mysql.connection.cursor()
                result = cur.execute(
                    "SELECT * FROM job_profile where job_id=%s", [jobId])
                if result > 0:
                    detail = cur.fetchone()
                    jobDetails.append(detail)
            return render_template('dashboard/all_jobs_posted.html', jobDetails=jobDetails, person_id=person_id)
        else:
            error = "No jobs posted"
            return render_template('dashboard/cmp_error.html', error=error, person_id=person_id)
    return redirect('/')

@app.route('/<person_role>/help/<person_id>', methods=['GET', 'POST'])
def query_help(person_id, person_role):
    if request.method == 'POST':
        userDetails = request.form
        message = userDetails['message'],
        email = userDetails['email'],
        date = datetime.today().date()
        cur = mysql.connection.cursor()
        print(date)
        sql = "INSERT INTO queries (person_role, person_id, message, email_id, query_date) VALUES (%s, %s, %s, %s, %s)"
        values = (person_role, person_id, message, email, date)
        cur.execute(sql, values)
        mysql.connection.commit()
        alert = "Query Submitted Successfully!"
        if (person_role=="student"):
            return render_template('dashboard/std_help.html', person_id=person_id, alert=alert)
        return render_template('dashboard/company_help.html', person_id=person_id, alert=alert)
    if (person_role=="student"):
        return render_template('dashboard/std_help.html', person_id=person_id)
    return render_template('dashboard/company_help.html', person_id=person_id)

@app.route('/post-job/<person_id>', methods=['GET', 'POST'])
def post_job(person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            userDetails = request.form
            job_id = userDetails['job_id'],
            job_designation = userDetails['job_designation'],
            job_description = userDetails['job_description'],
            job_location = userDetails['job_location'],
            service_bond = userDetails['service_bond'],
            terms_and_conditions = userDetails['terms_and_conditions'],
            six_month_intern_possibility = userDetails['six_month_intern_possibility'],
            early_onboarding_possibility = userDetails['early_onboarding_possibility'],
            particularly_early_onboarding_required = userDetails[
                'particularly_early_onboarding_required'],
            early_graduate_students_are_excluded = userDetails['early_graduate_students_are_excluded'],
            shortlist_from_resume = userDetails['shortlist_from_resume'],
            ppt = userDetails['ppt'],
            technical_test = userDetails['technical_test'],
            psychometric_test = userDetails['psychometric_test'],
            group_discussion = userDetails['group_discussion'],
            technical_interviews = userDetails['technical_interviews'],
            hr_interviews = userDetails['hr_interviews'],
            cutoff_cpi = userDetails['cutoff_cpi'],
            start_date = userDetails['start_date'],
            end_date = userDetails['end_date'],
            aptitude_test = userDetails['aptitude_test'],
            cur = mysql.connection.cursor()

            cur.execute(
                "select * from company_details where person_id = %s", [person_id])
            job = cur.fetchone()

            try:
                sql2 = "INSERT INTO job_profile(job_id, job_designation, job_description, job_location, cutoff_cpi, service_bond, terms_and_condition, six_month_intern_possibility, early_onboarding_possibility, particularly_early_onboarding_required,early_graduate_students_are_excluded, current_status, start_date, end_date, shortlist_from_resume,eligible_minor_disc,ppt ,eligible_major_disc,technical_test ,aptitude_test,psychometric_test,group_discussion,technical_interviews,hr_interviews) VALUES(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                values2 = (job_id, job_designation, job_description, job_location, cutoff_cpi, service_bond, terms_and_conditions, six_month_intern_possibility, early_onboarding_possibility, particularly_early_onboarding_required,
                           early_graduate_students_are_excluded, "Job Posted", start_date, end_date, shortlist_from_resume,  "11110001001011", ppt,  "11110001001011", technical_test, aptitude_test, psychometric_test, group_discussion, technical_interviews, hr_interviews)
                cur.execute(sql2, values2)
                mysql.connection.commit()
                print("Data for job profile inserted successfully")
                try:

                    sql1 = "INSERT INTO company_details (person_id, job_id, company_rep, company_name, website, type_of_org, industry_sector, no_of_members, no_of_rooms_required, start_date, end_date,parent_id_1, parent_id) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
                    values1 = (job_id, person_id, job[2], job[3], job[4], job[5],
                               job[6], '1', '1', job[9], job[10], job_id, person_id)
                    cur.execute(sql1, values1)
                    print("Data for company_details inserted successfully")
                    sql2 = "insert into jobs_posted(job_id, person_id) values (%s, %s)"
                    values2 = (job_id, person_id)
                    cur.execute(sql2, values2)
                    print("Data for jobs_posted inserted successfully")
                    mysql.connection.commit()

                except mysql.connection.Error as error:
                    mysql.connection.rollback()
                    error = "{}".format(error)
                    print(error)

            except mysql.connection.Error as error:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                error = "{}".format(error)
                # return render_template('login/company_rep.html', value=error)

            return redirect('/jobs-posted/'+str(person_id))
        else:
            return render_template('dashboard/post-job.html', person_id=person_id)
    else:
        return redirect('/')


# ---------------------------------------------------ADMIN DASHBOARD--------------------------------------------------------


@app.route('/admin-dashboard/<person_id>')
def admin_dashboard(person_id):
    if session.get('loggedin'):
        return redirect('/admin-profile/'+str(person_id))
    return redirect('/')
    # return render_template('dashboard/admin_view.html', person_id=person_id)


@app.route('/admin-profile/<person_id>')
def admin_profile(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person WHERE person_id=%s", [person_id])
        person = cur.fetchone()
        print("This is person====>>>", person)
        if person[6] is not None:
            convertedImage = b64encode(person[6]).decode("utf-8")
        else:
            convertedImage = " "
        cur.execute(
            "SELECT * FROM administrator WHERE person_id=%s", [person_id])
        admin = cur.fetchone()
        cur.execute("SELECT * FROM address WHERE person_id=%s", [person_id])
        address = cur.fetchone()
        person = list(person)
        person[4] = json.loads(person[4])
        person = tuple(person)
        if person and admin:
            return render_template('dashboard/admin-profile.html', person_id=person_id, person=person, admin=admin, address=address, image=convertedImage)
        else:
            error = "The admin is not present"
            return render_template('dashboard/adm_error.html', error=error, person_id=person_id)
    return redirect('/')


@app.route('/admin-add-company/<person_id>', methods=['GET', 'POST'])
def admin_add_company(person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            # Fetch form data
            userDetails = request.form
            email_id = userDetails['email_id'],
            hr_status = userDetails['status'],
            company_name = userDetails['company_name'],
            # print(email_id, hr_status, company_name)
            try:
                cur = mysql.connection.cursor()
                sql = "insert into hr (email_id, hr_status, company_name, parent_id) VALUES (%s, %s, %s, %s)"
                values = (email_id[0], hr_status[0],
                          company_name[0], person_id)
                print(values)
                cur.execute(sql, values)
                mysql.connection.commit()
                print("Data for hr_invited inserted successfully")
                return redirect("/admin-dashboard/"+str(person_id))

            except mysql.connection.Error as error1:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                # print(error)
                error1 = "{}".format(error)
                error = "An occurred please try again later"
                return render_template('dashboard/adm_error.html', error=error, person_id=person_id)

        return render_template('dashboard/add_company.html', person_id=person_id)
    return redirect('/')


@app.route('/edit-company-status/<person_id>', methods=['POST', 'GET'])
def edit_company_status(person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            # Fetch form data
            userDetails = request.form
            email_id = userDetails['email_id'],
            hr_status = userDetails['new_status'],
            try:
                cur = mysql.connection.cursor()
                cur.execute("UPDATE hr SET hr_status = %s WHERE email_id = %s", [
                            hr_status, email_id])
                mysql.connection.commit()
                print("Data for hr_invited updated successfully")
                return redirect("/admin-dashboard/"+str(person_id))

            except mysql.connection.Error as error1:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                # print(error)
                error1 = "{}".format(error)
                error = "An occurred please try again later"
                return render_template('dashboard/adm_error.html', error=error, person_id=person_id)
        return render_template('dashboard/edit-company-status.html', person_id=person_id)
    return redirect('/')


@app.route('/delete-company/<person_id>', methods=['GET', 'POST'])
def delete_company(person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            # Fetch form data
            userDetails = request.form
            email_id = userDetails['email_id'],
            cur = mysql.connection.cursor()
            try:
                cur.execute("Select * from hr where email_id = %s", [email_id])
                hr = cur.fetchone()
                # print(hr)
                if (hr):
                    cur.execute(
                        "DELETE FROM hr WHERE email_id = %s", [email_id])
                    mysql.connection.commit()
                    print("Data for hr deleted successfully")
                    return redirect("/admin-dashboard/"+str(person_id))
                else:
                    error = "Email-ID do not exists"
                    return render_template('dashboard/delete_company.html', error=error, person_id=person_id)

            except mysql.connection.Error as error:
                # print("Failed to insert data into MySQL table: {}".format(error))
                mysql.connection.rollback()  # Roll back changes in case of error
                # return "An error occurred while inserting data, Error is {}".format(error)
                # print(error)
                error = "{}".format(error)
                return render_template('dashboard/delete_company.html', error=error, person_id=person_id)
        return render_template('dashboard/delete_company.html', person_id=person_id)
    return redirect('/')


@app.route('/all-jobs-posted/<job_id>')
def show_job_posted_profile(job_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM job_profile WHERE job_id=%s", [job_id])
        job = cur.fetchone()
        if job[2] is not None:
            jd = b64encode(job[2]).decode('utf-8')
        else:
            jd = " "
        if job:
            cur.execute("select * from prog_details where job_id=%s", [job_id])
            details = cur.fetchall()
            if details:
                return render_template('dashboard/one_job_details.html', job=job, details=details, jd=jd)
            return render_template('dashboard/one_job_detail_1.html', job=job, jd=jd)
        else:
            return "No Job ID exists with this id"
    return redirect('/')


@app.route('/eligible_jobs/<job_id>/<person_id>', methods=['GET', 'POST'])
def show_eligible_job_profile(job_id, person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            cur = mysql.connection.cursor()
            cur.execute(
                "select * from applies_to where person_id=%s and job_id=%s", [person_id, job_id])
            jobs = cur.fetchall()
            if (jobs):
                error = "You already applied for this job"
                return render_template('dashboard/adm_error.html', error=error, person_id=person_id)
            else:
                # print("no jobs")
                try:
                    sql = "Insert into applies_to (job_id, person_id, is_protected, curr_status) values (%s, %s, %s, %s)"
                    values = (job_id, person_id, "1", "Applied")
                    cur.execute(sql, values)
                    mysql.connection.commit()
                    return redirect("/student-applied-jobs/"+str(person_id))
                except mysql.connection.Error as error:
                    return error
        else:
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM job_profile WHERE job_id=%s", [job_id])
            job = cur.fetchone()
            if job:
                cur.execute(
                    "SELECT * FROM company_details WHERE job_id=%s", [job_id])
                company = cur.fetchone()
                if company:
                    cur.execute(
                        "select * from prog_details where job_id=%s", [job_id])
                    details = cur.fetchall()
                    print(details)
                    if details:
                        return render_template('dashboard/one_job_details.html', job=job, company=company, details=details, apply=1, job_id=job_id, person_id=person_id)
                    else:
                        return render_template('dashboard/one_job_details.html', job=job, company=company, apply=1, job_id=job_id, person_id=person_id)
                else:
                    error = "not mapped to a comapny"
                    return render_template('dashboard/adm_error.html', error=error, person_id=person_id)
            else:
                error = "No Job ID exists with this id"
                return render_template('dashboard/adm_error.html', error=error, person_id=person_id)

    else:
        return redirect('/')


@app.route('/apply/<job_id>/<person_id>', methods=['GET', 'POST'])
def apply(job_id, person_id):
    if 'loggedin' in session:
        if request.method == 'POST':
            cur = mysql.connection.cursor()
            try:
                cur.execute(
                    "select * from person where person_id=%s and job_id=%s", [person_id, job_id])
                jobs = cur.fetchall()
            except mysql.connection.Error as error:
                jobs = error
        return jobs


@app.route('/private')
def private():
    if 'loggedin' in session:
        # Get user data from database
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person WHERE person_id=%s",
                    (session['id'],))
        user = cur.fetchone()
        cur.close()
        user_id = user[0]
        if (user[9] == "student" or user[9] == "Student"):
            return redirect('/student-dashboard/'+str(user_id))
        elif (user[9] == "admin" or user[9] == "Admin"):
            return redirect('/admin-dashboard/'+str(user_id))
        elif (user[9] == "company_rep"):

            return redirect('/company-dashboard/'+str(user_id))
        else:
            return "you are either company rep or admin or an unregistered student"

    else:
        # User is not loggedin, redirect to login page
        return redirect(url_for('login'))


@app.route('/delete_account/<person_id>', methods=['POST', 'GET'])
def delete_account(person_id):
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person WHERE person_id=%s", [person_id])
        user = cur.fetchone()
        if (user[9] == "student" or user[9] == "Student"):
            cur.execute("DELETE FROM student WHERE person_id=%s", [person_id])

        elif (user[9] == "admin" or user[9] == "Admin"):
            cur.execute(
                "DELETE  FROM administrator WHERE person_id=%s", [person_id])

        elif (user[9] == "company_rep"):
            cur.execute(
                "DELETE  FROM company_details WHERE person_id=%s", [person_id])

        cur.execute("DELETE FROM person WHERE person_id=%s", [person_id])
        mysql.connection.commit()
        session.pop('loggedin', None)
        session.pop('id', None)
    return redirect(url_for('login'))

# --------------------------------------------------------------------------------------------------------------------
@app.route('/xss/<person_id>')
def xss(person_id):
    if session.get('loggedin'):
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM person where person_id=%s", [person_id])
        person = cur.fetchone()   
        return render_template('dashboard/xss.html', person_id=person_id, person=person)
    else:
        return redirect('/')

@app.route('/see-queries/<person_id>')
def see_queries(person_id):
    if session.get('loggedin'):
        cur = mysql.connection.cursor()
        cur.execute("SELECT * FROM queries")
        queries = cur.fetchall()
        return render_template('dashboard/see_queries.html', person_id=person_id, queries = queries)
    return render_template('dashboard/see_queries.html', person_id=person_id)

# ---------------------------------------------------------------------------------------------------------------------
@app.after_request
def add_header(response):
    # Prevent back button after logout
    response.headers['Cache-Control'] = 'no-cache, no-store, must-revalidate'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    return response


app.secret_key = "secret key"
if __name__ == '__main__':
    app.run(debug=True)




