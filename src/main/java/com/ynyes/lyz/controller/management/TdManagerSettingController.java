package com.ynyes.lyz.controller.management;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ynyes.lyz.entity.TdCity;
import com.ynyes.lyz.entity.TdCompany;
import com.ynyes.lyz.entity.TdServiceItem;
import com.ynyes.lyz.entity.TdSetting;
import com.ynyes.lyz.entity.TdSmsAccount;
import com.ynyes.lyz.service.TdCityService;
import com.ynyes.lyz.service.TdCompanyService;
import com.ynyes.lyz.service.TdManagerLogService;
import com.ynyes.lyz.service.TdServiceItemService;
import com.ynyes.lyz.service.TdSettingService;
import com.ynyes.lyz.service.TdSmsAccountService;
import com.ynyes.lyz.util.SiteMagConstant;



/**
 * 后台广告管理控制器
 * 
 * @author Sharon
 */

@Controller
@RequestMapping(value="/Verwalter/setting")
public class TdManagerSettingController {
    
    @Autowired
    TdSettingService tdSettingService;
    
    @Autowired
    TdManagerLogService tdManagerLogService;
    
    @Autowired
    TdServiceItemService tdServiceItemService;
    
    @Autowired
    private TdCompanyService tdCompanyService;
    
    @Autowired
    TdSmsAccountService tdSmsAccountService;
    
    @Autowired
    private TdCityService tdCityService;
    
    
    @RequestMapping
    public String setting(Long status, ModelMap map,
            HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username) {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("setting", tdSettingService.findTopBy());
        map.addAttribute("status", status);
        
        return "/site_mag/setting_edit";
    }
    
    @RequestMapping(value="/save")
    public String orderEdit(TdSetting tdSetting,
                        ModelMap map,
                        HttpServletRequest req){
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        if (null == tdSetting.getId())
        {
            tdManagerLogService.addLog("add", "用户修改系统设置", req);
        }
        else
        {
            tdManagerLogService.addLog("edit", "用户修改系统设置", req);
        }
        
        tdSettingService.save(tdSetting);
        
        return "redirect:/Verwalter/setting?status=1";
    }
    
