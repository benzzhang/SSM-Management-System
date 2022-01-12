package com.bme.service;

import com.bme.domain.Student;

import java.util.List;

public interface StudentService {
    List<Student> getStudentList();
    List<Student> getStudentListByCondition(Student student);
    int studentDel(String id);
    int studentUpdate(Student student);
    int studentAdd(Student student);
    Student getStudentById(String id);
}
