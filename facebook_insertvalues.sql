USE FACEBOOK;

INSERT INTO PRIVACY (privacy_id, privacy_type) VALUES
	(0, 'Only Me'),
    (1, 'Friends'),
    (2, 'Friends of Friends'),
    (3, 'Everyone');
    
INSERT INTO USERS (user_id, password_, fname, minit, lname, e_mail, profile_picture, created_at) VALUES
	(1, '123456', 'Özgenur', null , 'Çapuk', 'ozgenurcapuk@gmail.com', 'www.facebook.com/photos', '2018-12-15 16:35:00'),
    (2, '654321', 'İrem', null, 'Tunç', 'iremtunc@gmail.com', 'www.facebook.com/photos2', '2018-12-15 16:36:00'),
    (3, '456789', 'Yasin', null, 'Kaya', 'yasinkaya@gmail.com', null, '2018-12-15 16:36:00'),
    (4, '987654', 'Salih', 'Mustafa', 'Kaya', 'salihkaya@hotmail.com', null, '2018-12-15 16:38:50'),
    (5, '456789', 'Merve', 'Eda', 'Bilgili', 'merve@hotmail.com', null, '2018-12-16 15:30:25'),
    (6, '789456', 'Özgür', null, 'Çapuk', 'ozgur26@gmail.com', null, '2018-12-16 15:30:20'),
    (7, '789654', 'Ahmet', null, 'Altan', null,null, '2018-12-16 15:40:00'),
    (8, '123456', 'Nur', 'Gizem', 'Çalışkan', 'nurgizem@gmail.com','www.facebook.com/photos3' ,'2018-12-17 15:50:00');
	
INSERT INTO NICKNAME (nickname_id, nickname, user_id, privacy) VALUES
	(1, 'ozgenurc', 1, 1),
    (2, 'iremtnc', 2, 1),
    (3, 'ysnky', 3, 0),
    (4, 'slhky', 4, 3),
    (5, 'mevy', 5,3),
    (6, 'özgr26',6,3),
    (7, 'ahmtaltn',7,2),
    (8, 'nurç',8,0);
    
INSERT INTO PROFILE_ (profile_id, numberOfFriends , phone_number, e_mail, birthday, gender, about_me, relationship, interests, religion, hobbies, fav_movies, fav_artists, fav_books, fav_animals, everything_else, user_id, privacy) VALUES
	(1, 0, '5434605702', 'ozgenurcapuk@gmail.com', '1996-07-04', 'Female', 'Bilgisayar mühendisliği öğrencisi', 'in Relationship', null, null, 'Uyumak', 'Interstellar, Inception', 'Johnny Depp, Jim Carry', 'Harry Potter Series', 'Dogs', null, 1,1),
    (2, 0, '5371234545', 'iremtunc@gmail.com', '1997-02-13', 'Female', null, 'Single', null, 'Muslim', 'Programlama', null, 'Benedict Cumberbatch', 'Uçurtma Avcısı', 'Cat', null, 2,1),
    (3, 0, '5415412323', 'yasinkaya@gmail.com', '1991-08-27', 'Male', 'Elektrik elektronik okuyor', 'in Relationship',null, null, 'Bilgisayar oyunları', 'Game of Thsrones', 'Emilia Clarke', 'Yüzüklerin Efendisi', 'bütün hayvanlar',null, 3,1),
    (4, 0, '5478962312', 'salihkaya@hotmail.com', '1990-09-02', 'Male', 'Yapı Kredi İş Analisti', 'Married',null,null,null,null,null,null,'Cats',null,4,3),
    (5, 0, '5461237889', 'merve@hotmail.com', '1980-01-01', 'Female', null, 'Separated',null,'Inancsız', 'Youtube, Video editlemek', 'Notebook', 'Brad Pitt', null, 'Cats', 'kanalımı takip etmeyi unutmayın', 5,3),
    (6, 0,  null, null, null, 'Male',null, 'Married', null, 'Muslim', 'Yüzmek', 'Marvel filmleri', 'Eminem',null, 'Fish',null, 6,1),
    (7, 0,  null, 'ahmetaltan@hotmail.com', null, null, 'Tiyatro her şey.', 'Single', null, null, null,null,null,null,null,null, 7, 2),
    (8, 0, null,null, '1992-07-15', 'Female', null, null, null, null, 'Kitap yazmak, şarkı söylemek, resim yapmak', 'Doctor Who, Memento', 'Queen, Sting', 'Kişisel gelişim', 'Tüm hayvanları severim:)', null,8,3);

INSERT INTO FRIEND (user_id, friend_user_id, privacy, is_subscriber, created_at) VALUES
	(1, 2, 1, 1, default),
    (1, 3, 1, 1, default),
    (1, 4, 1, 1, default),
    (1, 5, 1, 1, default),
    (5, 7, 1, 1, default),
    (5, 8, 1, 1, default),
    (2, 3, 1, 1, default),
    (2, 4, 1, 1, default),
    (2, 8, 1, 1, default),
    (3, 6, 1, 1, default),
    (4, 7, 1, 1, default);
    
INSERT INTO BCATEGORY (bookmark_category_id, bname) VALUES
	(1, 'Page'),
    (2, 'Group'),
    (3, 'Event'),
    (4, 'Application');
    
INSERT INTO BOOKMARK (bookmark_id, url, clicks, rating, privacy, favorite, bookmark_category_id, user_id) VALUES
	(1, 'www.faceboook.com/mezunsayfasi', 1000, 5, default, default, 1, 1),
    (2, 'www.facebook.com/mezunlargrubu', 500,4, default, default, 2, 1),
    (3, 'www.facebook.com/mezunlartoplantısı',250, 4, 2, default, 3, 1),
    (4, 'www.facebook.com/games/candycrush',10000, 5, 3, default, 4, 3);

