USE social_resume_database; 

INSERT INTO COUNTRY (country_id, country_name) VALUES
	(1, 'Türkiye'),
    (2, 'Fransa'),
    (3, 'İngiltere'),
    (4, 'Amerika'),
    (5, 'Japonya');
    
INSERT INTO CITY (city_id, city_name, country_id) VALUES
	(1, 'İzmir', 1),
    (2, 'Eskişehir', 1),
    (3, 'Tekirdağ', 1),
    (4, 'Paris', 2),
    (5, 'Tokyo', 5),
    (6, 'Londra', 3),
    (7, 'Ankara', 1);

INSERT INTO ORGANIZATIONS (org_id, org_name, org_description, other) VALUES
	(1,'Tanisma Partisi','Tanismak isteyenlerin katilimi rica olunur.',NULL),
	(2,'Klup Toplantisi','Etkinlik planlari icin toplanilacaktir.','Okulda toplanilacak.'),
	(3,'Aksam Yemegi','Tum uyelerimiz davetlidir.',NULL),
	(4,'Kutlama','Eglence icin herkesi bekliyoruz.',NULL);

INSERT INTO MEMBERS (member_id, e_mail, password_, fname, minit, lname, gender, marital_status, profile_picture, current_organization_id, join_date, other) VALUES
	(1, 'ozgenurcapuk@gmail.com', '123456', 'Özgenur', null , 'Çapuk', 'Female', 'in Relationship', 'ben.jpg', 4, default, null),
    (2, 'iremtunc@gmail.com', '123456', 'İrem', null, 'Tunç', 'Female', 'Single', 'me.jpeg', 1, default, null),
	(3, 'yasinbey@gmail.com','123yasin123','Yasin', null ,'Kaya', 'Male', 'in Relationship', null, 3, default, null),
	(4, 'salihatar@gmail.com', 'salih123', 'Salih', 'Muhammed', 'Atar', 'Male', 'Single', null, 1, default, null),
    (5, 'merve@hotmail.com', '987654', 'Merve', 'Eda', 'Bilgili', 'Female', 'Married', '1.jpeg', 2, default, null),
    (6, 'mehmet_gulay@hotmail.com', '1457854', 'Mehmet', 'Birol', 'Ayyildiz', 'Male', 'Separated' , null , 3, default, null);
    
INSERT INTO PROFILE_ (profile_id, numberOfFriends , phone_number, birthday, about_me, interests, religion, hobbies, fav_movies, fav_artists, fav_books, fav_animals, everything_else, date_created, date_updated, member_id) VALUES
	(1, 0, '5434605055', '1996-07-04', 'Bilgisayar mühendisliği öğrencisi', null, null, 'Uyumak', 'Interstellar, Inception, Doctor Who', 'Johnny Depp, Jim Carry', 'Harry Potter Series', 'Dogs', null, default, default, 1),
    (2, 0, '5371234545', '1997-02-13', null, null, 'Muslim', 'Programlama', null, 'Benedict Cumberbatch', 'Uçurtma Avcısı', 'Cat', null, default, default, 2),
    (3, 0, '5415412323', '1991-08-27', 'Elektrik elektronik okuyor', null, null, 'Bilgisayar oyunları', 'Game of Thsrones', 'Emilia Clarke', 'Yüzüklerin Efendisi', 'bütün hayvanlar', null, default, default, 3),
    (4, 0, '5478962312', '1990-09-02', 'Yapı Kredi İş Analisti',null ,null ,null ,null ,null ,null ,'Cats' ,null , default, default, 4),
    (5, 0, '5461237889', '1980-01-01', null, null,'Inancsız', 'Youtube, Video editlemek', 'Notebook', 'Brad Pitt', null, 'Cats', 'kanalımı takip etmeyi unutmayın', default, default, 5),
    (6, 0, null, '1992-07-15', null, null, null, 'Kitap yazmak, şarkı söylemek, resim yapmak', 'Doctor Who, Memento', 'Queen, Sting', 'Kişisel gelişim', 'Tüm hayvanları severim:)', null, default, default, 6);

INSERT INTO ADDRESS (address_id, address, member_id, city_id) VALUES
	(1, 'Ergene mah. 544 sok.' , 1, 1),
    (2, 'Atatürk mah. 120 sok.', 1, 2),
    (3, 'Champ de Mars, 5 Avenue Anatole', 3, 4),
    (4, '17 Place du Trocadéro et du 11 Novembre', 2, 4),
    (5, '221b Baker St, Marylebone', null, 6),
    (6, 'İnönü mah. 152 sokak',5, 1),
    (7, 'yasemin mah, 70 sokak', null, 2),
    (8, 'orman findanlıgı', null, 2);

