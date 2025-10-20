package com.ironhack.hospital.service.impl;

import com.ironhack.hospital.model.Patient;
import com.ironhack.hospital.model.enums.EmployeeStatus;
import com.ironhack.hospital.repository.PatientRepository;
import com.ironhack.hospital.service.PatientService;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class PatientServiceImpl implements PatientService {

    private final PatientRepository patientRepository;

    public PatientServiceImpl(PatientRepository patientRepository) {
        this.patientRepository = patientRepository;
    }

    @Override
    public List<Patient> getAllPatients() {
        return patientRepository.findAll();
    }

    @Override
    public Optional<Patient> getPatientById(Long id) {
        return patientRepository.findById(id);
    }

    @Override
    public List<Patient> getPatientsByDateRange(LocalDate start, LocalDate end) {
        return patientRepository.findByDateOfBirthBetween(start, end);
    }

    @Override
    public List<Patient> getPatientsByDoctorDepartment(String department) {
        return patientRepository.findByAdmittedByDepartment(department);
    }

    @Override
    public List<Patient> getPatientsWithDoctorOff() {
        return patientRepository.findByAdmittedByStatus(EmployeeStatus.OFF);
    }
}
