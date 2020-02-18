CREATE SCHEMA FACEBOOK;
USE FACEBOOK;

CREATE TABLE IF NOT EXISTS PRIVACY (
	privacy_id TINYINT(3) NOT NULL DEFAULT '0',
    privacy_type VARCHAR(45),
    PRIMARY KEY(privacy_id)
);
    
CREATE TABLE IF NOT EXISTS USERS (
	user_id MEDIUMINT(8) NOT NULL DEFAULT '0',
    password_ VARCHAR(45) DEFAULT NULL,
    fname VARCHAR(45) DEFAULT NULL,
    minit VARCHAR(45) DEFAULT NULL,
    lname VARCHAR(45) DEFAULT NULL,
	e_mail VARCHAR(100) DEFAULT NULL,
    profile_picture VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id)
);
    
CREATE TABLE IF NOT EXISTS NICKNAME (
	nickname_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    nickname VARCHAR(45) DEFAULT NULL,
    user_id MEDIUMINT(8) NOT NULL,
    privacy TINYINT(3) DEFAULT NULL,
    PRIMARY KEY(nickname_id, user_id),
    FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (privacy) REFERENCES PRIVACY(privacy_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS FRIEND (
	user_id MEDIUMINT(8) NOT NULL,
    friend_user_id MEDIUMINT(8) NOT NULL,
    is_subscriber BOOLEAN DEFAULT '0',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    privacy TINYINT(3) DEFAULT NULL,
    PRIMARY KEY(user_id, friend_user_id),
    FOREIGN KEY (friend_user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //
CREATE TRIGGER selfrequest BEFORE INSERT ON FRIEND
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.friend_user_id 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot be friend yourself';
          END IF;
     END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER selfrequest2 BEFORE UPDATE ON FRIEND
 FOR EACH ROW BEGIN
          IF NEW.user_id=New.friend_user_id 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot be friend yourself';
          END IF;
     END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER arkadasmi BEFORE INSERT ON FRIEND
 FOR EACH ROW BEGIN
          IF EXISTS(SELECT friend_user_id 
					FROM FRIEND
                    WHERE user_id=new.friend_user_id AND friend_user_id=new.user_id)
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You are already friends';
          END IF;
     END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER arkadasmi2 BEFORE UPDATE ON FRIEND
 FOR EACH ROW BEGIN
          IF EXISTS(SELECT friend_user_id 
					FROM FRIEND
                    WHERE user_id=new.friend_user_id AND friend_user_id=new.user_id)
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'You are already friends';
          END IF;
     END
//
DELIMITER ;


DELIMITER //
CREATE TRIGGER FRIEND_NUMBER_INCREMENT BEFORE INSERT ON Friend
 FOR EACH ROW BEGIN
	UPDATE Profile_ SET Profile_.numberOfFriends = Profile_.numberOfFriends +1 
	WHERE Profile_.user_id =(select NEW.friend_user_id );
	UPDATE Profile_ SET Profile_.numberOfFriends = numberOfFriends +1  WHERE Profile_.user_id =NEW.user_id;
 END

//
DELIMITER ;
DELIMITER //
CREATE TRIGGER FRIEND_NUMBER_DECREMENT BEFORE DELETE ON Friend
 FOR EACH ROW BEGIN
	UPDATE Profile_ SET Profile_.numberOfFriends = Profile_.numberOfFriends -1 
    WHERE Profile_.user_id =(select OLD.friend_user_id );
	UPDATE Profile_ SET Profile_.numberOfFriends = numberOfFriends -1  WHERE Profile_.user_id =OLD.user_id;
     END
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS PROFILE_(
	profile_id MEDIUMINT(8) NOT NULL,
    numberOfFriends tinyint(3) NOT NULL DEFAULT '0',
    phone_number VARCHAR(45) DEFAULT NULL,
    e_mail VARCHAR(100)DEFAULT NULL,
	birthday DATE DEFAULT NULL,    
	gender ENUM('Male','Female') DEFAULT NULL,
    about_me VARCHAR(255) DEFAULT NULL,
    relationship ENUM('Single','in Relationship','Married','Separated') DEFAULT NULL,
    interests VARCHAR(255) DEFAULT NULL,
    religion VARCHAR(255) DEFAULT NULL,
    hobbies VARCHAR(255) DEFAULT NULL,
    fav_movies VARCHAR(255) DEFAULT NULL,
    fav_artists VARCHAR(255) DEFAULT NULL,
    fav_books VARCHAR(255) DEFAULT NULL,
    fav_animals VARCHAR(255) DEFAULT NULL,
    everything_else VARCHAR(255) DEFAULT NULL,
    user_id MEDIUMINT(8) NOT NULL UNIQUE,
    privacy TINYINT(3) DEFAULT NULL,
    PRIMARY KEY(profile_id, user_id),
    FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (privacy) REFERENCES PRIVACY(privacy_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS BOOKMARK (
	bookmark_id BIGINT(20) NOT NULL AUTO_INCREMENT,
    url VARCHAR(255) DEFAULT NULL,
    clicks SMALLINT(5) NOT NULL,
    rating SMALLINT(5) DEFAULT NULL,
    favorite BOOLEAN DEFAULT '1',
    privacy TINYINT(3) DEFAULT '3',
    bookmark_category_id SMALLINT(5) DEFAULT NULL,
    user_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY (bookmark_id),
    KEY bookmark_ibfk_3 (bookmark_category_id),
	FOREIGN KEY (privacy) REFERENCES PRIVACY (privacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS FCATEGORY (
	feed_category_id SMALLINT(5) NOT NULL AUTO_INCREMENT,
    fname VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY(feed_category_id)
);

CREATE TABLE IF NOT EXISTS FEED (
	feed_id BIGINT(20) NOT NULL AUTO_INCREMENT,
    url VARCHAR(255) DEFAULT NULL,
    clicks SMALLINT(5) NOT NULL,
    rating SMALLINT(5) DEFAULT NULL,
    favorite BOOLEAN DEFAULT '1',
    privacy TINYINT(3) DEFAULT '3',
    feed_category_id SMALLINT(5) DEFAULT NULL,
    user_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY (feed_id),
	FOREIGN KEY (privacy) REFERENCES PRIVACY (privacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (feed_category_id) REFERENCES FCATEGORY (feed_category_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS STATUS_ (
	status_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    message VARCHAR(255) DEFAULT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    thumbs_up TINYINT(3) DEFAULT NULL,
    thumbs_down TINYINT(3) DEFAULT NULL,
    privacy TINYINT(3) DEFAULT NULL,
    user_id MEDIUMINT(8) DEFAULT NULL,
    PRIMARY KEY (status_id),
	FOREIGN KEY (privacy) REFERENCES PRIVACY(privacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ACTIVITIES (
	act_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    act_name VARCHAR(45) DEFAULT NULL,
    act_exp VARCHAR(255) DEFAULT NULL,
    act_type ENUM('Group','Page','Event') NOT NULL, 
    event_date DATE DEFAULT NULL,
    event_time TIME DEFAULT NULL,
    event_address_id MEDIUMINT(8) DEFAULT NULL,
    privacy TINYINT(3) DEFAULT NULL,
	join_user_id MEDIUMINT(8) DEFAULT NULL,
    create_user_id MEDIUMINT(8) DEFAULT NULL,
    PRIMARY KEY (act_id),
    KEY activities_ibfk_4 (event_address_id),
	FOREIGN KEY (privacy) REFERENCES PRIVACY(privacy_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (create_user_id) REFERENCES USERS(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (join_user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE IF NOT EXISTS BCATEGORY (
	bookmark_category_id SMALLINT(5) NOT NULL AUTO_INCREMENT,
    bname VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY(bookmark_category_id)
);

CREATE TABLE IF NOT EXISTS BLOG (
	blog_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    message VARCHAR(255) DEFAULT NULL,
    author VARCHAR(45) DEFAULT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	user_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY(blog_id, user_id),
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS LANGUAGE_ (
    language_ VARCHAR(45),
    user_id	MEDIUMINT(8),
    PRIMARY KEY(language_, user_id),
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE IF NOT EXISTS NOTIFICATION (
	notification_id MEDIUMINT (8) NOT NULL AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY(notification_id),
	FOREIGN KEY (user_id) REFERENCES USERS (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS MESSAGE(
	send_user_id MEDIUMINT(8) NOT NULL,
    to_user_id 	MEDIUMINT(8) NOT NULL,
    message VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (send_user_id, to_user_id),
    FOREIGN KEY (send_user_id) REFERENCES USERS(user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (to_user_id) REFERENCES USERS(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //
CREATE TRIGGER before_selfmessage BEFORE INSERT ON Message
 FOR EACH ROW BEGIN
          IF NEW.send_user_id=New.to_user_id 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send message to yourself';
          END IF;
     END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER update_selfmessage BEFORE UPDATE ON Message
 FOR EACH ROW BEGIN
          IF NEW.send_user_id=New.to_user_id 
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot send message to yourself';
          END IF;
     END
//
DELIMITER ;


CREATE TABLE IF NOT EXISTS COMMENTS (
	comment_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	status_id MEDIUMINT(8) DEFAULT NULL,
    friend_user_id MEDIUMINT(8) DEFAULT NULL,
    user_id MEDIUMINT(8) DEFAULT NULL,
    PRIMARY KEY (comment_id),
    FOREIGN KEY (status_id) REFERENCES STATUS_(status_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (friend_user_id) REFERENCES FRIEND (friend_user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (user_id) REFERENCES USERS(user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS DEPENDENTS (
	dep_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    dep_name VARCHAR(45) DEFAULT NULL,
    relation VARCHAR(45) DEFAULT NULL,
    birthday DATE DEFAULT NULL,
    profile_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY (dep_id),
    FOREIGN KEY (profile_id) REFERENCES PROFILE_(profile_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS JOBS(
	job_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
	job_name VARCHAR(45) DEFAULT NULL,
    position_ VARCHAR(45) DEFAULT NULL,
    entry_date YEAR DEFAULT NULL,
    relase_date YEAR DEFAULT NULL,
    profile_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY(job_id),
    FOREIGN KEY(profile_id) REFERENCES PROFILE_(profile_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //
CREATE TRIGGER jobdatecontrol BEFORE INSERT ON JOBS
 FOR EACH ROW BEGIN
          IF New.entry_date>New.relase_date
			THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not entry date bigger than relase date';
          END IF;
     END
//
DELIMITER ;
DELIMITER //
CREATE TRIGGER jobdatecontrol2 BEFORE UPDATE ON JOBS
 FOR EACH ROW BEGIN
          IF New.entry_date>New.relase_date
			THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not entry date bigger than relase date';
          END IF;
     END
//
DELIMITER ;

CREATE TABLE IF NOT EXISTS SCHOOL(
	school_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    school_type ENUM('Lise','Üniversite') NOT NULL, 
    school_name VARCHAR(100) DEFAULT NULL,
    entry_date YEAR DEFAULT NULL,
    graduate YEAR DEFAULT NULL,
    profile_id MEDIUMINT(8) NOT NULL,
    PRIMARY KEY(school_id),
    FOREIGN KEY(profile_id) REFERENCES PROFILE_(profile_id) ON DELETE CASCADE ON UPDATE CASCADE
);

DELIMITER //
CREATE TRIGGER schooldatecontrol BEFORE INSERT ON SCHOOL
 FOR EACH ROW BEGIN
          IF New.entry_date>New.graduate
			THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not entry date bigger than graduate date';
          END IF;
     END
//
DELIMITER ;

DELIMITER //
CREATE TRIGGER schooldatecontrol2 BEFORE UPDATE ON SCHOOL
 FOR EACH ROW BEGIN
          IF New.entry_date>New.graduate
			THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not entry date bigger than graduate date';
          END IF;
     END
//
DELIMITER ;
    
CREATE TABLE IF NOT EXISTS ADDRESS(
	address_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) DEFAULT NULL,
    profile_id MEDIUMINT(8) DEFAULT NULL,
    city_id MEDIUMINT(8) DEFAULT NULL,
    PRIMARY KEY(address_id),
    KEY address_ibfk_2 (city_id),
	FOREIGN KEY(profile_id) REFERENCES PROFILE_(profile_id) ON DELETE CASCADE ON UPDATE CASCADE
);
    
CREATE TABLE IF NOT EXISTS CITY(
	city_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
	city_name VARCHAR(45) DEFAULT NULL,
    country_id MEDIUMINT(8) NOT NULL,
	PRIMARY KEY(city_id),
    KEY city_ibfk_1 (country_id)
);

CREATE TABLE IF NOT EXISTS COUNTRY(
	country_id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(45) DEFAULT NULL,
    PRIMARY KEY(country_id)
);
    
CREATE TABLE IF NOT EXISTS LIKES(
	friend_user_id MEDIUMINT(8) NOT NULL,
    status_id MEDIUMINT(8) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY( friend_user_id,status_id),
    FOREIGN KEY(friend_user_id) REFERENCES FRIEND(friend_user_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(status_id) REFERENCES STATUS_(status_id) ON DELETE CASCADE ON UPDATE CASCADE
);


ALTER TABLE BOOKMARK
	ADD CONSTRAINT bookmark_ibfk_3 FOREIGN KEY (bookmark_category_id) REFERENCES BCATEGORY (bookmark_category_id) ON DELETE CASCADE ON UPDATE CASCADE;
    
 ALTER TABLE ADDRESS
	ADD CONSTRAINT address_ibfk_2 FOREIGN KEY (city_id) REFERENCES CITY (city_id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE CITY
	ADD CONSTRAINT city_ibfk_1 FOREIGN KEY (country_id) REFERENCES COUNTRY (country_id) ON DELETE CASCADE ON UPDATE CASCADE;
    
ALTER TABLE ACTIVITIES
	ADD CONSTRAINT activities_ibfk_4 FOREIGN KEY (event_address_id) REFERENCES ADDRESS (address_id) ON DELETE CASCADE ON UPDATE CASCADE;
    


