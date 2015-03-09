package com.ynyes.rongcheng.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductCombination;
import com.ynyes.rongcheng.entity.ProductParameter;
import com.ynyes.rongcheng.entity.ProductType;
import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.repository.ProductRepo;
import com.ynyes.rongcheng.util.ImageUtil;

/**
 * 商品服务类
 * 
 * @author Sharon
 */

@Service
@Transactional
public class ProductService {
    @Autowired
    ProductRepo repository;
    
    @Autowired
    ProductTypeService productTypeService;
    
    @Autowired
    ProductCombinationService productCombinationService;
    
    @Autowired
    ProductVersionService productVersionService;
    
    @Autowired
    ProductParameterService productParameterService;
    
    /**
     * 根据类型获取商品，并进行分页
     * 
     * @param type 商品类型名
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findByType(String type,
                                        int page,
                                        int size,
                                        String direction,
                                        String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (null == type)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        productPage = repository.findByTypeAllLikeAndIsOnSaleTrue("%[" + type.trim() + "]%", pageRequest);
        
        return productPage;
    }
    
    /**
     * 根据类型、品牌、价格区间及参数组合查找商品
     * 
     * @param type 商品类型
     * @param brandName 品牌
     * @param priceLow 价格低值
     * @param priceHigh 价格高值
     * @param page 页号
     * @param size 页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序字段名
     * @param paramValues 参数值列表
     * @return 商品分页
     */
    public Page<Product> findByTypeAndBrandNameAndPriceAndParameters(String type,
                                    String brandName,
                                    Double priceLow,
                                    Double priceHigh,
                                    int page,
                                    int size,
                                    String direction,
                                    String property,
                                    String... paramValues)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (null == type)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        if (null == paramValues)
        {
            return null;
        }
        
        String paramValue = "%";
        
        for (String param : paramValues)
        {
            if (null != param)
            {
                paramValue += "%[" + param.trim() + "]%";
            }
        }
        
        if (null == priceLow || null == priceHigh)
        {
            if (null == brandName || "".equals(brandName))
            {
                productPage = repository.findByTypeAllLikeAndParamValueAllLikeAndIsOnSaleTrue("%[" + type.trim() + "]%", 
                        paramValue, 
                        pageRequest);
            }
            else
            {
                productPage = repository.findByTypeAllLikeAndBrandNameAndParamValueAllLikeAndIsOnSaleTrue("%[" + type.trim() + "]%", 
                        brandName, 
                        paramValue, 
                        pageRequest);
            }
        }
        else
        {
            if (null == brandName || "".equals(brandName))
            {
                productPage = repository.findByTypeAllLikeAndParamValueAllLikeAndPriceMinimumBetweenAndIsOnSaleTrue("%[" + type.trim() + "]%", 
                                                                                                    paramValue,
                                                                                                    priceLow, 
                                                                                                    priceHigh, 
                                                                                                    pageRequest);
            }
            else
            {
                productPage = repository.findByTypeAllLikeAndBrandNameAndParamValueAllLikeAndPriceMinimumBetweenAndIsOnSaleTrue("%[" + type.trim() + "]%", 
                                                                                                brandName, 
                                                                                                paramValue,
                                                                                                priceLow, 
                                                                                                priceHigh, 
                                                                                                pageRequest);
            }
        }
        
