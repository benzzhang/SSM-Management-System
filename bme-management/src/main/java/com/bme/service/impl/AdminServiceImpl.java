package com.bme.service.impl;

import com.bme.dao.AdminMapper;
import com.bme.domain.Admin;
import com.bme.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin Login(String id, String pw) {
        Admin admin = adminMapper.selectByPrimaryKey(id);
        if (admin != null){
            if (pw.equals(admin.getPassword())){
                return admin;
            }else {
                return null;
            }
        }
        return null;
    }

    @Override
    public int Regist(String id, String pW, Integer level) {
        return 0;
    }

    @Override
    public int adminUpdate(Admin admin) {
        return adminMapper.updateByPrimaryKeySelective(admin);
    }

    @Override
    public Admin getAdminById(String id) {
        return adminMapper.selectByPrimaryKey(id);
    }
}
