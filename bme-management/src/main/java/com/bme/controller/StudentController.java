package com.bme.controller;

import com.bme.domain.Project;
import com.bme.domain.Student;
import com.bme.service.StudentService;
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
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping("/list.do")
    public String getStudentList(@RequestParam(defaultValue = "1")Integer pn) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Student> list = studentService.getStudentList();
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Student> pageInfo = new PageInfo<Student>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");
        httpSession.removeAttribute("sex");
        httpSession.removeAttribute("college");
        httpSession.removeAttribute("major");
        httpSession.removeAttribute("tips");

        return "studentlist";
    }

    @RequestMapping("/stuselect.do")
    @ResponseBody public List<Student> getStudent() {
        List<Student> list = studentService.getStudentList();
        return list;
    }

    @RequestMapping("/del.do")
    public String studentDel(String id) {
        studentService.studentDel(id);
        Integer pageNow = (Integer) httpSession.getAttribute("pageNow");
        return getStudentList(pageNow);
    }

    @RequestMapping("/add.do")
    public String studentAdd(Student student){
        String tips = "添加学生失败！";
        if (studentService.getStudentById(student.getId()) == null){
            int num =  studentService.studentAdd(student);
            if (num >= 1){
                tips = "添加学生成功！";
            }
        }else {
            tips = "该学号已存在,添加失败！";
        }
        httpSession.setAttribute("tips",tips);
        return "studentadd";
    }


    @RequestMapping("/listByCondition.do")
    public String getStudentListByCondition(@RequestParam(defaultValue = "1") Integer pn,
                                            Student student) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Student> list = studentService.getStudentListByCondition(student);
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Student> pageInfo = new PageInfo<Student>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.setAttribute("id",student.getId());
        httpSession.setAttribute("name",student.getName());
        httpSession.setAttribute("sex",student.getSex());
        httpSession.setAttribute("college",student.getCollege());
        httpSession.setAttribute("major",student.getMajor());
        return "studentlist";
    }

    @RequestMapping("/modify.do")
    public String studentModify() {
        return "studentmodify";
    }

    @ModelAttribute
    public void modelAttributeMethod(String id, String flag, Map<String,Object> map){
        if("update".equals(flag)){
            Student student = new Student();
            student = studentService.getStudentById(id);
            map.put("student",student);
        }
    }

    @RequestMapping("/update.do")
    public String studentUpdate(Student student){
        String tips = "更新学生信息失败！";
        int num = studentService.studentUpdate(student);
        if (num > 0){
            tips = "更新学生信息成功！";
        }
        httpSession.setAttribute("tips",tips);
        return "studentmodify";
    }
}
