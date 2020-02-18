USE FACEBOOK;

/*Bir kullanıcının tüm arkadaş bilgileri*/

SELECT *
FROM USERS
WHERE USERS.user_id IN   
	(SELECT Friend.friend_user_id
     FROM Friend
     WHERE Friend.user_id IN 
                          (SELECT USERS.user_id
							FROM USERS
							WHERE USERS.fname='İrem' AND USERS.lname='Tunç')); 
                            
/* Bir Kullanicinin bildigi diller*/

SELECT LANGUAGE_.language_
FROM LANGUAGE_
WHERE LANGUAGE_.user_id IN (
							SELECT USERS.user_id
							FROM USERS
							WHERE USERS.fname='Yasin' AND USERS.lname='Kaya');
					
/*İngilizce dilini bilen kullanıcılar*/
                            
SELECT USERS.fname,USERS.minit, USERS.lname
FROM USERS
WHERE USERS.user_id IN ( SELECT LANGUAGE_.user_id
						 FROM LANGUAGE_
                         WHERE language_='İngilizce')
                         
/*Userları alfabetik olarak sıralayan query*/
USE FACEBOOK;
SELECT users.fname, users.minit, users.lname
FROM USERS
ORDER BY fname desc;

/* İlişki durumu single olan userların isim soyisim ve maili */
select users.fname, users.lname, users.e_mail
from 	users 
where   users.user_id in(select profile_.user_id
						from profile_
						where profile_.relationship='Single')


                         
/*Bir kullanıcının Begendigi durumlar*/
                         
SELECT *
FROM Status_
WHERE Status_.status_id IN
							(SELECT status_id
							 FROM LIKES
							 WHERE LIKES.friend_user_id IN
															 (SELECT friend_user_id
															  FROM Friend
															  WHERE Friend.user_id IN (
																						SELECT user_id
																						FROM USERS
																						WHERE USERS.fname='Merve' AND USERS.lname='Bilgili')));
                            