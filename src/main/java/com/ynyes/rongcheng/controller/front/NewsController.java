package com.ynyes.rongcheng.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.News;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.SiteInfo;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.NewsService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.service.SiteInfoService;
import com.ynyes.rongcheng.util.ClientConstant;

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
	@Autowired 
	private NewsService newsService;
	
	@Autowired
    private ProductService productService;
    
    @Autowired
    private ProductTypeService productTypeService;
    
    @Autowired
    private BrandService brandService;
    
    @Autowired
    private SiteInfoService siteInfoService;
    
	@RequestMapping("/{queryStr}")
    public String news(@PathVariable String queryStr, ModelMap map){
	    // 导航栏
        List<ProductType> rptList = productTypeService.findByParent("");
        
        map.addAttribute("root_type_list", rptList);
        
        for (ProductType pType : rptList)
        {
            if (pType.getName().equals("手机"))
            {
                List<Brand> brandList = brandService.findByType(pType.getName());
                
                if (null != brandList)
                {
                    for (int i=0; i < brandList.size(); i++)
                    {
                        if (brandList.get(i).getName().contains("苹果"))
                        {
                            map.addAttribute("apple_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("小米"))
                        {
                            map.addAttribute("mi_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("华为"))
                        {
                            map.addAttribute("huawei_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("联想"))
                        {
                            map.addAttribute("lenovo_index", i + 1);
                        }
                    }
                }
                map.addAttribute("phone_type", pType);
            }
            else if (pType.getName().equals("手机配件"))
            {
                List<ProductType> ptList = productTypeService.findByParent("手机配件");
                
                map.addAttribute("accessory_sub_type_list", ptList);
                map.addAttribute("phone_accessory_type", pType);
            }
            else if (pType.getName().equals("靓号中心"))
            {
                map.addAttribute("phone_number_type", pType);
            }
        }
        
        map.addAttribute("second_hand_phone_type", productTypeService.findByName("二手手机"));
        
        // 导航栏结束
        
        // 页脚数据
        List<SiteInfo> infoList = siteInfoService.findByType("帮助中心");
        
        map.addAttribute("help_info_list", infoList);
        
        infoList = siteInfoService.findByType("支付配送");
        
        map.addAttribute("delivery_info_list", infoList);
        
        infoList = siteInfoService.findByType("售后服务");
        
        map.addAttribute("service_info_list", infoList);
        
        infoList = siteInfoService.findByType("关于荣诚");
        
        map.addAttribute("about_info_list", infoList);
        
        infoList = siteInfoService.findByType("免费热线电话");
        
        map.addAttribute("phone_info_list", infoList);
        // 页脚数据结束
        
        // [资讯分类]-[页号]
        String[] queryArray = queryStr.split("-");
        
        int newsType = 0;
        
        if (queryArray.length > 0)
        {
            newsType = Integer.parseInt(queryArray[0]);
        }
        
        if (newsType > 2)
        {
            newsType = 0;
        }
        
        int pageIndex = 0;
        
        if (queryArray.length > 1)
        {
            pageIndex = Integer.parseInt(queryArray[1]);
        }
        
        map.addAttribute("page_index", pageIndex);
        
        Page<News> newsPage = null;
        
        if (0 == newsType)
        {
            newsPage = newsService.findByType("手机资讯", pageIndex, ClientConstant.pageSize, 
                                                            "desc", "id");
        }
        else if (1 == newsType)
        {
            newsPage = newsService.findByType("手机发烧友", pageIndex, ClientConstant.pageSize, 
                                                            "desc", "id");
        }
        else
        {
            newsPage = newsService.findByType("新闻视频", pageIndex, ClientConstant.pageSize, 
                                                            "desc", "id");
        }

        if (null != newsPage)
        {
            map.addAttribute("news_list", newsPage.getContent());
        }
        
        map.addAttribute("news_type", newsType);
        map.addAttribute("page_index", pageIndex);
        
        return "/front/news";
    }
	
	@RequestMapping("/content/{id}")
    public String detail(@PathVariable Long id, ModelMap map){
        // 导航栏
        List<ProductType> rptList = productTypeService.findByParent("");
        
        map.addAttribute("root_type_list", rptList);
        
        for (ProductType pType : rptList)
        {
            if (pType.getName().equals("手机"))
            {
                List<Brand> brandList = brandService.findByType(pType.getName());
                
                if (null != brandList)
                {
                    for (int i=0; i < brandList.size(); i++)
                    {
                        if (brandList.get(i).getName().contains("苹果"))
                        {
                            map.addAttribute("apple_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("小米"))
                        {
                            map.addAttribute("mi_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("华为"))
                        {
                            map.addAttribute("huawei_index", i + 1);
                        }
                        
                        if (brandList.get(i).getName().contains("联想"))
                        {
                            map.addAttribute("lenovo_index", i + 1);
                        }
                    }
                }
                map.addAttribute("phone_type", pType);
            }
            else if (pType.getName().equals("手机配件"))
            {
                List<ProductType> ptList = productTypeService.findByParent("手机配件");
                
                map.addAttribute("accessory_sub_type_list", ptList);
                map.addAttribute("phone_accessory_type", pType);
            }
            else if (pType.getName().equals("靓号中心"))
            {
                map.addAttribute("phone_number_type", pType);
            }
        }
        
        map.addAttribute("second_hand_phone_type", productTypeService.findByName("二手手机"));
        
        // 导航栏结束
        
        // 页脚数据
        List<SiteInfo> infoList = siteInfoService.findByType("帮助中心");
        
        map.addAttribute("help_info_list", infoList);
        
        infoList = siteInfoService.findByType("支付配送");
        
        map.addAttribute("delivery_info_list", infoList);
        
        infoList = siteInfoService.findByType("售后服务");
        
        map.addAttribute("service_info_list", infoList);
        
        infoList = siteInfoService.findByType("关于荣诚");
        
        map.addAttribute("about_info_list", infoList);
        
        infoList = siteInfoService.findByType("免费热线电话");
        
        map.addAttribute("phone_info_list", infoList);
        // 页脚数据结束
        
        if (null == id)
        {
            return "error404";
        }
        
        News news = newsService.findOne(id);
        
        int newsType = 0;
        
        if (news.getType().equals("手机资讯"))
        {
            newsType = 0;
        }
        else if (news.getType().equals("手机发烧友"))
        {
            newsType = 1;
        }
        else
        {
            newsType = 2;
        }
        
        map.addAttribute("news", news);
        map.addAttribute("news_type", newsType);
        
        return "/front/news_content";
    }
}
