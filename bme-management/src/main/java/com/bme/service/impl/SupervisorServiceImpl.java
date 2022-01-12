package com.bme.service.impl;

import com.bme.dao.SupervisorMapper;
import com.bme.domain.Supervisor;
import com.bme.service.SupervisorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SupervisorServiceImpl implements SupervisorService {

    @Autowired
    SupervisorMapper supervisorMapper;

    @Override
    public List<Supervisor> getSupervisorList() {
        return supervisorMapper.selectAll();
    }

    @Override
    public List<Supervisor> getSupervisorListByCondition(Supervisor supervisor) {
        return supervisorMapper.selectByCondition(supervisor);
    }

    @Override
    public int supervisorDel(String id) {
        return supervisorMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int supervisorUpdate(Supervisor supervisor) {
        return supervisorMapper.updateByPrimaryKeySelective(supervisor);
    }

    @Override
    public int supervisorAdd(Supervisor supervisor) {
        return supervisorMapper.insertSelective(supervisor);
    }

    @Override
    public Supervisor getSupervisorById(String id) {
        return supervisorMapper.selectByPrimaryKey(id);
    }
}
