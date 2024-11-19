-- Insert data into instructor table
INSERT INTO instructor (name, personal_number, adress, email, phone_number, can_teach_ensembles)
VALUES
('John Doe', '197507042295', '123 Music St.', 'john.doe@example.com', '0738853647', TRUE),
('Jane Smith', '199504118732', '456 Harmony Ave.', 'jane.smith@example.com', '0738476512', FALSE);

-- Insert data into instrument table
INSERT INTO instrument (instrument_serial_number, brand, monthlyFee, instrument_type)
VALUES
('A123', 'Yamaha', 50, 'Guitar'),
('B234', 'Steinway', 75, 'Piano'),
('C345', 'Stradivarius', 100, 'Violin');

-- Insert data into instructor_instrument table
INSERT INTO instructor_instrument (instrument, instructor_id)
VALUES
('Guitar', 1), -- instructor_id = 1
('Piano', 1),
('Violin', 2); -- instructor_id = 2

-- Insert data into student table
INSERT INTO student (name, personal_number, adress, email, phone_number, maximum_rentals)
VALUES
('Alice Johnson', '200506119873', '789 Melody Ln.', 'alice.j@example.com', '0737438829', 2),
('Bob Brown', '200305012285', '101 Song Rd.', 'bob.b@example.com', '0705347728', 1);

-- Insert data into contact_person table
INSERT INTO contact_person (student_id, contact_person_id, name, email, phone_number)
VALUES
(1, '567890123456', 'Margaret Johnson', 'margaret.j@example.com', '555-1235'),
(2, '678901234567', 'Tom Brown', 'tom.b@example.com', '555-6780');

-- Insert data into sibling_personal_number table
INSERT INTO sibling_personal_number (sibling_personal_number, student_id)
VALUES
('200106081994', 1),
('200006082746', 2);

-- Insert data into time_slot table
INSERT INTO time_slot (date, available)
VALUES
('2024-11-20 10:00:00', TRUE),
('2024-11-20 11:00:00', FALSE),
('2024-11-21 14:00:00', TRUE);

-- Insert data into price_list table
INSERT INTO price_list (lesson_type, level, price, is_valid)
VALUES
('Individual', 'Beginner', 20, TRUE),
('Group', 'Intermediate', 15, TRUE),
('Ensemble', 'Advanced', 30, TRUE);

-- Insert data into lesson table
INSERT INTO lesson (level, minimum_number_of_students, maximum_number_of_students, genre, student_id, instructor_id, price_list_id, time_slot_id)
VALUES
('Intermediate', 1, 3, 'Classical', 1, 1, 1, 1), -- Assuming IDs match
('Beginner', 1, 1, 'Pop', 2, 2, 2, 2);

-- Insert data into lesson_instrument table
INSERT INTO lesson_instrument (instrument, lesson_id)
VALUES
('Guitar', 1), -- lesson_id = 1
('Violin', 2); --  lesson_id = 2

-- Insert data into rental table
INSERT INTO rental (instrument_id, student_id, rental_time)
VALUES
(1, 1, '2024-11-01 10:00:00'), --  instrument_id = 1, student_id = 1
(2, 2, '2024-11-01 11:00:00');