    @RequestMapping(value="/service/list")
    public String service(String __EVENTTARGET,
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
                btnDelete(listId, listChkId);
                
                tdManagerLogService.addLog("edit", "删除服务", req);
            }
            else if (__EVENTTARGET.equalsIgnoreCase("btnSave"))
            {
                btnSave(listId, listSortId);
                
                tdManagerLogService.addLog("edit", "修改服务", req);
            }
        }

        map.addAttribute("__EVENTTARGET", __EVENTTARGET);
        map.addAttribute("__EVENTARGUMENT", __EVENTARGUMENT);
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
                
        map.addAttribute("service_item_list", tdServiceItemService.findAllOrderBySortIdAsc());
                
        return "/site_mag/service_item_list";
    }
    
    @RequestMapping(value="/service/edit")
    public String edit(Long id,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != id)
        {
            map.addAttribute("service_item", tdServiceItemService.findOne(id));
        }
        
        return "/site_mag/service_item_edit";
    }
    
    @RequestMapping(value="/service/save", method = RequestMethod.POST)
    public String serviceItemEdit(TdServiceItem tdServiceItem,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        tdServiceItemService.save(tdServiceItem);
        
        tdManagerLogService.addLog("edit", "修改商城服务", req);
        
        return "redirect:/Verwalter/setting/service/list";
    }  
    
    /**
     * 子公司维护-列表
     * @param page
     * @param size
     * @param __EVENTTARGET
     * @param __EVENTARGUMENT
     * @param __VIEWSTATE
     * @param action
     * @param listId
     * @param listChkId
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/company/list")
    public String settingCompanyList(Integer page,
						            Integer size,
						            String __EVENTTARGET,
						            String __EVENTARGUMENT,
						            String __VIEWSTATE,
						            String action,
						            Long[] listId,
						            Integer[] listChkId,
						            ModelMap map,
						            HttpServletRequest req)
    {
    	String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnDelete"))
            {
                btnDeleteCompany(listId, listChkId);
                tdManagerLogService.addLog("delete", "删除子公司", req);
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
        map.addAttribute("company_page", tdCompanyService.findAll(page, size));
    	return "/site_mag/company_list";
    }
    
    @RequestMapping(value="/company/edit")
    public String cityEdit(Long id,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req)
    {
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != id)
        {
            map.addAttribute("company", tdCompanyService.findOne(id));
        }
        
        return "/site_mag/company_edit";
    }
    
    @RequestMapping(value="/company/save", method = RequestMethod.POST)
    public String citySave(TdCompany tdCompany, String __VIEWSTATE, ModelMap map, HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        String type = null;
        if (null ==  tdCompany.getId())
        {
			type = "add";
		}
        else
        {
			type = "edit";
		}
        tdCompanyService.save(tdCompany);
        
        tdManagerLogService.addLog(type, "修改子公司", req);
        
        return "redirect:/Verwalter/setting/company/list";
    }  
    /**
     * 城市维护-列表
     * @param page
     * @param size
     * @param __EVENTTARGET
     * @param __EVENTARGUMENT
     * @param __VIEWSTATE
     * @param action
     * @param listId
     * @param listChkId
     * @param map
     * @param req
     * @return
     */
    @RequestMapping(value = "/city/list")
    public String settingCityList(Integer page,
						            Integer size,
						            String __EVENTTARGET,
						            String __EVENTARGUMENT,
						            String __VIEWSTATE,
						            String action,
						            Long[] listId,
						            Integer[] listChkId,
						            ModelMap map,
						            HttpServletRequest req)
    {
    	String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnDelete"))
            {
                btnDeleteCity(listId, listChkId);
                tdManagerLogService.addLog("delete", "删除城市", req);
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
        map.addAttribute("city_page", tdCityService.findAll(page, size));
    	return "/site_mag/city_list";
    }
    
    @RequestMapping(value="/city/edit")
    public String companyEdit(Long id,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req)
    {
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != id)
        {
            map.addAttribute("city", tdCityService.findOne(id));
            
        }
        map.addAttribute("company_list",tdCompanyService.findAll());
        return "/site_mag/city_edit";
    }
    
    @RequestMapping(value="/city/save", method = RequestMethod.POST)
    public String companySave(TdCity tdCity, String __VIEWSTATE, ModelMap map, HttpServletRequest req) 
    {
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        String type = null;
        if (null ==  tdCity.getId())
        {
			type = "add";
		}
        else
        {
			type = "edit";
		}
        tdCityService.save(tdCity);
        
        tdManagerLogService.addLog(type, "修改子公司", req);
        
        return "redirect:/Verwalter/setting/city/list";
    }  
    
    /*-------------------------短信账户 begin --------------------------*/
    @RequestMapping(value = "/smsAccount/list")
    public String settingsmsAccountList(Integer page,
						            Integer size,
						            String __EVENTTARGET,
						            String __EVENTARGUMENT,
						            String __VIEWSTATE,
						            String action,
						            Long[] listId,
						            Integer[] listChkId,
						            ModelMap map,
						            HttpServletRequest req)
    {
    	String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        if (null != __EVENTTARGET)
        {
            if (__EVENTTARGET.equalsIgnoreCase("btnDelete"))
            {
                btnDeleteSmsAccount(listId, listChkId);
                tdManagerLogService.addLog("delete", "删除子公司", req);
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
        map.addAttribute("sms_page", tdSmsAccountService.findAll(page,size));
    	return "/site_mag/smsAccount_list";
    }
    
    @RequestMapping(value="/smsAccount/edit")
    public String smsAccountEdit(Long id,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req)
    {
        String username = (String) req.getSession().getAttribute("manager");
        
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        
        if (null != id)
        {
            map.addAttribute("smsAccount", tdSmsAccountService.findOne(id));
        }
        
        return "/site_mag/smsAccount_edit";
    }
    
    @RequestMapping(value="/smsAccount/save", method = RequestMethod.POST)
    public String smsAccountSave(TdSmsAccount tdSmsAccount,
                        String __VIEWSTATE,
                        ModelMap map,
                        HttpServletRequest req) {
        String username = (String) req.getSession().getAttribute("manager");
        if (null == username)
        {
            return "redirect:/Verwalter/login";
        }
        
        map.addAttribute("__VIEWSTATE", __VIEWSTATE);
        String type = null;
        if (null ==  tdSmsAccount.getId())
        {
			type = "add";
		} 
        else 
        {
			type = "edit";
		}
        tdSmsAccountService.save(tdSmsAccount);
        
        tdManagerLogService.addLog(type, "修改短信账户", req);
        
        return "redirect:/Verwalter/setting/smsAccount/list";
    }  
    
    /*-------------------------短信账户 end -----------------------------*/
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id,
                            @RequestParam(value = "serviceItemId", required = false) Long serviceItemId,
                            ModelMap map) {
        if (null != id) {
            map.addAttribute("tdSetting", tdSettingService.findOne(id));
        }
        
        if (null != serviceItemId) {
            TdServiceItem serviceItem = tdServiceItemService.findOne(serviceItemId);
            map.addAttribute("tdServiceItem", serviceItem);
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
            
            TdServiceItem e = tdServiceItemService.findOne(id);
            
            if (null != e)
            {
                if (sortIds.length > i)
                {
                    e.setSortId(new Double(sortIds[i]));
                    tdServiceItemService.save(e);
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
                
                tdServiceItemService.delete(id);
            }
        }
    }
    private void btnDeleteCompany(Long[] ids, Integer[] chkIds)
    {
        if (null == ids || null == chkIds || ids.length < 1 || chkIds.length < 1)
        {
            return;
        }
        
        for (int chkId : chkIds)
        {
            if (chkId >=0 && ids.length > chkId)
            {
                Long id = ids[chkId];
                
                tdCompanyService.delete(id);
            }
        }
    }
    
    private void btnDeleteCity(Long[] ids, Integer[] chkIds)
    {
        if (null == ids || null == chkIds || ids.length < 1 || chkIds.length < 1)
        {
            return;
        }
        
        for (int chkId : chkIds)
        {
            if (chkId >=0 && ids.length > chkId)
            {
                Long id = ids[chkId];
                
                tdCityService.delete(id);
            }
        }
    }
    
    /**
     * 删除短信账户
     * @author Zhangji
     * @param ids
     * @param chkIds
     */
    private void btnDeleteSmsAccount(Long[] ids, Integer[] chkIds)
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
                
                tdSmsAccountService.delete(id);
            }
        }
    }
}
