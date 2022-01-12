package com.bme.controller;

import com.bme.domain.Student;
import com.bme.domain.Supervisor;
import com.bme.service.SupervisorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/supervisor")
public class SupervisorController {

    @Autowired
    private SupervisorService supervisorService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping("/list.do")
    public String getSupervisorList(@RequestParam(defaultValue = "1")Integer pn) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Supervisor> list = supervisorService.getSupervisorList();
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Supervisor> pageInfo = new PageInfo<Supervisor>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");
        httpSession.removeAttribute("sex");
        httpSession.removeAttribute("college");
        httpSession.removeAttribute("tips");

        return "supervisorlist";
    }

    @RequestMapping("/supselect.do")
    @ResponseBody
    public List<Supervisor> getSupervisor() {
        List<Supervisor> list = supervisorService.getSupervisorList();
        return list;
    }

    @RequestMapping("/del.do")
    public String supervisorDel(String id) {
        supervisorService.supervisorDel(id);
        Integer pageNow = (Integer) httpSession.getAttribute("pageNow");
        return getSupervisorList(pageNow);
    }

    @RequestMapping("/add.do")
    public String supervisorAdd(Supervisor supervisor){
        String tips = "添加导师失败！";
        if (supervisorService.getSupervisorById(supervisor.getId()) == null){
            int num =  supervisorService.supervisorAdd(supervisor);
            if (num >= 1){
                tips = "添加导师成功！";
            }
        }else {
            tips = "该工号已存在,添加失败！";
        }
        httpSession.setAttribute("tips",tips);
        return "supervisoradd";
    }


    @RequestMapping("/listByCondition.do")
    public String getSupervisorListByCondition(@RequestParam(defaultValue = "1") Integer pn,
                                            Supervisor supervisor) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Supervisor> list = supervisorService.getSupervisorListByCondition(supervisor);
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Supervisor> pageInfo = new PageInfo<Supervisor>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.setAttribute("id",supervisor.getId());
        httpSession.setAttribute("name",supervisor.getName());
        httpSession.setAttribute("sex",supervisor.getSex());
        httpSession.setAttribute("college",supervisor.getCollege());
        return "supervisorlist";
    }

    @RequestMapping("/modify.do")
    public String supervisorModify() {
        return "supervisormodify";
    }

    @ModelAttribute
    public void modelAttributeMethod(String id, String flag, Map<String,Object> map){
        if("update".equals(flag)){
            Supervisor supervisor = new Supervisor();
            supervisor = supervisorService.getSupervisorById(id);
            map.put("supervisor",supervisor);
        }
    }

    @RequestMapping("/update.do")
    public String supervisorUpdate(Supervisor supervisor){
        String tips = "更新导师信息失败！";
        int num = supervisorService.supervisorUpdate(supervisor);
        if (num > 0){
            tips = "更新导师信息成功！";
        }
        httpSession.setAttribute("tips",tips);
        return "supervisormodify";
    }
}