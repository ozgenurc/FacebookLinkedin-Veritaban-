USE SOCIAL_RESUME_DATABASE;

/*İZMİRDE YASAYANLARIN ALFABETIK SIRALAMAYA GÖRE LİSTESİ*/

SELECT DISTINCT MEMBERS.member_id,MEMBERS.fname, MEMBERS.lname
FROM ADDRESS,PROFILE_,MEMBERS,CITY
WHERE ADDRESS.city_id = '1' AND ADDRESS.Profile_id = PROFILE_.Profile_id AND PROFILE_.Member_id=MEMBERS.Member_id
ORDER BY fname,lname

/*member_id si 1 olanların arkadaşlarını ad soyad olarak listeleme (sıralı)*/

SELECT MEMBERS.fname,MEMBERS.minit,MEMBERS.lname
FROM MEMBERS
WHERE MEMBERS.member_id IN (SELECT FRIEND.Friend_member_id
					       FROM MEMBERS,FRIEND
						   WHERE MEMBERS.Member_id=1 AND MEMBERS.Member_id=FRIEND.Member_id)
ORDER BY fname,minit,lname

/*mail uzantısı @gmail olanların isimleri*/

SELECT fname,minit,lname
FROM MEMBERS
WHERE MEMBERS.e_mail LIKE '%gmail.com%'
ORDER BY lname DESC

