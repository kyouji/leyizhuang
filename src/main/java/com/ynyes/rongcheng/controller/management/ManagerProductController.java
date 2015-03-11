package com.ynyes.rongcheng.controller.management;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductCombination;
import com.ynyes.rongcheng.entity.ProductParameter;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.ProductTypeParameter;
import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.service.BrandService;
import com.ynyes.rongcheng.service.ParameterService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeParameterService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.util.ImageUtil;
import com.ynyes.rongcheng.util.ManagementConstant;

/**
 * 商品管理界面控制器
 * 
 * @author Sharon
 * 
 */
@Controller
@RequestMapping(value = "/admin/product")
public class ManagerProductController {

    @Autowired
    ProductService productService;

    @Autowired
    ProductTypeService productTypeService;

    @Autowired
    ProductTypeParameterService productTypeParameterService;

    @Autowired
    ParameterService parameterService;

    @Autowired
    BrandService brandService;

    /**
     * 商品主界面
     * 
     * @param map
     * @return
     */
    @RequestMapping
    public String product(ModelMap map) {

        Page<Product> productPage = productService.findAll(0,
                ManagementConstant.pageSize, "desc", "id");

        if (null != productPage) {
            map.addAttribute("product_list", productPage.getContent());
        }

        map.addAttribute("product_type_list", productTypeService.findAll());
        map.addAttribute("total", productPage.getTotalElements());

        return "/management/product";
    }

    /**
     * 获取指定页号的商品
     * 
     * @param map
     * @param pageIndex
     *            页号
     * @return
     */
    @RequestMapping(value = "/page/{pageIndex}")
    public String page(ModelMap map, @PathVariable Integer pageIndex) {

        if (null != pageIndex && pageIndex.intValue() >= 0) {
            Page<Product> productPage = productService.findAll(pageIndex,
                    ManagementConstant.pageSize, "desc", "id");

            if (null != productPage) {
                map.addAttribute("product_list", productPage.getContent());
            }
        }

        return "/management/product/tbody";
    }

    @RequestMapping(value = "/modify/{id}", method = RequestMethod.POST)
    public String modify(ModelMap map, @PathVariable Long id) {
        if (null != id) {
            Product product = productService.findOne(id);
            map.addAttribute("product", product);
            map.addAttribute("show_picture_list", product.getShowPictures()
                    .split(","));
            map.addAttribute("product_type_list", productTypeService.findAll());

            if (null != product) {
                ProductType pType = productTypeService.findByName(product
                        .getType());

                List<ProductTypeParameter> tpList = null;
                List<Parameter> paramList = new ArrayList<Parameter>();

                if (null != pType) {
                    tpList = pType.getTypeParamList();

                    map.addAttribute("brand_list",
                            brandService.findByType(pType.getName()));
                }

                if (null != tpList) {
                    for (ProductTypeParameter ptp : tpList) {
                        if (null != ptp.getParamId()) {
                            Parameter p = parameterService.findOne(ptp
                                    .getParamId());

                            if (null != p) {
                                paramList.add(p);
                            }
                        }
                    }
                }
                map.addAttribute("parameter_list", paramList);
            }
        }

        return "/management/product/modify";
    }

