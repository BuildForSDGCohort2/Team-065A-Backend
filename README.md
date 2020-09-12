# Team-065A-Backend

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/9ff0babe29e74d9a8eb7f9d299cf1d29)](https://app.codacy.com/gh/BuildForSDGCohort2/Team-065A-Backend?utm_source=github.com&utm_medium=referral&utm_content=BuildForSDGCohort2/Team-065A-Backend&utm_campaign=Badge_Grade_Settings)

Team-065-A-Backend

This repository contains the API endpoints for the Quateach project.

---

---

## Endpoints

All endpoints start with api/v1/

---

### Sign in - sign_in

i.e api/v1/sign_in

### Sign Up - sign_up

i.e api/v1/sign_up

### Forgot Password - forgot_password

i.e api/v1/forgot_password

includes the email to be sent to the user, hence the token would be used in the custom url when resetting the password

---

### User - users

(When signing up, this is the default model for everybody . you can only edit , show and destroy from this endpoints)

### Teacher - teachers

(Only use this change a teacher's description)

### Student - students

(Only use this change a student's age, level or courses)

### Parent - parents

(Only use this to change a parents's age, level or courses if the parent has children)

### School - schools

(Only use this to change the age, level or courses the school is interested in )

### Other - others

(This just means other organizations that are related to academics. Only use this to change the age, level or courses the institution is interested in)

### Review - reviews

(All users can create reviews for a teacher. This includes the rating,content,owner and who the review is meant for )

---

### **For Teachers Only**

### Courses - courses

(Create, edit, show, delete Teachers' courses and also sort Teachers according to courses)

### Education - educations

(this is just the educational info of the teachers which include institution,year attended, year finished and certificate etc)

### Post - posts

(A teacher can create posts , edit them and also delete them . it includes the title and the content)

---

---

| Endpoints       | Requests | Hash      | Params                                                                  |
| --------------- | -------- | --------- | ----------------------------------------------------------------------- |
| sign_in         | C        | login     | email, password,remember                                                |
| sign_up         | C        | users     | email, password, password_confirmation, phone, full_name, user_type     |
| users           | RUD      | update    | id, email, gender, address, phone, avatar, state, country               |
| teachers        | RU       | ---       | id, description                                                         |
| parents         | U        | user      | age, level, mycourses                                                   |
| students        | U        | student   | age, level, mycourses                                                   |
| schools         | U        | user      | age, level, mycourses                                                   |
| others          | U        | user      | age, level, mycourses                                                   |
| reviews         | CUD      | review    | id, no, content, rating, owner                                          |
| educations\*    | CUD      | education | id, no, institution, year_from, year_to, certificate, certificate_proof |
| posts           | CUD      | post      | id, no, title, content                                                  |
| courses\*       | CRUD     | ---       | id, no,coursename                                                       |
| forgot_password | CU       | users     | id, email\*(no hash on this),password,password_confirmation             |

<br>

\* - Only for teachers

--- - no hash use the params like that

C - Create - POST

R - Read or Show - GET

U - Update or Edit - PATCH

D - destroy or delete - DELETE

---

---

### Notes

For RUD requests that may need **id** as a params, use it raw without any hash key.

For endpoints that need to update or delete 1 or more contents **no** is the param that should be sent
i.e For Posts, Reviews, Educations, Courses, you pass **id** and **no** as ordinary params
e.g I want to delete my 2nd post , **no** will have the value of 1 since indexing starts from 0 etc

---

---

### Validations

Validations are only implemented on sign-in and sign-up . Coming soon to all other models

---

---

### Errors and Bugs

You might never know , this is still in a developmental stage
