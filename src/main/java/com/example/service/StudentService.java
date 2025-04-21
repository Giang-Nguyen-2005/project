package com.example.service;

import com.example.dao.StudentDAO;
import com.example.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    private final StudentDAO studentDAO;

    @Autowired
    public StudentService(StudentDAO studentDAO) {
        this.studentDAO = studentDAO;
    }

    public void saveStudent(Student student) {
        studentDAO.saveStudent(student);
    }

    public List<Student> getAllStudents() {
        return studentDAO.getAllStudents();
    }

    public Student getStudentById(Long id) {
        return studentDAO.findStudent(id);
    }

    public void updateStudent(Student student) {
        studentDAO.updateStudent(student);
    }

    public void deleteStudent(Long id) {
        studentDAO.deleteStudent(id);
    }
}