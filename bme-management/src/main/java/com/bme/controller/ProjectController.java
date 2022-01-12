package com.bme.controller;

import com.bme.domain.Members;
import com.bme.domain.Project;
import com.bme.service.MembersService;
import com.bme.service.ProjectService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    private ProjectService projectService;

    @Autowired
    private MembersService membersService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping("/list.do")
    public String getProjectList(@RequestParam(defaultValue = "1")Integer pn) {
        /* pn=1 pageSize=5 ： 从第一页开始，每页显示5条 */
        PageHelper.startPage(pn, 5);
        List<Project> list = projectService.getProjectList();
        /* 封装分页信息，传入连续显示的页数5 */
        PageInfo<Project> pageInfo = new PageInfo<Project>(list, 5);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");
        httpSession.removeAttribute("tips");
        return "projectlist";
    }

    @RequestMapping("/del.do")
    public String projectDel(Integer id) {
        projectService.projectDel(id);
        Integer pageNow = (Integer) httpSession.getAttribute("pageNow");
        return getProjectList(pageNow);
    }

    @RequestMapping("/modify.do")
    public String projectModify() {
        return "projectmodify";
    }

    @RequestMapping("/view.do")
    public String projectView() {
        return "projectview";
    }

    @ModelAttribute
    public void modelAttributeMethod(Integer id,String flag,Map<String,Object> map){
        if("update".equals(flag)){
            Project project = projectService.getProjectById(id);
            Members members = membersService.getMembersById(id);
            map.put("project",project);
            map.put("members",members);
        }
    }

    @RequestMapping("/update.do")
    public String projectUpdate(Project project, Members members){
        String tips = "更新课题信息失败！";
        int num = projectService.projectUpdate(project ,members);
        if (num > 0){
            tips = "更新课题信息成功！";
        }
        httpSession.setAttribute("tips",tips);
        return "projectmodify";
    }

    @RequestMapping("/add.do")
    public String projectAdd(Project project, Members members){
        String tips = "添加课题失败！";
        if (projectService.getProjectById(project.getId()) == null){
            int num =  projectService.projectAdd(project, members);
            if (num >= 1){
                tips = "添加课题成功！";
            }
        }else {
            tips = "信息有误,添加失败！";
        }
        httpSession.setAttribute("tips",tips);
        return "projectadd";
    }

    @RequestMapping("/listByCondition.do")
    public String getProjectListByCondition(@RequestParam(defaultValue = "1") Integer pn,
                                            Project project) {
        /* pn=1 pageSize=5 ： 从第一页开始，每页显示5条 */
        PageHelper.startPage(pn, 5);
        List<Project> list = projectService.getProjectListByCondition(project);
        /* 封装分页信息，传入连续显示的页数5 */
        PageInfo<Project> pageInfo = new PageInfo<Project>(list, 5);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.setAttribute("id",project.getId());
        httpSession.setAttribute("name",project.getName());
        return "projectlist";
    }
}
