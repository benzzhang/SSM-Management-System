package com.bme.controller;

import com.bme.domain.Admin;
import com.bme.domain.Student;
import com.bme.domain.Supervisor;
import com.bme.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping("/login.do")
    public String amdinLogin(String id, String password){

        Admin admin = adminService.Login(id, password);
        if (admin != null){
            httpSession.setAttribute("admin",admin);
            return "homepage";
        }else {
            httpSession.setAttribute("errormsg","账户/密码错误!");
            return "login";
        }
    }

    @RequestMapping("/logout.do")
    public String adminLogout(){
        httpSession.removeAttribute("admin");
        httpSession.removeAttribute("errormsg");
        return "login";
    }

    @RequestMapping("/modify.do")
    public String adminModify() {
        return "adminmodify";
    }

    @ModelAttribute
    public void modelAttributeMethod(String id, String flag, Map<String,Object> map){
        if("update".equals(flag)){
            Admin admin = new Admin();
            admin = adminService.getAdminById(id);
            map.put("admin",admin);
        }
    }

    @RequestMapping("/update.do")
    public String adminUpdate(Admin admin){
        String tips = "更新管理员信息失败！";
        int num = adminService.adminUpdate(admin);
        if (num > 0){
            tips = "更新管理员信息成功！";
            httpSession.setAttribute("admin",admin);
        }
        httpSession.setAttribute("tips",tips);
        return "adminmodify";
    }
}
