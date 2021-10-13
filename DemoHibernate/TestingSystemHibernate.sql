DROP DATABASE IF EXISTS TestingSystem;
-- Create database
CREATE DATABASE IF NOT EXISTS TestingSystem;
USE TestingSystem;

-- Create table user
DROP TABLE IF EXISTS 	`User`;
CREATE TABLE IF NOT EXISTS `User` ( 	
	id 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`username`	 	CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`username`) >= 6 AND LENGTH(`username`) <= 50),
	`email` 		CHAR(50) NOT NULL UNIQUE CHECK (LENGTH(`email`) >= 6 AND LENGTH(`email`) <= 50),
	`password` 		VARCHAR(800) NOT NULL,
	`firstName` 	NVARCHAR(50) NOT NULL,
	`lastName` 		NVARCHAR(50) NOT NULL,
	`gender` 		ENUM('M','F','U') NOT NULL,
	`date_Of_Birth` DATE NOT NULL,
	`address` 		CHAR(100) NOT NULL,
	`phone` 		CHAR(15) NOT NULL UNIQUE CHECK (LENGTH(`phone`) >= 9 AND LENGTH(`phone`) <= 15),
	`role` 			ENUM('Admin','Employee','Manager') NOT NULL DEFAULT 'Employee',
	`status`		TINYINT DEFAULT 0 -- 0: Not Active, 1: Active, 2: block
);

-- Create table Testing_Category
DROP TABLE IF EXISTS 	`Testing_Category`;
CREATE TABLE IF NOT EXISTS `Testing_Category` (
	`id` 				SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	`name` 				NVARCHAR(50) NOT NULL UNIQUE,
	author_ID			SMALLINT UNSIGNED NOT NULl DEFAULT 1,
	create_time			DATETIME NOT NULL DEFAULT NOW(),
	FOREIGN KEY (author_ID) REFERENCES  `User` (id)
);


USE TestingSystem;
INSERT INTO `User` (`username`,			`email`,						`password`,			`firstName`,	`lastName`,		`gender`,
										`date_Of_Birth` ,  				`address` ,  		`phone` , 		 `role` ,		 `status`	)
-- password: password
VALUE			('hanh.havan@vti',		'hanhhanoi1999@gmail.com',		'abcde',		'Hà',			'Văn Hanh',			'M', '1999-08-07',			'Hải Dương',		'0397685637',	'MANAGER',		0), 
				('thanhhung12@vti',		'hung122112@gmail.com',			'abcde',		'Nguyễn ',		'Thanh Hưng',		'M', '1998-03-28',			'Nam Định',			'0383929264',	'MANAGER',		0);


INSERT INTO `Testing_Category` (`name` ,						`author_ID`, 	create_time)
VALUE							('Java ',						1, 				'2007-02-28 09:29:30'),
								('C# ',							1, 				'2007-02-28 13:29:30'),
								('Tiếng Anh chuyên ngành ',		2, 				'2007-02-28 15:29:30'),
								('SQL ',						2, 				'2007-02-27 07:29:30');

