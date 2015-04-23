package com.ynyes.rongcheng.controller.front;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.SiteInfo;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.service.SiteInfoService;
import com.ynyes.rongcheng.util.ClientConstant;

/**
 * 商品类型集合
 * 
 * TypelistController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午10:10:58 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class TypelistController {
    @Autowired
    private ProductService productService;
    
    @Autowired
    private ProductTypeService productTypeService;
    
    @Autowired
    private BrandService brandService;
    
    @Autowired
    private SiteInfoService siteInfoService;
    
    /**
     * 返回商品列表
     * 
     * @author Sharon
     * 
     * @param queryStr 组成：typeID-brandIndex-[paramIndex]-[排序字段]-[销量排序标志]-[价格排序标志]-[上架时间排序标志]-[页号]_[价格低值]-[价格高值]
     * @param page
     * @param size
     * @param direction
     * @param property
     * @param map
     * @return
     */
    @RequestMapping("/lists/{queryStr}")
    public String list(@PathVariable String queryStr, ModelMap map){
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
        
        if (null == queryStr || "".equals(queryStr))
        {
            return "error404";
        }
        
        Double priceLow = null;
        Double priceHigh = null;
        
        if (queryStr.contains("_")) // 包含价格最大最小值
        {
            String[] queryStrArray = queryStr.split("_");
            
            if (queryStrArray.length > 0)
            {
                queryStr = queryStrArray[0];
            }
            
            if (queryStrArray.length > 1)
            {
                String[] priceStr = queryStrArray[1].split("-");
                
                // 取得价格高低值
                if (priceStr.length > 1)
                {
                    priceLow = Double.parseDouble(priceStr[0]);
                    priceHigh = Double.parseDouble(priceStr[1]);
                    
                    map.addAttribute("price_low", priceLow);
                    map.addAttribute("price_high", priceHigh);
                }
            }
        }
        
        String[] queryArray = queryStr.split("-");
        
        if (queryArray.length <= 0)
        {
            return "error404";
        }
        
        Long typeId = Long.parseLong(queryArray[0]);
        
        if (null == typeId)
        {
            return "error404";
        }
        
        ProductType pType = null;
        
        if (null != typeId)
        {
            pType = productTypeService.findOne(typeId);
        }
        
        map.addAttribute("type", pType);
        
        if (null == pType)
        {
            return "error404";
        }
        
        // brand_list和param_list将在前端进行显示
        map.addAttribute("phone_type", productTypeService.findByName("手机"));
        Page<Brand> brandPage = brandService.findByType("手机", 0, 9, null, null);
        List<Brand> brandList = null;
        
        if (null != brandPage && brandPage.getContent().size() > 0)
        {
            brandList = brandPage.getContent();
        }
        
        map.addAttribute("brand_list", brandList);
        
        List<Parameter> paramList = productTypeService.findParametersSearchableById(typeId);
        
        map.addAttribute("param_list", paramList);
        
        String brandName = null;
        
        map.addAttribute("brandIndex", 0);
        
        if (queryArray.length > 1)
        {
            Integer brandIndex = Integer.parseInt(queryArray[1]);
            
            if (null != brandIndex && brandIndex.intValue() > 0)
            {
                brandName = brandList.get(brandIndex-1).getName();
                map.addAttribute("brandIndex", brandIndex);
            }
        }
      
        List<String> paramValueList = new ArrayList<String>();
        
        int paramListLength = 0;
        
        if (null != paramList && paramList.size() > 0)
        {
            paramListLength = paramList.size();
        }
        
        List<Integer> paramIndexList = new ArrayList<Integer>();
        
        if (paramListLength > 0)
        {
            if (queryArray.length > paramListLength + 1)
            {
                // 遍历所有参数，i是参数的位置号
                for (int i=0; i<paramListLength; i++)
                {
                    // index是参数值的位置号
                    Integer index = Integer.parseInt(queryArray[2+i]);
                    
                    if (null == index)
                    {
                        index = 0;
                    }
                    
                    paramIndexList.add(index);
                    
                    if (index.intValue() > 0)
                    {
                        String[] values = paramList.get(i).getValueList().split(",");
                        
                        if (null != values && values.length > index)
                        {
                            paramValueList.add(values[index-1]);
                        }
                    }
                }
            }
        }
        
        map.addAttribute("param_index_list", paramIndexList);
        
        // 0:按销量排序 1:价格排序 2:上架时间排序
        Integer sortType = null;
        
        if (queryArray.length > paramListLength + 2)
        {
            sortType = Integer.parseInt(queryArray[paramListLength + 2]);
        }
        
        if (null == sortType || sortType.intValue() > 2)
        {
            sortType = 0;
        }
        
        map.addAttribute("sort_type", sortType);
        
        String direction = "desc";
        String property = "soldNumber";
        
        map.addAttribute("price_direction", 0);
        
        if (null != sortType)
        {
            if (sortType.equals(0))
            {
                
            }
            // 只有价格排序会区分升降序
            else if (sortType.equals(1))
            {
                if (queryArray.length > paramListLength + 4)
                {
                    Integer dirFlag = Integer.parseInt(queryArray[paramListLength + 4]);
                    
                    // 1:升序  0:降序
                    if (null != dirFlag && dirFlag.equals(1))
                    {
                        direction = "asc";
                        map.addAttribute("price_direction", 1);
                    }
                }
                
                property = "priceMinimum";
            }
            else
            {
                property = "onSaleTime";
            }
        }
        
        int pageIndex = 0;
        
        if (queryArray.length > paramListLength + 6)
        {
            pageIndex = Integer.parseInt(queryArray[paramListLength + 6]);
        }
        
        map.addAttribute("page_index", pageIndex);
        
        Page<Product> productPage = productService.findByTypeAndBrandNameAndPriceAndParameters(pType.getName(), 
                                                            brandName, priceLow, priceHigh, 
                                                            pageIndex, ClientConstant.pageSize, 
                                                            direction, property, 
                                                            paramValueList.toArray(new String[0]));
        
        if (null != productPage)
        {
            map.addAttribute("count", productPage.getTotalElements());
            map.addAttribute("product_list", productPage.getContent());
            map.addAttribute("page_total", productPage.getTotalPages());
        }
        
        // 热销排行
        productPage = productService.findByType(pType.getName(), 0, 10, "desc", "soldNumber");
        
        if (null != productPage)
        {
            map.addAttribute("hot_product_list", productPage.getContent());
        }
        
        // 商品类型逐级分类
        map.addAttribute("type_list", productTypeService.findPredecessors(pType));
        
        brandPage = brandService.findByIsRecommendTrue(0, 9, null, null);
        
        if (null != brandPage)
        {
            // 推荐品牌
            map.addAttribute("recommend_brand_list", brandPage.getContent());
        }
        
        return "/front/type_list";//错误
    }
}
