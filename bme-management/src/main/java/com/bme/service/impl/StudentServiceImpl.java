package com.bme.service.impl;

import com.bme.dao.StudentMapper;
import com.bme.domain.Student;
import com.bme.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    public List<Student> getStudentList() {
        return studentMapper.selectAll();
    }

    @Override
    public List<Student> getStudentListByCondition(Student student) {
        return studentMapper.selectByCondition(student);
    }

    @Override
    public int studentDel(String id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int studentUpdate(Student student) {
        return studentMapper.updateByPrimaryKeySelective(student);
    }

    @Override
    public int studentAdd(Student student) {
        return studentMapper.insertSelective(student);
    }

    @Override
    public Student getStudentById(String id) {
        return studentMapper.selectByPrimaryKey(id);
    }
}
