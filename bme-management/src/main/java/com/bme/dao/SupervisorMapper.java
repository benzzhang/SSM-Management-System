package com.bme.dao;

import com.bme.domain.Student;
import com.bme.domain.Supervisor;

import java.util.List;

public interface SupervisorMapper {
    int deleteByPrimaryKey(String id);

    int insert(Supervisor record);

    int insertSelective(Supervisor record);

    List<Supervisor> selectAll();

    List<Supervisor> selectByCondition(Supervisor supervisor);

    Supervisor selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(Supervisor record);

    int updateByPrimaryKey(Supervisor record);
}