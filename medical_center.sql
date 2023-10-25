CREATE TABLE medical_centers (
    hospital_id SERIAL PRIMARY KEY,
    hospital_name TEXT
);

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    doctor_first_name TEXT,
    doctor_last_name TEXT,
    hospital_id INT REFERENCES medical_centers(hospital_id)
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    patient_first_name TEXT,
    patient_last_name TEXT,
    hospital_id INT REFERENCES medical_centers(hospital_id),
    admission BOOLEAN
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    disease_name TEXT
);

CREATE TABLE doctor_patient (
    doctor_id INT REFERENCES doctors(doctor_id),
    patient_id INT REFERENCES patients(patient_id),
    PRIMARY KEY (doctor_id, patient_id)
);

CREATE TABLE patient_disease (
    patient_id INT REFERENCES patients(patient_id),
    disease_id INT REFERENCES diseases(disease_id),
    PRIMARY KEY (patient_id, disease_id)
);
