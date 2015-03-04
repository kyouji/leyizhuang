package com.ynyes.rongcheng.controller.management;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.UserService;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 品牌管理控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value="/admin/user")
public class ManagerUserController {
    
    @Autowired
    UserService userService;
    
    @RequestMapping
    public String user(ModelMap map){
        
        Page<User> userPage = userService.findAll(0, ManagementConstant.pageSize, "desc", "id");
        
        
        if (null != userPage)
        {
            map.addAttribute("user_list", userPage.getContent());
        }
        
        return "/management/user";
    }
    
    /**
     * 获取指定页号的用户
     * 
     * @param map
     * @param pageIndex 页号
     * @return
     */
    @RequestMapping(value="/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {
        
        if (null != pageIndex && pageIndex.intValue() >= 0)
        {
            Page<User> userPage = userService.findAll(pageIndex, ManagementConstant.pageSize, "desc", "id");
            
            if (null != userPage)
            {
                map.addAttribute("user_list", userPage.getContent());
            }
        }
        
        return "/management/user/user_tbody";
    }
    
    @RequestMapping(value="/modify/{id}",method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long id){
        if (null != id)
        {
            map.addAttribute("user", userService.findOne(id));
        }
        
        return "/management/user/user_modify";
    }
    
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(ModelMap map, User user){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == user)
        {
            res.put("message", "参数有误");
            return res;
        }
        
        if (null == user.getUsername() || "".equals(user.getUsername()))
        {
            res.put("message", "用户名不能为空");
            return res;
        }
        
        if (null != userService.findByUsername(user.getUsername()))
        {
            res.put("message", "用户名已存在");
            return res;
        }
        
        if (null == userService.save(user))
        {
            res.put("message", "保存用户出错");
            return res;
        }
        
        res.put("code", 0);
        
        return res;
    }
    
    /**
     * 删除
     * 
     * @param map
     * @param id ID
     * @return
     */
    @RequestMapping(value="/delete/{id}", method=RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long id) {
        
        if (null != id)
        {
            userService.delete(id);
        }
    }
    
    /**
     * 存在id字段时先查找出对应的实体
     * 
     * @param id
     * @param model
     */
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id, ModelMap map) {
        if (id != null) {
            map.addAttribute("user", userService.findOne(id));
        }
    }
    
}