INSERT INTO COMPANY (company_id, cname, sector, size, ctype, cdesc, logo, address_id, boss) VALUES
	(1, 'Trenkwalder Turkey', 'Satış-Pazarlama', '1000-5000 Çalışan', 'Özel şirket', default, 'jpeg.', 5, 5),
	(2, 'Turktelekom', 'Telekomünikasyon', '10000+ Çalışan', 'Halka açık özel şirket', default, 'jpef', null, null),
	(3, 'Ciceksepeti.com', 'Online alışveris', '51-200 Çalışan', 'Halka açık özel şirket', 'Sevdiklerinize çiçek hediye edin', 'cicek.jpeg', 6, 3);

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
    
INSERT INTO NICKNAME (nickname_id, nickname, member_id) VALUES
	(1, 'ozgenurc', 1),
    (2, 'iremtnc', 2),
    (3, 'ysnky', 3),
    (4, 'slhky', 4),
    (5, 'mevy', 5),
    (6, 'mhmt26',6);
    
INSERT INTO FRIEND (member_id, friend_member_id, is_subscriber, created_at) VALUES
	(1, 2, 1, default),
    (1, 3, 1, default),
    (1, 4, 1, default),
    (1, 5, 1, default),
    (5, 6, 1, default),
    (5, 4, 1, default),
    (5, 3, 1, default);
	
INSERT INTO GROUPS_ (group_id, group_name, group_description, group_start, group_end, group_last_activity, other, create_member_id) VALUES
	(1,'Gida Muhendisleri', 'Gida Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2016-01-13 22:00:00', '2015-01-13 18:00:00',NULL,1),
	(2,'Bilgisayar Muhendisleri', 'Bilgisayar Muhendisleri giris yapabilir :)', '2013-01-13 22:00:00', '2014-01-13 23:00:00', '2013-01-13 22:00:00',NULL,2),
	(3,'Elektirik Muhendisleri', 'Elektirik Elektronik Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2016-01-13 22:00:00', '2015-01-13 22:00:00',NULL,1),
	(4,'Makine Muhendisleri', 'Makine Muhendisleri giris yapabilir :)', '2015-01-13 22:00:00', '2017-01-13 21:00:00', '2016-09-13 21:00:00',NULL,3),
	(5,'Insaat Muhendisleri ', 'Insaat Muhendisleri giris yapabilir :)', '2012-01-13 22:00:00', '2018-01-13 20:00:00', '2017-10-13 21:00:00',NULL,5);

INSERT INTO EVENTS_ (event_id, event_name, event_description, event_start, event_end, event_address_id, other, create_member_id) VALUES
	(1, 'Mezun Yemeği', 'Mezunlarımızı bekleriz', '2019-01-01', '2019-01-02', 7, null, 1),
    (2, 'Piknik', null, '2019-05-25', null, 8, null, null),
    (3, 'Bilmüh Toplantısı', null, '2018-12-16', null, 5, null,1);

INSERT INTO PAGES (page_id, page_name, page_description, other, create_member_id) VALUES
	(1, '2014 Girişliler', 'Ege Üni 2014 girişliler sayfası', null, 1),
    (2, 'Oyun Dünyası', 'Oyun severler buraya', null, 3), 
    (3, 'Bilmüh', null, null, 4);

INSERT INTO CV (cv_id,date_created,date_updated,member_id) VALUES
	(1,'2016-05-13 15:00:00','2017-05-13 15:00:00',1),
	(2,'2016-05-13 15:00:00','2017-01-13 22:00:00',2),
	(3,'2016-11-21 15:00:00','2017-01-13 15:00:00',3),
	(4,'2016-05-13 15:00:00','2017-01-13 22:00:00',4);    

INSERT INTO CV_SECTION (cv_section_id, title, description_, date_created, date_updated, cv_id) VALUES
	(1,'Work Experience','Software Engineer','2016-05-13 15:00:00','2017-01-13 22:00:00', 1),
	(2,'Education','Ege Üniversitesi Bilgisayar Mühendisliği','2016-05-13 15:00:00','2018-01-13 22:00:00', 1),
	(3,'Licance And Sertificated','Girisimcilik Sertifikası','2016-05-13 15:00:00','2017-01-13 22:00:00', 1),
	(4,'Volunteer Experience','Toplum Gönüllüleri Vakfı','2016-05-13 15:00:00','2018-01-13 22:00:00', 1),
	(5,'Work Experience','iş Analisti','2016-06-13 15:00:00','2017-04-13 22:00:00', 2),
	(6,'Education','ODTU Bilgisayar Mühendisliği','2016-08-13 15:00:00','2018-09-13 22:00:00', 4);
    
