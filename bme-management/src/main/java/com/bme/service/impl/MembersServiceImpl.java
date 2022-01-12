package com.bme.service.impl;

import com.bme.dao.MembersMapper;
import com.bme.domain.Members;
import com.bme.service.MembersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembersServiceImpl implements MembersService {

    @Autowired
    private MembersMapper membersMapper;

    @Override
    public Members getMembersById(Integer id) {
        return membersMapper.selectByPrimaryKey(id);
    }
}
