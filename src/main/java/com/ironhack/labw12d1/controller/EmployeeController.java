package com.ironhack.hospital.controller;

import com.ironhack.hospital.model.Employee;
import com.ironhack.hospital.model.enums.EmployeeStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RequestMapping("/doctors") // ruta base
public interface EmployeeController {

    @GetMapping
    List<Employee> getAllDoctors();

    @GetMapping("/{id}")
    Optional<Employee> getDoctorById(@PathVariable Long id);

    @GetMapping("/status/{status}")
    List<Employee> getDoctorsByStatus(@PathVariable EmployeeStatus status);

    @GetMapping("/department/{department}")
    List<Employee> getDoctorsByDepartment(@PathVariable String department);
}