INSERT INTO PROFILE_SECTION (profile_section_id,title,text_,date_created,date_updated,profile_id) VALUES
	(1,'Course','Gitar Kursu,Resim Kursu','2016-05-13 15:00:00','2017-01-13 22:00:00',1),
	(2,'Languages','Ingilizce,Almanca','2016-05-13 15:00:00','2017-01-13 22:00:00',3);

INSERT INTO CONNECTS(member_id,connected_member_id,connection_date) VALUES
	(1, 2, default),
    (1, 3, default),
    (2, 4, default), 
    (2, 5, default),
    (1, 4, default), 
    (5, 1, default), 
    (5, 6, default);
    
INSERT INTO RECOMMENDATION (member_id, recommended_id, start_date, others_) VALUES
	(1, 2, '2014-12-23 10:05:55', NULL),
	(1, 3, '2014-12-23 10:05:55', NULL),
    (4, 6, default, null);
    
INSERT INTO BCATEGORY (bookmark_category_id, bname) VALUES
	(1, 'Page'),
    (2, 'Group'),
    (3, 'Event'),
    (4, 'Application');
    
INSERT INTO BOOKMARK (bookmark_id, url, clicks, rating, favorite, bookmark_category_id, member_id) VALUES
	(1, 'www.faceboook.com/mezunsayfasi', 1000, 5, default, 1, 1),
    (2, 'www.facebook.com/mezunlargrubu', 500,4, default, 2, 1),
    (3, 'www.facebook.com/mezunlartoplantısı',250, 4, default, 3, 1),
    (4, 'www.facebook.com/games/candycrush',10000, 5, default, 4, 3);
    
INSERT INTO STATUS_ (status_id, message, created_at, thumbs_up, thumbs_down, member_id) VALUES
	(1, 'We can do it!', '2018-12-15 19:30:00', 2,1,1),
    (2, 'Havalar çok soğuk', '2018-12-15 19:30:00', 2, 2, 2),
    (3, 'Çok uykum var', '2018-12-16 02:00:00', 50,1,5);

INSERT INTO BLOG (blog_id, message, author, created_at, member_id) VALUES
	(1, 'İzlenecek filmler listesi', 'Ben', default, 1),
    (2, 'Ölmeden önce yapmam gereken şeyler', 'İrem', default, 2);    
    
INSERT INTO NOTIFICATION (notification_id, message, created_at, member_id) VALUES
	(1, '.....Fotoğrafını beğendi.', default,1),
    (2, '.....Bir video paylaştı.', default,1),
    (3, '.....Durumunuza yotum yaptı.', default,2),
    (4, '.....Fotoğrafınızı beğendi.', default,3);
    
INSERT INTO COMMENTS (comment_id, message, created_at, status_id, friend_member_id, member_id) VALUES
	(1, 'Neyi başarıyorsunuz?', default, 1, 3, null),
    (2, 'Görürsün yakında.', default, 1, null, 1),
    (3, 'İzmir soğuksa biz burda ölelim.', default , 2, 6, null),
    (4, 'Ne zaman yok ki uykun', default, 3, 5, null);

INSERT INTO MESSAGE (send_member_id, to_member_id, message) VALUES
	(1,2,'Bebeğim proje nasıl gidiyor?'),
    (2,1,'İyi gidiyor sanırım.'),
    (1,3,'Yarın benimle yemeğe geliyor musun?'),
    (2,6, 'Nasılsın?'),
    (1,5,'Bu aralar çok uykusuz kaldım.');
    
INSERT INTO DEPENDENTS (dep_id, dep_name, relation, birthday, member_id) VALUES
	(1, 'Serpil Çapuk', 'Anne', '1974-11-28', 1),
    (2, 'Eylül Çapuk', 'Kardeş', '2010-10-26',1),
    (3, 'Sema Altan', 'Abla', default, 5);

INSERT INTO LIKES (friend_member_id, status_id, created_at) VALUES
	(2, 1, default),
    (3, 1, default),
    (4, 1, default),
    (5, 1, default),
    (6, 3, default);
    
INSERT INTO MEMBER_GROUPS (member_id, group_id, date_joined, date_left) VALUES
	(1, 1, '2012-01-13 22:00:00',default),
	(2, 1, '2012-01-13 22:00:00',default),
	(3, 2, default, default), 
	(4, 2, default, default),
	(5, 2, default, default),
	(6, 3, default, default);

INSERT INTO MEMBER_EVENTS (member_id, event_id) VALUES
	(1, 3),
    (2, 3),
    (5, 3), 
    (6, 3),
    (1, 2),
    (1, 1), 
    (4, 1), 
    (3, 3);

INSERT INTO MEMBER_PAGES (member_id, page_id, date_joined, date_left) VALUES
	(1, 2, default, default),
    (1, 3, default, default),
    (2, 2, default, default), 
    (5, 1, default, default);
