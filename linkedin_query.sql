USE LINKEDIN;

/* izmir'de yaşayanların tüm bilgileri*/
SELECT *
FROM ADDRESS
WHERE address.city='izmir'

/*single olanlar*/
SELECT *
FROM MARITAL_STATUS
WHERE marital_status='Single'

/* title'ı course olanın textini yazdır */
SELECT text_
FROM PROFILE_SECTION
WHERE title='Course'

/*2YE BAĞLANANLAR*/

SELECT DISTINCT *
FROM CONNECTS
WHERE connected_member_id=2

/*2yle bağlantı kuranların dogum günleri*/

SELECT DISTINCT birthday
FROM CONNECTS,MEMBERS
WHERE current_organization_id=2

/*ADI AYLA BASLAYANLARIN ORGANİZATION İDLERİ*/
SELECT DISTINCT current_organization_id
FROM ORGANIZATIONS,MEMBERS
WHERE fname LIKE 'A%'

/*şartı sağlayanların isimleri*/
SELECT fname,minit,lname
FROM MEMBERS
WHERE current_organization_id=1 AND marital_status_id=3

/*İlişki durumu married olanlar*/

FROM MEMBERS
WHERE MEMBERS.member_id IN (
							SELECT MARITAL_STATUS.marital_status_id
							FROM MARITAL_STATUS
							WHERE MARITAL_STATUS.marital_status='Married');






