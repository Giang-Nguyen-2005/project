package com.example.repository;

import com.example.dao.StudentDAO;
import com.example.model.Student;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class StudentRepository implements StudentDAO {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void saveStudent(Student student) {
        entityManager.persist(student);
    }

    @Override
    public List<Student> getAllStudents() {
        TypedQuery<Student> query = entityManager.createQuery("SELECT s FROM Student s", Student.class);
        return query.getResultList();
    }

    @Override
    public Student findStudent(Long id) {
        return entityManager.find(Student.class, id);
    }

    @Override
    public void updateStudent(Student student) {
        entityManager.merge(student);
    }

    @Override
    public void deleteStudent(Long id) {
        Student student = findStudent(id);
        if (student != null) {
            entityManager.remove(student);
        }
    }
}