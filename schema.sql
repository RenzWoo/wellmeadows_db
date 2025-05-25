CREATE DATABASE IF NOT EXISTS wellmeadows;

USE wellmeadows;

-- 1. Ward
CREATE TABLE IF NOT EXISTS Ward (
    ward_number INT PRIMARY KEY,
    ward_name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    total_number_of_beds INT NOT NULL,
    telephone_extension VARCHAR(15)
);

-- 2. Staff
CREATE TABLE IF NOT EXISTS Staff (
    staff_number VARCHAR(10) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address TEXT,
    telephone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    sex VARCHAR(10),
    NIN VARCHAR(20),
    position VARCHAR(50),
    current_salary DECIMAL(10, 2),
    salary_scale VARCHAR(50),
    hours_per_week DECIMAL(5, 1),
    contract_type VARCHAR(1),
    payment_type VARCHAR(1),
    ward_number INT NOT NULL,
    FOREIGN KEY (ward_number) REFERENCES Ward(ward_number)
);

-- 3. StaffQualification
CREATE TABLE IF NOT EXISTS StaffQualification (
    qualification_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_number VARCHAR(10),
    type VARCHAR(100) NOT NULL,
    date DATE,
    institution VARCHAR(100) NOT NULL,
    FOREIGN KEY (staff_number) REFERENCES Staff(staff_number)
);

-- 4. WorkExperience
CREATE TABLE IF NOT EXISTS WorkExperience (
    experience_id INT AUTO_INCREMENT PRIMARY KEY,
    staff_number VARCHAR(10) NOT NULL,
    position VARCHAR(100) NOT NULL,
    organization VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    FOREIGN KEY (staff_number) REFERENCES Staff(staff_number) ON DELETE CASCADE
);

-- 5. LocalDoctor
CREATE TABLE IF NOT EXISTS LocalDoctor (
    clinic_number VARCHAR(10) PRIMARY KEY,
    full_name VARCHAR(100),
    address TEXT,
    telephone VARCHAR(15)
);

-- 6. Patient
CREATE TABLE IF NOT EXISTS Patient (
    patient_number VARCHAR(10) PRIMARY KEY,  
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    address TEXT,
    telephone VARCHAR(15),
    date_of_birth DATE NOT NULL,
    sex VARCHAR(10),
    marital_status VARCHAR(10),
    date_registered DATE NOT NULL,
    clinic_number VARCHAR(10),
    FOREIGN KEY (clinic_number) REFERENCES LocalDoctor(clinic_number)
);

-- 7. NextOfKin
CREATE TABLE IF NOT EXISTS NextOfKin (
    kin_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(10),
    full_name VARCHAR(100),
    relationship VARCHAR(50),
    address TEXT,
    telephone VARCHAR(15),
    FOREIGN KEY (patient_number) REFERENCES Patient(patient_number)
);


-- 8. Appointment
CREATE TABLE IF NOT EXISTS Appointment (
    appointment_number INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(10),
    staff_number VARCHAR(10),
    date DATE,
    time TIME,
    examination_room VARCHAR(50),
    outcome VARCHAR(50),
    FOREIGN KEY (staff_number) REFERENCES Staff(staff_number)
);

-- 9. InPatient
CREATE TABLE IF NOT EXISTS InPatient (
    inpatient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(10),
    ward_number INT NOT NULL,
    bed_number VARCHAR(10),
    date_placed DATE,
    expected_duration INT,
    date_expected_leave DATE,
    actual_leave_date DATE,
    FOREIGN KEY (patient_number) REFERENCES Patient(patient_number),
    FOREIGN KEY (ward_number) REFERENCES Ward(ward_number)
);

-- 10. OutPatient
CREATE TABLE IF NOT EXISTS OutPatient (
    outpatient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(10),
    appointment_date DATE,
    appointment_time TIME,
    FOREIGN KEY (patient_number) REFERENCES Patient(patient_number)
);

-- 11. Drug
CREATE TABLE IF NOT EXISTS Drug (
    drug_number INT PRIMARY KEY,
    name VARCHAR(100),
    description TEXT,
    dosage VARCHAR(50),
    method VARCHAR(50),
    quantity_stock INT,
    reorder_level INT,
    cost_per_unit DECIMAL(10, 2)
);

-- 12. Medication
CREATE TABLE IF NOT EXISTS Medication (
    medication_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_number VARCHAR(10),
    drug_number INT,
    units_per_day INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (patient_number) REFERENCES Patient(patient_number),
    FOREIGN KEY (drug_number) REFERENCES Drug(drug_number)
);

-- 13. Supplier
CREATE TABLE IF NOT EXISTS Supplier (
    supplier_number INT PRIMARY KEY,
    name VARCHAR(100),
    address TEXT,
    telephone VARCHAR(15),
    fax VARCHAR(15)
);

-- 14. Supply
CREATE TABLE IF NOT EXISTS Supply (
    item_number INT PRIMARY KEY,
    supplier_number INT,
    name VARCHAR(100),
    description TEXT,
    quantity_stock INT,
    reorder_level INT,
    cost_per_unit DECIMAL(10, 2),
    type VARCHAR(50),
    FOREIGN KEY (supplier_number) REFERENCES Supplier(supplier_number)
);



-- 15. Requisition
CREATE TABLE IF NOT EXISTS Requisition (
    requisition_number INT PRIMARY KEY,
    staff_number VARCHAR(10) NOT NULL, 
    ward_number INT NOT NULL,
    date_ordered DATE NOT NULL,
    date_delivered DATE,
    charge_nurse_signature VARCHAR(100),
    FOREIGN KEY (staff_number) REFERENCES Staff(staff_number),
    FOREIGN KEY (ward_number) REFERENCES Ward(ward_number)
);

-- 16. Fix Requisition items
CREATE TABLE IF NOT EXISTS Requisition_Items (
    requisition_number INT NOT NULL,
    item_number INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (requisition_number, item_number),
    FOREIGN KEY (requisition_number) REFERENCES Requisition(requisition_number),
    FOREIGN KEY (item_number) REFERENCES Supply(item_number)
);  