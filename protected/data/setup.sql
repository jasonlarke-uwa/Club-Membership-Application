USE swedish_membership;

-- Create an admin user
INSERT INTO tbl_user_role(role)
VALUES 	('member');

SET @memberRoleId = LAST_INSERT_ID(); -- store the role id.

INSERT INTO tbl_user_role(role)
VALUES ('admin');

SET @adminRoleId = LAST_INSERT_ID(); 

SET @membershipId = 'admin'; -- username

INSERT INTO tbl_user(username,password)
VALUES	(
		@membershipId,
		'B2236BED4DC535DD8A194CFA8369AB0D0E194C1652A316D90EF014974BE151F9C654233DC4A689D69159401A160D919505DE4420466E89B9DAAD2B9BE60766CC' -- password is admin1209
	);
		
SET @userId = LAST_INSERT_ID(); -- store the admin's user id.

INSERT INTO tbl_user_to_roles(userId,roleId)
VALUES 	(@userId,@memberRoleId),
	(@userId,@adminRoleId);

-- build some membership data
INSERT INTO tbl_membership_status(code,display)
VALUES 	('active','Active'),
	('expired','Expired'),
	('unpaid', 'Waiting payment'),
	('pending','Pending approval');
		
INSERT INTO tbl_payment_method(code,display)
VALUES	('cheque', 'Cheque'),
	('cash', 'Cash'),
	('online', 'Internet'),
	('none', 'Unpaid');
		
-- how to create a new family membership with raw MySQL:
-- the family hierarchy is as follows:
-- John Doe - Father
-- Jane Doe - Mother
-- Sally Doe - Child (daughter)
-- Fred Doe - Child (son, youngest)

INSERT INTO tbl_membership ( membershipId, name, familyName, phoneNumber, alternatePhone, emailAddress, alternateEmail, type, expiryDate, payMethod, status )
VALUES
(
	@membershipId, -- random value I just made up
	'Admin User',
	'Doe',
	'+64 1234 5678',
	'654 444 5123',
	'admin@example.com',
	NULL,
	'S',
	'2013-07-01', -- expires 1st July 2013
	'cash',
	'active'
);

INSERT INTO tbl_member(firstName,dateOfBirth,type,membershipId)
VALUES	('John','1966-01-01','AM',@membershipId),
	('Jane','1969-06-19','AF',@membershipId),
	('Sally','1996-09-27','C',@membershipId),
	('Fred','1998-02-03','C',@membershipId);		
