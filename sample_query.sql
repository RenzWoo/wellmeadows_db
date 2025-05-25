use wellmeadows;

INSERT INTO Ward VALUES 
(11, 'Orthopaedic', 'Block E', 20, '7711'),
(12, 'Cardiology', 'Block A', 30, '7712');

INSERT INTO Staff VALUES 
('S011', 'Moira', 'Samuel', '49 School Road, Broxburn', '01506-45633', '1961-05-30', 'Female', 'WB123423D', 'Charge Nurse', 18760.00, '1C scale', 37.5, 'P', 'M', 11),
('S098', 'Carol', 'Cummings', '15 High Street, Edinburgh', '0131-334-5677', '1972-03-15', 'Female', 'NC123456B', 'Staff Nurse', 15320.00, '2A', 37.5, 'P', 'M', 11),
('S123', 'Morgan', 'Russell', '23A George Street, Broxburn', '01506-67676', '1980-07-12', 'Male', 'NR789101C', 'Nurse', 14800.00, '1B', 37.5, 'P', 'M', 11),
('S344', 'Laurence', 'Burns', '1 Apple Drive, Edinburgh', '0131-344-9100', '1965-11-02', 'Male', 'LB567890D', 'Consultant', 22000.00, '3C', 37.5, 'P', 'M', 11);

INSERT INTO StaffQualification (staff_number, type, date, institution) VALUES 
('S011', 'BSc Nursing Studies', '1987-07-12', 'Edinburgh Unit'),
('S098', 'Diploma in Nursing', '1995-09-01', 'Glasgow College'),
('S344', 'MBBS', '1990-06-22', 'University of Aberdeen');

INSERT INTO WorkExperience (staff_number, position, organization, start_date, end_date) VALUES 
('S011', 'Staff Nurse', 'Western Hospital', '1990-01-23', '1993-05-01'),
('S344', 'Consultant', 'Royal Infirmary', '1992-08-10', NULL);

INSERT INTO LocalDoctor VALUES 
('CL001', 'Dr. Helen Pearson', '22 Cannongate Way, Edinburgh', '0131-332-0012');

INSERT INTO Patient VALUES 
('P10234', 'Anne', 'Phelps', '44 North Briges, Cannonmills, Edinburgh, EH1 5GH', '0131-332-4111', '1933-12-12', 'Female', 'Single', '1995-02-21', 'CL001');

INSERT INTO NextOfKin (patient_number, full_name, relationship, address, telephone) VALUES 
('P10234', 'James Phelps', 'Father', '145 Rowlands Street, Paisley, PA2 5FE', '0141-848-2211');

INSERT INTO Appointment (patient_number, staff_number, date, time, examination_room, outcome) VALUES 
('P10234', 'S344', '2024-05-20', '10:30:00', 'Room E252', 'Referred to Ward 11');

INSERT INTO InPatient (patient_number, ward_number, bed_number, date_placed, expected_duration, date_expected_leave, actual_leave_date) VALUES 
('P10234', 11, '84', '2024-05-21', 5, '2024-05-26', NULL);

INSERT INTO Drug VALUES 
(10223, 'Morphine', 'Pain killer', '10mg/ml', 'Oral', 200, 50, 27.75),
(10334, 'Tetracycline', 'Antibiotic', '0.5mg/ml', 'IV', 100, 20, 15.50);

INSERT INTO Medication (patient_number, drug_number, units_per_day, start_date, end_date) VALUES 
('P10234', 10223, 50, '2024-05-24', '2024-06-01'),
('P10234', 10334, 10, '2024-05-24', '2024-06-01');

INSERT INTO Supplier VALUES 
(1, 'MedSupplies Ltd.', '88 Main Street, Glasgow', '0141-555-0000', '0141-555-0001');

INSERT INTO Supply VALUES 
(201, 1, 'Syringe', 'Sterile syringe for injections', 1000, 200, 1.25, 'Surgical'),
(202, 1, 'Apron', 'Disposable apron', 500, 100, 0.50, 'Non-surgical');

INSERT INTO Requisition VALUES 
(3001, 'S011', 11, '2024-05-22', '2024-05-23', 'Moira Samuel');

INSERT INTO Requisition_Items VALUES 
(3001, 201, 150),
(3001, 202, 100);