package com.ironhack.hospital.controller.impl;

import com.ironhack.hospital.controller.EmployeeController;
import com.ironhack.hospital.model.Employee;
import com.ironhack.hospital.model.enums.EmployeeStatus;
import com.ironhack.hospital.service.EmployeeService;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Optional;

@RestController
public class EmployeeControllerImpl implements EmployeeController {

    private final EmployeeService employeeService;

    public EmployeeController
