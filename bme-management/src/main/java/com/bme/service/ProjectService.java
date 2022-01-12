package com.bme.service;

import com.bme.domain.Members;
import com.bme.domain.Project;

import java.util.List;

public interface ProjectService {
    List<Project> getProjectList();
    List<Project> getProjectListByCondition(Project project);
    int projectDel(Integer id);
    int projectUpdate(Project project, Members members);
    int projectAdd(Project project, Members members);
    Project getProjectById(Integer id);
}
