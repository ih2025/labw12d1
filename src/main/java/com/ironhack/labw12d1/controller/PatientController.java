package com.ironhack.hospital.controller;

import com.ironhack.hospital.model.Patient;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@RequestMapping("/patients") // ruta base
public interface PatientController {

    @GetMapping
    List<Patient> getAllPatients();

    @GetMapping("/{id}")
    Optional
