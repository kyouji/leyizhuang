package com.ynyes.rongcheng.controller.management;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ynyes.rongcheng.entity.TdManager;
import com.ynyes.rongcheng.service.TdManagerLogService;
import com.ynyes.rongcheng.service.TdManagerService;
import com.ynyes.rongcheng.util.SiteMagConstant;

/**
 * 后台管理员控制器
 * 
 * @author Sharon
 */

@Controller
@RequestMapping(value="/Verwalter/manager")
public class TdManagerManagerController {
    
    @Autowired
    TdManagerService tdManagerService;
    
    @Autowired
    TdManagerLogService tdManagerLogService;
    
    @RequestMapping(value="/list")
    public String managerList(Integer page,
                          Integer size,
                          String __EVENTTARGET,
                          String __EVENTARGUMENT,
                          String __VIEWSTATE,
                          Long[] listId,
                          Integer[] listChkId,
                          Long[] listSortId,
                          ModelMap map,
                          HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnDelete"))
            {
                if (username.equalsIgnoreCase("admin"))
                {
                    btnDelete(listId, listChkId);
                    tdManagerLogService.addLog("delete", "删除管理员", req);
                }
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnSave"))
            {
                btnSave(listId, listSortId);
                tdManagerLogService.addLog("edit", "修改管理员", req);
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnPage"))
            {
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
            }
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        map.addAttribute("manager_page", tdManagerService.findAllOrderBySortIdAsc(page, size));
        
        return "/site_mag/manager_list";
    }
    
    @RequestMapping(value="/log")
    public String logList(Integer page,
                          Integer size,
                          String __EVENTTARGET,
                          String __EVENTARGUMENT,
                          String __VIEWSTATE,
                          String action,
                          Long[] listId,
                          Integer[] listChkId,
                          ModelMap map,
                          HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnDelete"))
            {
                btnDeleteLog(listId, listChkId);
                tdManagerLogService.addLog("delete", "删除管理日志", req);
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnPage"))
            {
                if (null != __EVENTARGUMENT)
                {
                    page = Integer.parseInt(__EVENTARGUMENT);
                } 
            }
        }
        
        if (null == page || page < 0)
        {
            page = 0;
        }
        
        if (null == size || size <= 0)
        {
            size = SiteMagConstant.pageSize;;
        }
        
        map.addAttribute("page", page);
        map.addAttribute("size", size);
        map.addAttribute("action", action);
        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null == action || action.isEmpty())
        {
            map.addAttribute("log_page", tdManagerLogService.findAll(page, size));
        }
        else
        {
            map.addAttribute("log_page", tdManagerLogService.findByActionType(action, page, size));
        }
        
        return "/site_mag/log_list";
    }
    
    @RequestMapping(value="/edit")
    public String orderEdit(Long id,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);

        if (null != id)
        {
            map.addAttribute("tdManager", tdManagerService.findOne(id));
        }
        return "/site_mag/manager_edit";
    }
    
    @RequestMapping(value="/save")
    public String orderEdit(TdManager tdManager,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null == tdManager.getId())
        {
            tdManagerLogService.addLog("add", "修改管理员", req);
        }
        else
        {
            tdManagerLogService.addLog("edit", "修改管理员", req);
        }
        
        tdManagerService.save(tdManager);
        
        return "redirect:/Verwalter/manager/list";
    }

    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id,
                        Model model) {
        if (null != id) {
            model.addAttribute("tdManager", tdManagerService.findOne(id));
        }
    }
    
    private void btnSave(Long[] ids, Long[] sortIds)
    {
        if (null == ids || null == sortIds
                || ids.length < 1 || sortIds.length < 1)
        {
            return;
        }
        
        for (int i = 0; i < ids.length; i++)
        {
            Long id = ids[i];
            
            TdManager e = tdManagerService.findOne(id);
            
            if (null != e)
            {
                if (sortIds.length > i)
                {
                    e.setSortId(sortIds[i]);
                    tdManagerService.save(e);
                }
            }
        }
    }
    
    private void btnDelete(Long[] ids, Integer[] chkIds)
    {
        if (null == ids || null == chkIds
                || ids.length < 1 || chkIds.length < 1)
        {
            return;
        }
        
        for (int chkId : chkIds)
        {
            if (chkId >=0 && ids.length > chkId)
            {
                Long id = ids[chkId];
                
                tdManagerService.delete(id);
            }
        }
    }
    
    private void btnDeleteLog(Long[] ids, Integer[] chkIds)
    {
        if (null == ids || null == chkIds
                || ids.length < 1 || chkIds.length < 1)
        {
            return;
        }
        
        for (int chkId : chkIds)
        {
            if (chkId >=0 && ids.length > chkId)
            {
                Long id = ids[chkId];
                
                tdManagerLogService.delete(id);
            }
        }
    }
}
