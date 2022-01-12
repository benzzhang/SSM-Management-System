package com.bme.service;

import com.bme.domain.Admin;
import com.bme.domain.Supervisor;

public interface AdminService {
    Admin Login(String id, String pw);
    int Regist(String id, String pW, Integer level);
    int adminUpdate(Admin admin);
    Admin getAdminById(String id);

}
