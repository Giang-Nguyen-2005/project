package com.example.dao;

import com.example.model.Student;
import java.util.List;

public interface StudentDAO {
    void saveStudent(Student student);
    List<Student> getAllStudents();
    Student findStudent(Long id);
    void updateStudent(Student student);
    void deleteStudent(Long id);
}