INSERT INTO STATUS_ (status_id, message, created_at, thumbs_up, thumbs_down, privacy, user_id) VALUES
	(1, 'We can do it!', '2018-12-15 19:30:00', 2,1,2,1),
    (2, 'Havalar çok soğuk', '2018-12-15 19:30:00', 2, 2, 3, 2),
    (3, 'Çok uykum var', '2018-12-16 02:00:00', 50,1,3,5);
    
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
    
INSERT INTO ADDRESS (address_id, address, profile_id, city_id) VALUES
	(1, 'Ergene mah. 544 sok.' , 1, 1),
    (2, 'Atatürk mah. 120 sok.', 1, 2),
    (3, 'Champ de Mars, 5 Avenue Anatole', 3, 4),
    (4, '17 Place du Trocadéro et du 11 Novembre', 2, 4),
    (5, '221b Baker St, Marylebone', 8, 6),
    (6, 'İnönü mah. 152 sokak', 7, 1),
    (7, 'yasemin mah, 70 sokak', null, 2);
    
INSERT INTO ACTIVITIES (act_id, act_name, act_exp, act_type, event_date, event_time, event_address_id, privacy, join_user_id, create_user_id) VALUES
	(1, 'Ege Üniversitesi 2014 Girişliler', 'Ders notları ve iletişim için grubumuzu kullanabilirsiniz.', 'Group', null, null, null, 3, 2, 1),
    (2, '2.El Eşya Alım Satım', null, 'Group', null, null, null, 3, 1, null),
    (3, 'Dr. Who Fan Page', 'Whovianlar buraya', 'Page', null, null, null, 3, 2, 1),
    (5, 'Programlama Sevenler', 'Programlama hakkında her şey', 'Page', null, null, null, 3, 5, 2),
	(4, 'Orhan Oğuz And Lisesi Mezunlar Yemeği', '2014 mezunlarını bekleriz.', 'Event', '2019-01-15', '20:00:00', 7, 1, 1, null);
    
INSERT INTO BLOG (blog_id, message, author, created_at, user_id) VALUES
	(1, 'İzlenecek filmler listesi', 'Ben', default, 1),
    (2, 'Ölmeden önce yapmam gereken şeyler', 'İrem', default, 2);
    
INSERT INTO LANGUAGE_ (language_,  user_id) VALUES
	( 'Türkçe', 1),
    ( 'İngilizce', 2), 
    ( 'Fransızca', 8),
    ( 'İngilizce', 3);

INSERT INTO NOTIFICATION (notification_id, message, created_at, user_id) VALUES
	(1, '.....Fotoğrafını beğendi.', default,1),
    (2, '.....Bir video paylaştı.', default,1),
    (3, '.....Durumunuza yotum yaptı.', default,2),
    (4, '.....Fotoğrafınızı beğendi.', default,3);

INSERT INTO COMMENTS (comment_id, message, created_at, status_id, friend_user_id, user_id) VALUES
	(1, 'Neyi başarıyorsunuz?', default, 1, 3, null),
    (2, 'Görürsün yakında.', default, 1, null, 1),
    (3, 'İzmir soğuksa biz burda ölelim.', default , 2, 8, null),
    (4, 'Ne zaman yok ki uykun', default, 3, 5, null);

INSERT INTO MESSAGE (send_user_id, to_user_id, message) VALUES
	(1,2,'Bebeğim proje nasıl gidiyor?'),
    (2,1,'İyi gidiyor sanırım.'),
    (1,3,'Yarın benimle yemeğe geliyor musun?'),
    (2,8, 'Nasılsın?'),
    (1,5,'Bu aralar çok uykusuz kaldım.');

INSERT INTO DEPENDENTS (dep_id, dep_name, relation, birthday, profile_id) VALUES
	(1, 'Serpil Çapuk', 'Anne', '1974-11-28', 1),
    (2, 'Eylül Çapuk', 'Kardeş', '2010-10-26',1),
    (3, 'Sema Altan', 'Abla', default, 7);
    
INSERT INTO JOBS (job_id, job_name, position_, entry_date, relase_date, profile_id) VALUES
	(1, 'Yapı Kredi', 'İş Analisti', '2014', default, 4),
    (2, 'Garanti Bankası', 'Stajer', '2013', '2013',4),
    (3, 'Can Yayınları', 'Yazar', '2016', default, 8), 
    (4, 'Yapı Kredi', 'Genel Müdür', '2018', default, 5), 
    (5, 'Riot Games', 'Software Engineer', '2018', default, 3);
            
INSERT INTO SCHOOL (school_id, school_type, school_name, entry_date, graduate, profile_id) VALUES
	(1, 'Lise', 'Prof. Dr. Orhan Oğuz And. Lisesi', '2010', '2014', 1),
    (2, 'Üniversite', 'Ege Üniversitesi', '2014', default, 1),
    (3, 'Üniversite', ' Orta Doğu Teknik Üniversitesi', '2010', '2014', 3),
    (4, 'Üniversite', 'Ege Üniversitesi', '2010', '2014', 4);
    
INSERT INTO LIKES (friend_user_id, status_id, created_at) VALUES
	(2, 1, default),
    (3, 1, default),
    (4, 1, default),
    (5, 1, default),
    (6, 3, default),
    (7, 3, default);
 

    

    
    
    

    
    
    
    
 
 

    
    
    

    
    
    
    
    