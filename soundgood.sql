CREATE TABLE instructor (
 instructor_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(100) NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 adress VARCHAR(100) NOT NULL,
 email VARCHAR(100) NOT NULL,
 phone_number VARCHAR(100) NOT NULL,
 can_teach_ensembles BOOLEAN
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (instructor_id);


CREATE TABLE instructor_instrument (
 instrument VARCHAR(100) NOT NULL,
 instructor_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE instructor_instrument ADD CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument,instructor_id);


CREATE TABLE instrument (
 instrument_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instrument_serial_number VARCHAR(100) UNIQUE NOT NULL,
 brand VARCHAR(100) NOT NULL,
 monthlyFee INT NOT NULL,
 instrument_type VARCHAR(100) NOT NULL
);

ALTER TABLE instrument ADD CONSTRAINT PK_instrument PRIMARY KEY (instrument_id);


CREATE TABLE price_list (
 price_list_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lesson_type VARCHAR(20) NOT NULL,
 level VARCHAR(20) NOT NULL,
 price INT NOT NULL,
 is_valid BOOLEAN NOT NULL
);

ALTER TABLE price_list ADD CONSTRAINT PK_price_list PRIMARY KEY (price_list_id);


CREATE TABLE student (
 student_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(100) NOT NULL,
 personal_number VARCHAR(12) UNIQUE NOT NULL,
 adress VARCHAR(200),
 email VARCHAR(200),
 phone_number VARCHAR(100),
 maximum_rentals INT NOT NULL
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (student_id);


CREATE TABLE time_slot (
 time_slot_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 date TIMESTAMP(10) NOT NULL,
 available BOOLEAN NOT NULL
);

ALTER TABLE time_slot ADD CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id);


CREATE TABLE contact_person (
 student_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 contact_person_id VARCHAR(12) UNIQUE NOT NULL,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(200),
 phone_number VARCHAR(100) NOT NULL
);

ALTER TABLE contact_person ADD CONSTRAINT PK_contact_person PRIMARY KEY (student_id);


CREATE TABLE lesson (
 lesson_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 level VARCHAR(100) NOT NULL,
 minimum_number_of_students INT,
 maximum_number_of_students INT,
 genre VARCHAR(100),
 student_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 instructor_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 price_list_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 time_slot_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (lesson_id);


CREATE TABLE lesson_instrument (
 instrument VARCHAR(100) NOT NULL,
 lesson_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE lesson_instrument ADD CONSTRAINT PK_lesson_instrument PRIMARY KEY (instrument,lesson_id);


CREATE TABLE rental (
 instrument_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 rental_time VARCHAR(100) NOT NULL
);

ALTER TABLE rental ADD CONSTRAINT PK_rental PRIMARY KEY (instrument_id,student_id);


CREATE TABLE sibling_personal_number (
 sibling_personal_number VARCHAR(12) NOT NULL,
 student_id  INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE sibling_personal_number ADD CONSTRAINT PK_sibling_personal_number PRIMARY KEY (sibling_personal_number,student_id);


ALTER TABLE instructor_instrument ADD CONSTRAINT FK_instructor_instrument_0 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);


ALTER TABLE contact_person ADD CONSTRAINT FK_contact_person_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (student_id) REFERENCES student (student_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (price_list_id) REFERENCES price_list (price_list_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_3 FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id);


ALTER TABLE lesson_instrument ADD CONSTRAINT FK_lesson_instrument_0 FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id);


ALTER TABLE rental ADD CONSTRAINT FK_rental_0 FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id);
ALTER TABLE rental ADD CONSTRAINT FK_rental_1 FOREIGN KEY (student_id) REFERENCES student (student_id);


ALTER TABLE sibling_personal_number ADD CONSTRAINT FK_sibling_personal_number_0 FOREIGN KEY (student_id) REFERENCES student (student_id);


