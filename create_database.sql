-- Create instructor table
CREATE TABLE instructor (
    instructor_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(100) NOT NULL,
    personal_number VARCHAR(12) UNIQUE NOT NULL,
    adress VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_number VARCHAR(100) NOT NULL,
    can_teach_ensembles BOOLEAN,
    CONSTRAINT PK_instructor PRIMARY KEY (instructor_id)
);

-- Create instructor_instrument table
CREATE TABLE instructor_instrument (
    instrument VARCHAR(100) NOT NULL,
    instructor_id INT NOT NULL,
    CONSTRAINT PK_instructor_instrument PRIMARY KEY (instrument, instructor_id),
    CONSTRAINT FK_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id) ON DELETE CASCADE
);

-- Create instrument table
CREATE TABLE instrument (
    instrument_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    instrument_serial_number VARCHAR(100) UNIQUE NOT NULL,
    brand VARCHAR(100) NOT NULL,
    monthlyFee INT NOT NULL,
    instrument_type VARCHAR(100) NOT NULL,
    CONSTRAINT PK_instrument PRIMARY KEY (instrument_id)
);

-- Create price_list table
CREATE TABLE price_list (
    price_list_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    lesson_type VARCHAR(20) NOT NULL,
    level VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    is_valid BOOLEAN NOT NULL,
    CONSTRAINT PK_price_list PRIMARY KEY (price_list_id)
);

-- Create student table
CREATE TABLE student (
    student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    name VARCHAR(100) NOT NULL,
    personal_number VARCHAR(12) UNIQUE NOT NULL,
    adress VARCHAR(200) NOT NULL,
    email VARCHAR(200) NOT NULL,
    phone_number VARCHAR(100) NOT NULL,
    maximum_rentals INT CHECK (maximum_rentals BETWEEN 0 AND 2) NOT NULL,
    CONSTRAINT PK_student PRIMARY KEY (student_id)
);

-- Create contact_person table
CREATE TABLE contact_person (
    student_id INT NOT NULL,
    contact_person_id VARCHAR(12) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(200),
    phone_number VARCHAR(100) NOT NULL,
    CONSTRAINT PK_contact_person PRIMARY KEY (student_id),
    CONSTRAINT FK_contact_person FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE
);

-- Create sibling_personal_number table
CREATE TABLE sibling_personal_number (
    sibling_personal_number VARCHAR(12) NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT PK_sibling_personal_number PRIMARY KEY (sibling_personal_number, student_id),
    CONSTRAINT FK_sibling FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE
);

-- Create time_slot table
CREATE TABLE time_slot (
    time_slot_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    date TIMESTAMP NOT NULL,
    available BOOLEAN NOT NULL,
    CONSTRAINT PK_time_slot PRIMARY KEY (time_slot_id)
);

-- Create lesson table
CREATE TABLE lesson (
    lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
    level VARCHAR(100) NOT NULL,
    minimum_number_of_students INT,
    maximum_number_of_students INT,
    genre VARCHAR(100),
    student_id INT NOT NULL,
    instructor_id INT NOT NULL,
    price_list_id INT NOT NULL,
    time_slot_id INT NOT NULL,
    CONSTRAINT PK_lesson PRIMARY KEY (lesson_id),
    CONSTRAINT FK_lesson_student FOREIGN KEY (student_id) REFERENCES student (student_id),
    CONSTRAINT FK_lesson_instructor FOREIGN KEY (instructor_id) REFERENCES instructor (instructor_id),
    CONSTRAINT FK_lesson_price FOREIGN KEY (price_list_id) REFERENCES price_list (price_list_id),
    CONSTRAINT FK_lesson_time FOREIGN KEY (time_slot_id) REFERENCES time_slot (time_slot_id)
);

-- Create lesson_instrument table
CREATE TABLE lesson_instrument (
    instrument VARCHAR(100) NOT NULL,
    lesson_id INT NOT NULL,
    CONSTRAINT PK_lesson_instrument PRIMARY KEY (instrument, lesson_id),
    CONSTRAINT FK_lesson_instrument FOREIGN KEY (lesson_id) REFERENCES lesson (lesson_id) ON DELETE CASCADE
);

-- Create rental table
CREATE TABLE rental (
    instrument_id INT NOT NULL,
    student_id INT NOT NULL,
    rental_time VARCHAR(100) NOT NULL,
    CONSTRAINT PK_rental PRIMARY KEY (instrument_id, student_id),
    CONSTRAINT FK_rental_instrument FOREIGN KEY (instrument_id) REFERENCES instrument (instrument_id) ON DELETE CASCADE,
    CONSTRAINT FK_rental_student FOREIGN KEY (student_id) REFERENCES student (student_id) ON DELETE CASCADE
);
