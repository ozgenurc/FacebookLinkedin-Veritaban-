USE SOCIAL_RESUME_DATABASE;

/* MESSAGE tablosu için*/

UPDATE MESSAGE SET message='Hey!Yarınki toplantıyı hatırlatmak istedim.' WHERE send_member_id=1 AND to_member_id=2;
DELETE FROM MESSAGE WHERE send_member_id=1 AND to_member_id=3;
INSERT INTO MESSAGE (send_member_id, to_member_id, message) VALUES
	(2,3,'Nasılsın');

/*STATUS_ tablosu için */

UPDATE STATUS_ SET message='İyi günler dileriz!' WHERE status_id=2;
DELETE FROM STATUS_ WHERE status_id=3;
INSERT INTO STATUS_ (message, created_at, thumbs_up, thumbs_down, member_id) VALUES
	('At least you tried', '2018-12-15 19:30:00', 6,1,1);
    
/*EVENTS_ tablosu için */

UPDATE EVENTS_ SET event_description='Toplantı okulda yapılacaktır.' WHERE event_id=3;
DELETE FROM EVENTS_ WHERE event_id=2;
INSERT INTO EVENTS_ (event_name, event_description, event_start, event_end, event_address_id, other, create_member_id) VALUES
	('Bisiklet Turu', 'Tüm bisiklet tutkunlarını bekleriz', '2019-01-01', '2019-01-02', 5, null, 1);
