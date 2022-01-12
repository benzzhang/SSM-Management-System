package com.bme.service;

import com.bme.domain.Supervisor;

import java.util.List;

public interface SupervisorService {
    List<Supervisor> getSupervisorList();
    List<Supervisor> getSupervisorListByCondition(Supervisor supervisor);
    int supervisorDel(String id);
    int supervisorUpdate(Supervisor supervisor);
    int supervisorAdd(Supervisor supervisor);
    Supervisor getSupervisorById(String id);
}
