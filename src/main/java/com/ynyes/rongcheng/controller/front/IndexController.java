package com.ynyes.rongcheng.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Advertisement;
import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.service.AdvertisementService;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;

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
    
    @Autowired
    ProductTypeService productTypeService;
    
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
        
        Page<Brand> brandPage = brandService.findByIsRecommendTrue(0, 9, null, null);
        
        if (null != brandPage)
        {
            // 推荐品牌
            map.addAttribute("recommend_brand_list", brandPage.getContent());
        }
        
        Page<Advertisement> adPage = advertisementService.findByType("首页大图广告", 0, 1, null, null);
        
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
        
        // 手机左侧广告
        adPage = advertisementService.findByType("手机左侧大图广告", 0, 1, "desc", "id");
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("phone_left_ad", adPage.getContent().get(0));
        }
        
        // 手机横版广告
        adPage = advertisementService.findByType("手机横版广告", 0, 4, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("phone_ad_list", adPage.getContent());
        }
        
        // 平板左侧广告
        adPage = advertisementService.findByType("平板左侧大图广告", 0, 1, "desc", "id");
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("pad_left_ad", adPage.getContent().get(0));
        }
        
        // 平板横版广告
        adPage = advertisementService.findByType("平板横版广告", 0, 4, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("pad_ad_list", adPage.getContent());
        }
        
        // 手机配件左侧广告
        adPage = advertisementService.findByType("配件左侧大图广告", 0, 1, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("accessory_left_ad", adPage.getContent().get(0));
        }
        
        // 配件大图广告
        adPage = advertisementService.findByType("配件竖版广告", 0, 5, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("accessory_big_ad_list", adPage.getContent());
        }
        
        // 配件小图广告
        adPage = advertisementService.findByType("配件横版广告", 0, 5, null, null);
        
        if (null != adPage && adPage.getContent().size() > 0)
        {
            map.addAttribute("accessory_small_ad_list", adPage.getContent());
        }
        
        // 手机热销排行榜
        Page<Product> phonePage = productService.findByType("手机", 0, 5, "desc", "soldNumber");
        
        if (null != phonePage)
        {
            map.addAttribute("phone_hot_product_list", phonePage.getContent());
        }
        
        // 平板热销排行榜
        Page<Product> padPage = productService.findByType("平板电脑", 0, 5, "desc", "soldNumber");
        
        if (null != padPage)
        {
            map.addAttribute("pad_hot_product_list", padPage.getContent());
        }
        
        Page<ProductType> typePage = productTypeService.findByIsRecommendTrue(0, 6, "desc", "id");
        
        // 推荐类型
        if (null != typePage)
        {
            List<ProductType> rptPageList = typePage.getContent();
            if (rptPageList.size() > 0)
            {
                map.addAttribute("recommend_type_list", typePage.getContent());
                
                for (int i = 0; i < 6 && i < rptPageList.size(); i++)
                {
                    Page<Product> rptProductPage = productService.findByType(rptPageList.get(i).getName(),
                                                    0, 6, "desc", "id");
                    if (null != rptProductPage && rptProductPage.getContent().size() > 0)
                    {
                        map.addAttribute("recommed_type_product_list"+i, rptProductPage.getContent());
                    }
                }
            }
        }
        
        // 靓号商品
        productPage = productService.findByType("靓号中心", 0, 10, "desc", "id");
        
        if (null != productPage && productPage.getContent().size() > 0)
        {
            map.addAttribute("phone_number_list", productPage.getContent());
        }
        
        return "/front/index";
    }
    
}
