USE LINKEDIN;

INSERT INTO ADDRESS  (address_id, line1, line2,line3,city,zip,country) VALUES
(1, 'Yunus Emre Mah.', '6444 Sok. No:3','Baris Apartmani', 'izmir', NULL, 'Turkey'),
(2, 'Altintop Mah.', 'Lise Cad. No:2','Zafer Apartmani', 'ankara', NULL,'Turkey'),
(3, 'Ataturk Mah.', '22. Cad. No:5', 'Database Apartmani', 'izmit', NULL, 'Turkey'),
(4, 'Bornova Mah.', 'Universite Cad.', 'Ege Apartmani', 'izmir', NULL, 'Turkey'),
(5, 'Bahçelievler Mah.', 'Anavatan Cad.', 'Beşiktaş', 'istanbul', default, 'Turkey');

INSERT INTO MARITAL_STATUS (marital_status_id, marital_status) VALUES
(1,'Single'),
(2,'in Relationship'),
(3,'Married'),
(4,'Separated');

INSERT INTO ORGANIZATIONS (org_id, org_name, org_description, other) VALUES
(1,'Tanisma Partisi','Tanismak isteyenlerin katilimi rica olunur.',NULL),
(2,'Klup Toplantisi','Etkinlik planlari icin toplanilacaktir.','Okulda toplanilacak.'),
(3,'Aksam Yemegi','Tum uyelerimiz davetlidir.',NULL),
(4,'Kutlama','Eglence icin herkesi bekliyoruz.',NULL);

INSERT INTO MEMBERS (member_id, birthday, e_mail, password_, fname, minit, lname, gender, join_date, other, address_id, current_organization_id, marital_status_id) VALUES
(1,'1997-12-22','iremtunc@gmail.com','irem123','Irem',NULL,'Tunc','Female','2014-10-22 07:32:13',NULL,1,4,2),
(2,'1995-10-28','salihatar@gmail.com','salih96','Salih','Muhammed','Atar','Male', '2017-07-27 10:32:13',NULL,1,2,4),
(3,'1993-06-21','ozge12@gmail.com','ozge1212','Ozge','Nur','Capuk','Female','2013-11-25 15:32:13',NULL,3,1,3),
(4,'1997-05-12','yasinbey@gmail.com','123yasin123','Yasin',NULL,'Ayhan','Male','2011-08-25 12:32:13',NULL,2,2,2),
(5,'1992-07-08','nurcan_92@gmail.com','asdfgh32','Nurcan',NULL,'Ozcan','Female','2018-07-20 14:32:13',NULL,2,1,3),
(6,'1998-07-10','ahmet_izmirli@gmail.com','izmir35ahmet','Ahmet',NULL,'Bircan','Male','2012-01-14 07:32:13',NULL,3,2,4),
(7,'1996-10-11','mehmet_gulay@hotmail.com','23568ege','Mehmet','Birol','Ayyildiz','Male','2014-02-13 09:32:13',NULL,2,4,3),
(8,'1999-04-17','aysekaraman@gmail.com','karaman458','Ayse',NULL,'Karaman','Male','2012-03-18 08:42:13',NULL,1,3,3);

INSERT INTO COMPANY (company_id, cname, sector, size, ctype, cdesc, logo, address_id, boss) VALUES
(1, 'Trenkwalder Turkey', 'Satış-Pazarlama', '1000-5000 Çalışan', 'Özel şirket', default, 'jpeg.', 5, 5),
(2, 'Turktelekom', 'Telekomünikasyon', '10000+ Çalışan', 'Halka açık özel şirket', default, 'jpef', 5, null),
(3, 'Ciceksepeti.com', 'Online alışveris', '51-200 Çalışan', 'Halka açık özel şirket', 'Sevdiklerinize çiçek hediye edin', 'cicek.jpeg', 4, 3);

INSERT INTO JOB_OFFER (job_id, job_title, location, job_function, emplooye_type, seniority, offer_desc, created_at, company_id) VALUES
(1, 'Video procuder', 'istanbul', 'Bilgi teknolojisi, sanat, yaratıcılık', 'Tam zamanlı', 'Orta-üst düzey', null, default, 2),
(2, 'Mobility specialist', 'İstanbul', 'Bilgi teknolojisi', 'Tam zamanlı', 'Senior', null, default, 2),
(3, 'Satış Pazarlama Uzmanı', 'İzmir', 'Satış, Pazarlama, Müşteri hizmetleri', 'Yarı zamanlı', 'Uzman', null, default, 1);

