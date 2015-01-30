package com.ynyes.rongcheng.controller.front;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.util.StringUtils;

/**
 * 
 * 新闻资讯
 * NewsController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午6:09:32 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/news")
public class NewsController {
    @RequestMapping("/{typeId}")
    public String news(@PathVariable String typeId){
        if(StringUtils.isNotEmpty(typeId) && StringUtils.isNumber(typeId)){
            if(typeId.equals("1")){
                return "/front/news/news_mobile";//手机资讯
            }
            if(typeId.equals("2")){
                return "/front/news/news_fever";//手机发烧
            }
            if(typeId.equals("3")){
                return "/front/news/news_video";//新闻视频
            }
       
    }
        return "error404";
    }
}
