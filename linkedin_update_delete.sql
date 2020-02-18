USE LINKEDIN;

/* MEMBERS tablosu için */

UPDATE MEMBERS SET lname='Atar' WHERE member_id=1;
DELETE FROM MEMBERS WHERE member_id=7;
INSERT INTO MEMBERS (birthday, e_mail, password_, fname, minit, lname, gender, join_date, other, address_id, current_organization_id, marital_status_id) VALUES
('1997-12-22','iremtunc@gmail.com','irem123','Irem',NULL,'Tunc','Female','2014-10-22 07:32:13',NULL,2,4,2);

/* CV_SECTION tablosu için*/

UPDATE CV_SECTION SET description_='Front-End Developer' WHERE cv_section_id=1;
DELETE FROM CV_SECTION WHERE cv_section_id=2;
INSERT INTO CV_SECTION (title, description_, date_created, date_updated, cv_id) VALUES
('Education','Teacher','2016-05-13 15:00:00','2017-01-13 22:00:00', 3);

/* PROFILE_SECTION tablosu için*/

UPDATE PROFILE_SECTION SET title='Course' WHERE profile_section_id=1;
DELETE FROM PROFILE_SECTION WHERE profile_section_id=2;
INSERT INTO PROFILE_SECTION (title, text_, date_created, date_updated, profile_id) VALUES
('Languages','Yabacnı dil ve dans kursu','2016-05-13 15:00:00','2017-01-13 22:00:00',1);