        return productPage;
    }
    
    /**
     * 根据类型获取商品
     * 
     * @param type 类型名称
     * @return 商品列表
     */
    public List<Product> findByType(String type) 
    {
        List<Product> productList = null;

        if (null == type) {
            return null;
        }

        productList = repository.findByTypeAllLikeAndIsOnSaleTrue("%[" + type.trim() + "]%");

        return productList;
    }
    
    /**
     * 根据类型获取商品ID
     * 
     * @param type 类型名称
     * @return 商品列表
     */
    public List<Long> findIdByType(String type) 
    {
        List<Long> idList = null;

        if (null == type) {
            return null;
        }

        idList = repository.findIdByTypeAllLikeAndIsOnSaleTrue("%[" + type.trim() + "]%");

        return idList;
    }
    
    /**
     * 获取所有商品，并分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表分页
     */
    public Page<Product> findAll(int page,
                                int size,
                                String direction,
                                String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        productPage = repository.findAll(pageRequest);
        
        return productPage;
    }
    
    /**
     * 获取限时抢购商品，并进行分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findFlashSale(int page,
                                        int size,
                                        String direction,
                                        String property)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        Date current = new Date();
        
        productPage = repository.findByIsOnSaleTrueAndIsFlashSaleTrueAndFlashSaleStopTimeAfter(current, pageRequest);
        
        return productPage;
    }
    
    /**
     * 获取明星产品，并进行分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 商品列表
     */
    public Page<Product> findStar(int page,
                                        int size,
                                        String direction,
                                        String property,
                                        Double priceLow,
                                        Double priceHigh)
    {
        Page<Product> productPage = null;
        PageRequest pageRequest = null;
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            pageRequest = new PageRequest(page, size);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, 
                                 property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        if (null == priceLow || null == priceHigh)
        {
            productPage = repository.findByIsOnSaleTrueAndIsStarProductTrue(pageRequest);
        }
        else
        {
            productPage = repository.findByIsOnSaleTrueAndIsStarProductTrueAndPriceMinimumBetween(pageRequest, priceLow, priceHigh);
        }
        
        return productPage;
    }
    
    /**
     * 查找商品
     * 
     * @param pid 商品ID
     * @return 找到的商品，未找到时返回NULL
     */
    public Product findOne(Long pid)
    {
        Product p = null;
        
        if (null == pid)
        {
            return null;
        }
        
        p = repository.findOne(pid);
        
        if (null == p)
        {
            return null;
        }
        
        if (null == p.getCombinationList())
        {
            return p;
        }
        
        // 重新填充combinationList
//        for (ProductCombination pc : p.getCombinationList())
//        {
//            if (null != pc.getPid() && null != pc.getVid())
//            {
//                Product related = repository.findOne(pc.getPid());
//                
//                // 设置价格
//                for (ProductVersion ver : related.getVersionList())
//                {
//                    if (ver.getId().equals(pc.getVid()))
//                    {
//                        pc.setProductPrice(ver.getSalePrice());
//                        pc.setProductName(related.getName());
//                        pc.setProductCoverImageUri(related.getCoverImageUri());
//                        pc.setProductBrief(related.getBrief());
//                        pc.setProductType(related.getType());
//                    }
//                }
//            }
//        }
        
        return p;
    }
    
    /**
     * 保存商品
     * @param product 商品
     * @param coverImage 封面图片
     * @param pictures 展示图片
     * @param type 商品类型
     * @param combiList 组合商品列表
     * @param versionList 版本列表
     * @param paramList 参数列表
     * @param flashStartTime 限时抢购开始时间
     * @param flashEndTime 限时抢购结束时间
     * @return
     */
    public Product save(Product product, 
                    MultipartFile coverImage,
                    MultipartFile[] pictures,
                    ProductType type, 
                    List<ProductCombination> combiList,
                    List<ProductVersion> versionList,
                    List<ProductParameter> paramList,
                    String flashStartTime,
                    String flashEndTime)
    {
        if (null == product)
        {
            return null;
        }
        
        // 设置封面图片
        if (null != coverImage)
        {
            Map<String, String> uploadRes = ImageUtil.upload(coverImage);
    
            // 成功
            if ("0".equals(uploadRes.get("code"))) {
                // 保存uri
                product.setCoverImageUri(uploadRes.get("message"));
                product.setCoverImageHeight(Double.parseDouble(uploadRes.get("height")));
                product.setCoverImageWidth(Double.parseDouble(uploadRes.get("width")));
            } 
            else // 失败
            {
                return null;
            }
        }
        
        // 设置展示图片
        if (null != pictures)
        {
            String showPics = "";
            
            for (MultipartFile pic : pictures)
            {
                Map<String, String> uploadRes = ImageUtil.upload(pic);
    
                // 成功
                if ("0".equals(uploadRes.get("code"))) {
                    // 保存uri
                    showPics += uploadRes.get("message");
                    showPics += ",";
                } 
                else // 失败
                {
                    return null;
                }
            }
            
            product.setShowPictures(showPics);
        }
        
        // 设置类型
        if (null != type)
        {
            product.setType(type.getName());
            
            String typeAll = "";
            
            while (null != type)
            {
                typeAll = "[" + type.getName() + "]," + typeAll;
                
                type = productTypeService.findByName(type.getParent());
            }
            
            product.setTypeAll(typeAll);
        }
        
        // 设置商品组合
        if (null != combiList)
        {
            product.setCombinationList(combiList);
            productCombinationService.save(combiList);
        }
        
        // 设置版本
        if (null != versionList && versionList.size() > 0)
        {
            product.setVersionList(versionList);
            productVersionService.save(versionList);
            
            Double priceMinimum = versionList.get(0).getSalePrice();
            Long priceMinimumVid = versionList.get(0).getId();
            Double priceMinimumMarketPrice = versionList.get(0).getMarketPrice();
            
            for (ProductVersion ver : versionList)
            {
                if (ver.getSalePrice() < priceMinimum)
                {
                    priceMinimum = ver.getSalePrice();
                    priceMinimumVid = ver.getId();
                    priceMinimumMarketPrice = ver.getMarketPrice();
                }
            }
            
            product.setPriceMinimum(priceMinimum);
            product.setPriceMinimumVid(priceMinimumVid);
            product.setPriceMinimumMarketPrice(priceMinimumMarketPrice);
        }
        
        // 设置参数
        if (null != paramList)
        {
            product.setParamList(paramList);
            productParameterService.save(paramList);
            
            String paramAll = "";
            
            for (ProductParameter pp : paramList)
            {
                if (null != pp.getValue())
                {
                    for (String value : pp.getValue().split(";"))
                    {
                        if (null != value && !"".equals(value))
                        {
                            paramAll += "[";
                            paramAll += value.trim();
                            paramAll += "];";
                        }
                    }
                }
            }
            
            product.setParamValueAll(paramAll);
        }
        
        // 设置限时抢购时间
        if (null != product.getIsFlashSale() && product.getIsFlashSale() 
                && null != flashStartTime && null != flashEndTime)
        {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            try {
                Date date = sdf.parse(flashStartTime);
                product.setFlashSaleStartTime(date);
                
                date = sdf.parse(flashEndTime);
                product.setFlashSaleStopTime(date);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        else
        {
            product.setIsFlashSale(false);
        }
        
        if (null == product.getIsStarProduct())
        {
            product.setIsStarProduct(false);
        }
        
        if (null == product.getBrandName())
        {
            product.setBrandName("");
        }
        
        if (null == product.getParamValueAll())
        {
            product.setParamValueAll("");
        }
        
        if (null == product.getId())
        {
            product.setIsOnSale(true);
            product.setCreateTime(new Date());
            product.setSoldNumber(0L);
            product.setMondayVisitNumber(0L);
            product.setTuesdayVisitNumber(0L);
            product.setWednesdayVisitNumber(0L);
            product.setThursdayVisitNumber(0L);
            product.setFridayVisitNumber(0L);
            product.setSaturdayVisitNumber(0L);
            product.setSundayVisitNumber(0L);
        }
        
        return repository.save(product);
    }
    
    /**
     * 删除商品
     * 
     * @param id 商品ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除商品
     * @param product 商品
     */
    public void delete(Product product)
    {
        if (null != product)
        {
            repository.delete(product);
        }
    }
}
