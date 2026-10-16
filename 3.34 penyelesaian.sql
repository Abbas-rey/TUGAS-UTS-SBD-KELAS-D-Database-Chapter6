CREATE TABLE Author (
    Email_id VARCHAR(100) NOT NULL,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    PRIMARY KEY (Email_id)
);

CREATE TABLE Paper (
    Paper_id VARCHAR(20) NOT NULL,
    Title VARCHAR(200),
    Abstract VARCHAR(1000),
    File_name VARCHAR(255),
    Author_Email_id VARCHAR(100) NOT NULL,
    PRIMARY KEY (Paper_id)
);

CREATE TABLE Review (
    Tech_merit INTEGER,
    Readability INTEGER,
    Originality INTEGER,
    Relevance INTEGER,
    Recommendation VARCHAR(50),
    Comm_Committee VARCHAR(1000),
    Comm_Author VARCHAR(1000),
    Paper_Paper_id VARCHAR(20) NOT NULL,
    Reviewer_Reviewer_ID INTEGER NOT NULL
);

CREATE TABLE Reviewer (
    Email_address VARCHAR(100),
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Phone_number VARCHAR(20),
    Affiliation VARCHAR(100),
    Topics_of_interest VARCHAR(255),
    Reviewer_ID INTEGER NOT NULL,
    PRIMARY KEY (Reviewer_ID)
);

CREATE TABLE Writes (
    Author_Email_id VARCHAR(100) NOT NULL,
    Paper_Paper_id VARCHAR(20) NOT NULL,
    PRIMARY KEY (Author_Email_id, Paper_Paper_id)
);

ALTER TABLE Paper ADD CONSTRAINT Paper_Author_FK FOREIGN KEY (Author_Email_id) REFERENCES Author(Email_id);

ALTER TABLE Review ADD CONSTRAINT Review_Paper_FK FOREIGN KEY (Paper_Paper_id) REFERENCES Paper(Paper_id);

ALTER TABLE Review ADD CONSTRAINT Review_Reviewer_FK FOREIGN KEY (Reviewer_Reviewer_ID) REFERENCES Reviewer(Reviewer_ID);

ALTER TABLE Writes ADD CONSTRAINT Writes_Author_FK FOREIGN KEY (Author_Email_id) REFERENCES Author(Email_id);

ALTER TABLE Writes ADD CONSTRAINT Writes_Paper_FK FOREIGN KEY (Paper_Paper_id) REFERENCES Paper(Paper_id);