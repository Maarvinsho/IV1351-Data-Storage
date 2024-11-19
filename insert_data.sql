-- Insert into instructor table
INSERT INTO instructor (name, personal_number, adress, email, phone_number, can_teach_ensembles)
VALUES
('Erik Andersson', '198705221234', 'Kungsgatan 12, Stockholm', 'erik.andersson@example.com', '+46701234567', TRUE),
('Sara Svensson', '199012155678', 'Storgatan 45, Göteborg', 'sara.svensson@example.com', '+46705555555', FALSE);

-- Insert into instrument table
INSERT INTO instrument (instrument_serial_number, brand, monthlyFee, instrument_type)
VALUES
('A456', 'Yamaha', 200, 'Guitar'),
('B789', 'Steinway', 300, 'Piano'),
('C012', 'Stradivarius', 500, 'Violin');

-- Insert into instructor_instrument table
INSERT INTO instructor_instrument (instrument, instructor_id)
VALUES
('Guitar', 1), -- Erik Andersson plays Guitar
('Piano', 1),  -- Erik Andersson plays Piano
('Violin', 2); -- Sara Svensson plays Violin

-- Insert into student table
INSERT INTO student (name, personal_number, adress, email, phone_number, maximum_rentals)
VALUES
('Anna Karlsson', '200305157890', 'Vasagatan 18, Malmö', 'anna.karlsson@example.com', '+46701112222', 2),
('Johan Nilsson', '199806101234', 'Drottninggatan 25, Uppsala', 'johan.nilsson@example.com', '+46702223333', 1);

-- Insert into contact_person table
INSERT INTO contact_person (student_id, contact_person_id, name, email, phone_number)
VALUES
(1, '197612055678', 'Maria Karlsson', 'maria.karlsson@example.com', '+46703334444'),
(2, '198010103456', 'Peter Nilsson', 'peter.nilsson@example.com', '+46704445555');

-- Insert into sibling_personal_number table
INSERT INTO sibling_personal_number (sibling_personal_number, student_id)
VALUES
('199305252345', 1), -- Sibling of Anna Karlsson
('199901014567', 2); -- Sibling of Johan Nilsson

-- Insert into time_slot table
INSERT INTO time_slot (date, available)
VALUES
('2024-11-20 10:00:00', TRUE),
('2024-11-20 11:00:00', FALSE),
('2024-11-21 14:00:00', TRUE);

-- Insert into price_list table (current and historical prices)
INSERT INTO price_list (lesson_type, level, price, valid_from, valid_to)
VALUES
-- Current prices
('Individual', 'Beginner', 200, '2024-01-01', NULL), 
('Group', 'Intermediate', 150, '2024-01-01', NULL),
('Ensemble', 'Advanced', 300, '2024-01-01', NULL),
-- Historical prices
('Individual', 'Beginner', 180, '2023-01-01', '2023-12-31'), 
('Group', 'Intermediate', 140, '2023-01-01', '2023-12-31');

-- Insert into lesson table
INSERT INTO lesson (level, minimum_number_of_students, maximum_number_of_students, genre, student_id, instructor_id, price_list_id, time_slot_id)
VALUES
('Intermediate', 2, 5, 'Classical', 1, 1, 2, 1), -- Anna Karlsson takes Group lesson
('Beginner', 1, 3, 'Pop', 2, 2, 1, 3);          -- Johan Nilsson takes Individual lesson

-- Insert into lesson_instrument table
INSERT INTO lesson_instrument (instrument, lesson_id)
VALUES
('Guitar', 1), -- Guitar used in the first lesson
('Piano', 2);  -- Piano used in the second lesson

-- Insert into rental table
INSERT INTO rental (instrument_id, student_id, rental_time)
VALUES
(1, 1, '2024-11-01 10:00:00'), -- Anna Karlsson rents Guitar
(2, 2, '2024-11-02 11:00:00'); -- Johan Nilsson rents Piano
