USE FACEBOOK;

/*BLOG tablosu için*/

UPDATE BLOG SET message='Tavsiye edilen diziler' WHERE blog_id=1;
DELETE FROM BLOG where blog_id=2;
INSERT INTO BLOG (message, author, created_at, user_id) VALUES
	('İzlenecek filmler listesi', 'Ben', default, 2);


/*STATUS tablosu için*/

UPDATE STATUS_ SET message='Dışarıda güzel bir hava var' WHERE status_id=3;
DELETE FROM STATUS_ WHERE status_id=1;
INSERT INTO STATUS_ (message, created_at, thumbs_up, thumbs_down, privacy, user_id) VALUES
	('Başarabilirsin', '2018-12-15 19:30:00', 7,1,2,1);

/*DEPENDENTS tablosu için*/

UPDATE DEPENDENTS SET dep_name='Neriman Capuk' WHERE dep_id=1;
DELETE FROM DEPENDENTS WHERE dep_id=3;
INSERT INTO DEPENDENTS (dep_name, relation, birthday, profile_id) VALUES
	('Ayhan Çapuk', 'kuzen', '1974-11-28', 1);