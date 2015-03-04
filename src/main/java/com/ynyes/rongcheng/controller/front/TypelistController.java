package com.ynyes.rongcheng.controller.front;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.util.StringUtils;

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
    private ProductService productservice;
    
    @Autowired
    private ProductTypeService productTypeService;
    
    @Autowired
    private BrandService brandService;
    /**
     * 
     * @param queryStr 组成：typeID-brandIndex-[paramIndex]-[销量排序标志]-[价格排序标志]-[上架时间排序标志]-[页号]_[价格低值]-[价格高值]
     * @param page
     * @param size
     * @param direction
     * @param property
     * @param map
     * @return
     */
    @RequestMapping("/list/{queryStr}")
    public String index(@PathVariable String queryStr, ModelMap map){
        
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
        
        if (null == pType)
        {
            return "error404";
        }
        
        // brand_list和param_list将在前端进行显示
        Page<Brand>  brandPage = brandService.findByType(pType.getName(), 0, 10, null, null);
        List<Brand> brandList = null;
        
        if (null != brandPage)
        {
            brandList = brandPage.getContent();
        }
        
        map.addAttribute("brand_list", brandList);
        
        List<Parameter> paramList = productTypeService.findParametersSearchableById(typeId);
        
        map.addAttribute("param_list", paramList);
        
        String brandName = null;
        
        if (queryArray.length > 1)
        {
            Integer index = Integer.parseInt(queryArray[1]);
            
            if (null != index && index.intValue() > 0)
            {
                brandName = brandList.get(index).getName();
            }
        }
        
        if (null != paramList && paramList.size() > 0)
        {
            if (queryArray.length > paramList.size() + 1)
            {
                for (int i=0; i<paramList.size(); i++)
                {
                    Integer index = Integer.parseInt(queryArray[2+i]);
                    if (null != index && index.intValue() > 0)
                    {
                        
                    }
                }
            }
        }
        
        //typeID-brandIndex-[paramIndex]-[销量排序标志]-[价格排序标志]-[上架时间排序标志]-[页号]_[价格低值]-[价格高值]
        
        
        
        // 商品类型逐级分类
        map.addAttribute("type_list", productTypeService.findPredecessors(pType));
        
        brandPage = brandService.findByIsRecommendTrue(0, 9, null, null);
        
        if (null != brandPage)
        {
            // 推荐品牌
            map.addAttribute("recommend_brand_list", brandPage.getContent());
        }
        
        
//        if(property.equals("价格↑")){
//            property="flashSalePrice";
//            }else if(property.equals("上架时间↑") || property=="上架时间↑"){
//                property="onSaleTime";
//            }
//        if(StringUtils.isNotEmpty(typeId) && StringUtils.isNumber(typeId)){
//            if(typeId.equals("1")){
//                return "/front/type_list_star";//明星产品
//            }
//            if(typeId.equals("2")){
//                //根据类型获取所有子类
//                Page<Product> pages=productservice.findByType("2", page, size, direction, property);
//                model.addAttribute("product", pages.getContent());
//                model.addAttribute("count",pages.getTotalElements());
//                return "/front/type_list_mobile";//手机产品
//            }
//            if(typeId.equals("3")){
//                Page<Product> pages=productservice.findByType("3", page, size, direction, property);
//                model.addAttribute("armature", pages.getContent());
//                model.addAttribute("count", pages.getTotalElements());
//                return "/front/type_list_accessories";//手机配件
//            }
//            if(typeId.equals("4")){
//                return "/front/type_list_number";//靓号选择
//            }
//            if(typeId.equals("5")){
//                return "/front/news";//新闻资讯
//            }
//        }else{
//            return "error404";//错误
//        }
        return "/front/type_list";//错误
    }
    /**
     * 
     * 手机产品跳转模版<BR>
     * 方法名：mobile<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月5日-下午3:30:43 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list/{typeId}_")
    public String mobile(@PathVariable String typeId,Integer page,Integer size,String direction,String property,Model model){
            direction="desc";//排序
          if(StringUtils.isNotEmpty(property)){
              if(property.equals("价格↑")||property=="价格↑"){
                  property="priceMinimum";
              }else if(property.equals("上架时间↑") || property=="上架时间↑"){
                  property="onSaleTime";
              }
          }else{
              property="sortNumber"; 
          }
            
                //根据类型获取所有子类
                Page<Product> pages=productservice.findByType("2", page, size, direction, property);
                model.addAttribute("product", pages.getContent());
                model.addAttribute("count", pages.getTotalElements());
           
        return "/front/listtemp/pageProduct";//手机产品
    }
    /**
     * 
     * 手机配件模版<BR>
     * 方法名：accessories<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月7日-下午4:35:57 <BR>
     * @param typeId
     * @param page
     * @param size
     * @param direction
     * @param model
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/list/{typeId}_3")
    public String accessories(@PathVariable String typeId,Integer page,Integer size,String direction,Model model){
        direction="desc";//排序
        String property="sortNumber";//字段
        
        //根据类型获取所有子类
        Page<Product> pages=productservice.findByType("3", page, size, direction, property);
        model.addAttribute("product", pages.getContent());
        model.addAttribute("count", pages.getTotalElements());
        
        return "/front/listtemp/pageProduct";//手机产品
    }
}
