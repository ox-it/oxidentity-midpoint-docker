BEGIN;
	CREATE DATABASE midpoint_staging WITH OWNER midpoint;
	CREATE TABLE hris (
		employeeeId VARCHAR PRIMARY KEY,
		firstName VARCHAR,
		middleName VARCHAR,
		lastName VARCHAR
	);
	CREATE TABLE sits (
		mstCode VARCHAR PRIMARY KEY,
		firstName1 VARCHAR,
		firstName2 VARCHAR,
		firstName3 VARCHAR,
		lastName VARCHAR
	);
COMMIT;
BEGIN;
	INSERT INTO hris (employeeeId, firstName, middleName, lastName) VALUES ('1234567', 'Test', 'IdM', 'User');
	INSERT INTO sits (mstCode, firstName1, firstName2, lastName) VALUES ('1234567', 'Test', 'IdM', 'User');
COMMIT;