INSERT INTO FOLLOWS_ (member_id, company_id) VALUES
(1, 1),
(2, 1),
(4, 2),
(5, 2),
(6, 2), 
(3, 3);

INSERT INTO GROUPS_ (group_id,group_name,group_description,group_start,group_end,group_last_activity,other,create_member_id) VALUES
(1,'Gida Muhendisleri', 'Gida Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2016-01-13 22:00:00', '2015-01-13 18:00:00',NULL,2),
(2,'Bilgisayar Muhendisleri', 'Bilgisayar Muhendisleri giris yapabilir :)', '2013-01-13 22:00:00', '2014-01-13 23:00:00', '2013-01-13 22:00:00',NULL,7),
(3,'Elektirik Muhendisleri', 'Elektirik Elektronik Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2016-01-13 22:00:00', '2015-01-13 22:00:00',NULL,5),
(4,'Makine Muhendisleri', 'Makine Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2017-01-13 21:00:00', '2016-09-13 21:00:00',NULL,3),
(5,'Insaat Muhendisleri ', 'Insaat Muhendisleri giris yapabilir :)', '2012-01-13 22:00:00', '2018-01-13 20:00:00', '2017-10-13 21:00:00',NULL,8);

INSERT INTO CV (cv_id,date_created,date_updated,member_id) VALUES
(1,'2016-05-13 15:00:00','2017-05-13 15:00:00',2),
(2,'2016-05-13 15:00:00','2017-01-13 22:00:00',6),
(3,'2016-11-21 15:00:00','2017-01-13 15:00:00',8),
(4,'2016-05-13 15:00:00','2017-01-13 22:00:00',4);

INSERT INTO CV_SECTION (cv_section_id, title, description_, date_created, date_updated, cv_id) VALUES
(1,'Work Experience','Software Engineer','2016-05-13 15:00:00','2017-01-13 22:00:00', 3),
(2,'Education','Ege Üniversitesi Bilgisayar Mühendisliği','2016-05-13 15:00:00','2018-01-13 22:00:00', 1),
(3,'Licance And Sertificated','Girisimcilik Sertifikası','2016-05-13 15:00:00','2017-01-13 22:00:00', 2),
(4,'Volunteer Experience','Toplum Gönüllüleri Vakfı','2016-05-13 15:00:00','2018-01-13 22:00:00', 4);

INSERT INTO PROFILE_ (profile_id, date_created, date_updated, member_id) VALUES
(1,'2016-05-13 15:00:00','2017-01-13 22:00:00',4),
(2,'2012-05-14 15:00:00','2017-01-13 22:00:00',7),
(3,'2013-05-21 15:00:00','2017-01-13 22:00:00',8),
(4,'2011-05-17 15:00:00','2017-01-13 22:00:00',3),
(5,'2016-05-26 15:00:00','2018-02-13 22:00:00',2),
(6,'2017-03-27 15:00:00','2017-05-13 15:00:00',1),
(7,'2018-01-02 15:00:00','2018-05-13 15:00:00',5),
(8,'2010-05-09 15:00:00','2016-05-13 13:00:00',6);

INSERT INTO PROFILE_SECTION (profile_section_id, title, text_, date_created, date_updated, profile_id) VALUES
(1,'course','Gitar Kursu,Resim Kursu','2016-05-13 15:00:00','2017-01-13 22:00:00',1),
(2,'languages','Ingilizce,Almanca','2016-05-13 15:00:00','2017-01-13 22:00:00',3);

INSERT INTO CONNECTS(member_id, connected_member_id, connection_date) VALUES
(1,2,'2017-03-27 15:00:00'),
(2,3,'2017-03-27 15:00:00'),
(3,4,'2017-03-27 15:00:00'),
(4,2,'2017-03-27 15:00:00'),
(5,1,'2017-03-27 15:00:00'),
(6,4,'2017-03-27 15:00:00'),
(7,1,'2017-03-27 15:00:00'),
(8,2,'2017-03-27 15:00:00');

INSERT INTO RECOMMENDATION (member_id, recommended_id, start_date, others_) VALUES
(1, 2, '2014-12-23 10:05:55', NULL),
(1, 3, '2014-12-23 10:05:55', NULL);

INSERT INTO MEMBER_GROUPS (member_id, group_id, date_joined, date_left) VALUES
(1, 1, '2012-01-13 22:00:00',default),
(2, 2, '2012-01-13 22:00:00',default);































