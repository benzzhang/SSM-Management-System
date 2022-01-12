package com.bme.service.impl;

import com.bme.dao.MembersMapper;
import com.bme.dao.ProjectMapper;
import com.bme.domain.Members;
import com.bme.domain.Project;
import com.bme.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    @Autowired
    private MembersMapper membersMapper;

    @Override
    public List<Project> getProjectList() {
        return projectMapper.selectAll();
    }

    @Override
    public List<Project> getProjectListByCondition(Project project) {
        return projectMapper.selectByCondition(project);
    }

    @Override
    public int projectDel(Integer id) {
        return projectMapper.deleteByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int projectUpdate(Project project, Members members) {
        int num0 = projectMapper.updateByPrimaryKeySelective(project);
        int num1 = membersMapper.updateByPrimaryKeySelective(members);
        int result = 0;
        if (num0 >=1 && num1 >= 1){
            result = 1;
        }
        return result;
    }

    @Override
    public Project getProjectById(Integer id) {
        return projectMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int projectAdd(Project project, Members members) {
        int num0 = projectMapper.insertSelective(project);
        int num1 = membersMapper.insertSelective(members);
        int result = 0;
        if (num0 >= 1 && num1 >= 1){
            result = 1;
        }
        return result;
    }

}
