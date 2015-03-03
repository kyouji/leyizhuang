package com.ynyes.rongcheng.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Advertisement;
import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.service.AdvertisementService;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ProductService;

/**
 * 前端首页控制
 * 
 * IndexController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午9:45:13 <BR>
 * @version 1.0.0
 *
 */
@Controller
@RequestMapping("/")
public class IndexController {
    @Autowired
    BrandService brandService;
    
    @Autowired
    AdvertisementService advertisementService;
    
    @Autowired
    ProductService productService;
    
    /**
     * 
     * 前台首页跳转<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-上午9:50:50 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping
    public String index(HttpServletRequest request, ModelMap map){
        
        Page<Brand> brandPage = brandService.findByIsRecommendTrue(0, 9, null, null);
        
        if (null != brandPage)
        {
            // 推荐品牌
            map.addAttribute("recommend_brand_list", brandPage.getContent());
        }
        
        Page<Advertisement> adPage = advertisementService.findByType("首页大图广告(1920px*430px)", 0, 1, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            // banner广告
            map.addAttribute("banner_ad", adPage.getContent().get(0));
        }
        
        // 限时抢购商品
        Page<Product> productPage = productService.findFlashSale(0, 2, "desc", "id");
        
        if (null != productPage)
        {
            map.addAttribute("flash_sale_product_list", productPage.getContent());
        }
        
        // 明星产品
        productPage = productService.findStar(0, 6, "desc", "id");
        
        if (null != productPage)
        {
            map.addAttribute("star_product_list", productPage.getContent());
        }
        
        return "/front/index";
    }
    
   
}
