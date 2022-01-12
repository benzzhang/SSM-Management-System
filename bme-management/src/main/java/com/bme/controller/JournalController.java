package com.bme.controller;

import com.bme.domain.Journal;
import com.bme.service.JournalService;
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
@RequestMapping("/journal")
public class JournalController {

    @Autowired
    private JournalService journalService;

    @Resource
    private HttpSession httpSession;

    @RequestMapping("/list.do")
    public String getJournalList(@RequestParam(defaultValue = "1")Integer pn) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Journal> list = journalService.getJournalList();
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Journal> pageInfo = new PageInfo<Journal>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.removeAttribute("id");
        httpSession.removeAttribute("name");
        httpSession.removeAttribute("publisher");
        httpSession.removeAttribute("impactFactor");

        return "journallist";
    }

    @RequestMapping("/del.do")
    public String journalDel(Integer id) {
        journalService.journalDel(id);
        Integer pageNow = (Integer) httpSession.getAttribute("pageNow");
        return getJournalList(pageNow);
    }

    @RequestMapping("/add.do")
    public String journalAdd(Journal journal){
        String tips = "添加期刊失败！";
        if (journalService.getJournalById(journal.getId()) == null){
            int num =  journalService.journalAdd(journal);
            if (num >= 1){
                tips = "添加期刊成功！";
            }
        }else {
            tips = "该ID已存在,添加失败！";
        }
        httpSession.setAttribute("tips",tips);
        return "journaladd";
    }


    @RequestMapping("/listByCondition.do")
    public String getJournalListByCondition(@RequestParam(defaultValue = "1") Integer pn,
                                            Journal journal) {
        /* pn=1 pageSize=10 ： 从第一页开始，每页显示10条 */
        PageHelper.startPage(pn, 10);
        List<Journal> list = journalService.getJournalListByCondition(journal);
        /* 封装分页信息，传入连续显示的页数10 */
        PageInfo<Journal> pageInfo = new PageInfo<Journal>(list, 10);
        httpSession.setAttribute("pageInfo", pageInfo);
        httpSession.setAttribute("pageNow", pn);
        httpSession.setAttribute("id",journal.getId());
        httpSession.setAttribute("name",journal.getName());
        httpSession.setAttribute("publisher",journal.getPublisher());
        httpSession.setAttribute("impactFactor",journal.getImpactFactor());

        return "journallist";
    }

    @RequestMapping("/modify.do")
    public String journalModify() {
        return "journalmodify";
    }

    @ModelAttribute
    public void modelAttributeMethod(Integer id, String flag, Map<String,Object> map){
        if("update".equals(flag)){
            Journal journal = new Journal();
            journal = journalService.getJournalById(id);
            map.put("journal",journal);
        }
    }

    @RequestMapping("/update.do")
    public String journalUpdate(Journal journal){
        String tips = "更新期刊信息失败！";
        int num = journalService.journalUpdate(journal);
        if (num > 0){
            tips = "更新期刊信息成功！";
        }
        httpSession.setAttribute("tips",tips);
        return "journalmodify";
    }
}