    /**
     * 商品属性
     * 
     * @param map
     * @param typeId
     *            商品类型ID
     * @return
     */
    @RequestMapping(value = "/property/{typeId}", method = RequestMethod.GET)
    public String property(ModelMap map, @PathVariable Long typeId) {
        List<ProductTypeParameter> tpList = null;
        List<Parameter> paramList = new ArrayList<Parameter>();

        if (null != typeId) {
            ProductType ptype = productTypeService.findOne(typeId);

            if (null != ptype) {
                tpList = ptype.getTypeParamList();

                map.addAttribute("brand_list",
                        brandService.findByType(ptype.getName()));
            }
        }

        if (null != tpList) {
            for (ProductTypeParameter ptp : tpList) {
                if (null != ptp.getParamId()) {
                    Parameter p = parameterService.findOne(ptp.getParamId());

                    if (null != p) {
                        paramList.add(p);
                    }
                }
            }
        }

        map.addAttribute("parameter_list", paramList);

        return "/management/product/type_parameter_list";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> upload(String dir,
            @RequestParam MultipartFile imgFile) {
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("error", 1);

        if (null == imgFile || imgFile.isEmpty()) {
            res.put("message", "图片不存在");
            return res;
        }

        // 上传封面图片
        Map<String, String> uploadRes = ImageUtil.upload(imgFile);

        // 成功
        if ("0".equals(uploadRes.get("code"))) {
            // 保存uri
            res.put("url", uploadRes.get("message"));
            res.put("error", 0);
        } else // 失败
        {
            res.put("message", "上传图片失败");
            return res;
        }

        return res;
    }

    /**
     * 商品列表
     * 
     * @param map
     * @param typeId
     *            商品类型ID
     * @return
     */
    @RequestMapping(value = "/list/type/{type}", method = RequestMethod.GET)
    @ResponseBody
    public List<Product> list(ModelMap map, @PathVariable String type) {
        List<Product> productList = null;

        if (null != type) {
            productList = productService.findByType(type);
        }

        return productList;
    }

    /**
     * 删除商品
     * 
     * @param map
     * @param productId
     *            商品ID
     * @return
     */
    @RequestMapping(value = "/delete/{productId}", method = RequestMethod.POST)
    @ResponseBody
    public void delete(ModelMap map, @PathVariable Long productId) {

        if (null != productId) {
            productService.delete(productId);
        }
    }

    /**
     * 保存商品
     * 
     * @param product
     *            要保存的商品
     * @return
     */

    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> save(ModelMap map, 
                                    Product product,
                                    Long typeId,
                                    // 参数列表
                                    Long[] paramId,
                                    String[] paramValue,
                                    // 图片
                                    @RequestParam MultipartFile coverImage,
                                    @RequestParam MultipartFile[] pictures,
                                    // 版本列表
                                    String[] versionNames,
                                    String[] versionColors,
                                    String[] versionCapacities,
                                    Double[] versionCostPrices,
                                    Double[] versionMarketPrices,
                                    Double[] versionSalePrices,
                                    Long[] versionLeftNumbers,
                                    // 限时抢购时间
                                    String fsStartDate,
                                    String fsStartTime,
                                    String fsEndDate,
                                    String fsEndTime,
                                    // 组合商品列表
                                    Long[] combPid,
                                    Long[] combVid,
                                    Double[] combPrice){
        Map<String, Object> res = new HashMap<String, Object>();
        res.put("code", 1);
        
        if (null == product)
        {
            res.put("message", "信息有误");
            return res;
        }
        
        if (null == typeId)
        {
            res.put("message", "商品类型不存在");
            return res;
        }
        
        if (null == product.getCoverImageUri() || "".equals(product.getCoverImageUri()))
        {
            if (null == coverImage || coverImage.isEmpty()) {
                res.put("message", "请设置封面图片");
                return res;
            }

            if (null == pictures || pictures.length < 1)
            {
                res.put("message", "请设置展示图片");
                return res;
            }
        }
        
        ProductType productType = productTypeService.findOne(typeId);
        
        List<ProductParameter> productParamList = new ArrayList<ProductParameter>();
        
        if (null != paramId && paramId.length > 0)
        {
            for (int i=0; i < paramId.length; i++)
            {
                Long pmId = paramId[i];
                if (null != pmId)
                {
                    ProductParameter pp = new ProductParameter();
                    Parameter p = parameterService.findOne(pmId);
                    pp.setParamId(p.getId());
                    pp.setParamName(p.getName());
                    
                    if (null != paramValue && paramValue.length > i)
                    {
                        pp.setValue(paramValue[i]);
                    }
                    
                    productParamList.add(pp);
                }
            }
        }
        
        List<ProductVersion> productVersionList = new ArrayList<ProductVersion>();
        
        if (null != versionSalePrices && versionSalePrices.length > 0)
        {
            for (int i=0; i < versionSalePrices.length; i++)
            {
                Double salePrice = versionSalePrices[i];
                
                if (null != salePrice)
                {
                    ProductVersion pv = new ProductVersion();
                    
                    if (null != versionNames && versionNames.length > i)
                    {
                        pv.setName(versionNames[i]);
                    }
                    
                    if (null != versionColors && versionColors.length > i)
                    {
                        pv.setColor(versionColors[i]);
                    }
                    
                    if (null != versionCapacities && versionCapacities.length > i)
                    {
                        pv.setCapacity(versionCapacities[i]);
                    }
                    
                    if (null != versionCostPrices && versionCostPrices.length > i)
                    {
                        pv.setCostPrice(versionCostPrices[i]);
                    }
                    
                    if (null != versionMarketPrices && versionMarketPrices.length > i)
                    {
                        pv.setMarketPrice(versionMarketPrices[i]);
                    }
                    
                    pv.setSalePrice(salePrice);
                    
                    if (null != versionLeftNumbers && versionLeftNumbers.length > i)
                    {
                        pv.setLeftNumber(versionLeftNumbers[i]);
                    }
                    
                    pv.setSoldNumber(0L);
                    
                    productVersionList.add(pv);
                }
            }
        }
        
        List<ProductCombination> productCombiList = new ArrayList<ProductCombination>();
        
        if (null != combPid && combPid.length > 0)
        {
            for (int i=0; i < combPid.length; i++)
            {
                Long cPid = combPid[i];
                if (null != cPid)
                {
                    ProductCombination pc = new ProductCombination();
                    
                    pc.setPid(cPid);
                    
                    if (null != combVid && combVid.length > i)
                    {
                        pc.setVid(combVid[i]);
                    }
                    
                    if (null != combPrice && combPrice.length > i)
                    {
                        pc.setCombinationPrice(combPrice[i]);
                    }
                    
                    productCombiList.add(pc);
                }
            }
        }
        
        if (null == productService.save(product, 
                            coverImage,
                            pictures,
                            productType, 
                            productCombiList, 
                            productVersionList, 
                            productParamList, 
                            fsStartDate + " " + fsStartTime, 
                            fsEndDate + " " + fsEndTime))
        {
            res.put("message", "保存商品出错");
            return res;
        }
        
        res.put("code", 0);
        
        return res;
    }    /**
     * 存在id字段时先查找出对应的实体
     * 
     * @param id
     * @param model
     */
    @ModelAttribute
    public void getModel(@RequestParam(value = "id", required = false) Long id,
            Model model) {
        if (id != null) {
            model.addAttribute("product", productService.findOne(id));
        }
    }
}
