package com.ironhack.hospital.repository;

import com.ironhack.hospital.model.Employee;
import com.ironhack.hospital.model.enums.EmployeeStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface EmployeeRepository extends JpaRepository<Employee, Long> {
    List<Employee> findByStatus(EmployeeStatus status);
    List<Employee> findByDepartment(String department);
}
