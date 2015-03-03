package com.ynyes.rongcheng.service;

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

import com.ynyes.rongcheng.entity.Brand;
import com.ynyes.rongcheng.repository.BrandRepo;
import com.ynyes.rongcheng.util.ImageUtil;

/**
 * 品牌服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class BrandService {
    @Autowired
    BrandRepo repository;
    
    /**
     * 通过名称查找品牌
     * 
     * @param type 品牌类型
     * @return 品牌列表
     */
    public Brand findByName(String name)
    {
        if (null == name)
        {
            return null;
        }
        
        return repository.findByName(name);
    }
    
    /**
     * 通过类型查找品牌
     * 
     * @param type 品牌类型
     * @return 品牌列表
     */
    public List<Brand> findByType(String type)
    {
        List<Brand> brandList = null;
        
        if (null == type)
        {
            return null;
        }
        
        brandList = repository.findByTypeContaining("[" + type + "]");
        
        return brandList;
    }
    
    /**
     * 通过类型查找品牌并分页
     * 
     * @param type 品牌类型
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return
     */
    public Page<Brand> findByType(String type,
                            int page, int size, 
                            String direction, String property)
    {
        Page<Brand> brandPage = null;
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
        
        brandPage = repository.findByTypeContaining("[" + type + "]", pageRequest);
        
        return brandPage;
    }
    
    /**
     * 查找推荐的品牌
     * 
     * @param type 品牌类型
     * @return 品牌列表
     */
    public List<Brand> findRecommendByType(String type)
    {
        List<Brand> brandList = null;
        
        if (null == type)
        {
            return null;
        }
        
        brandList = repository.findByTypeContainingAndIsRecommendTrue(type);
        
        return brandList;
    }
    
    /**
     * 
     * 根据类型查找推荐的品牌并分页
     * 
     * @param type 品牌类型
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return
     */
    public Page<Brand> findRecommendByType(String type,
                            int page, int size, 
                            String direction, String property)
    {
        Page<Brand> brandPage = null;
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
        
        brandPage = repository.findByTypeContainingAndIsRecommendTrue(type, pageRequest);
        
        return brandPage;
    }
    
    /**
     * 查找所有品牌并分页
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 当前页面的品牌
     */
    public Page<Brand> findAll(int page, int size, String direction, String property)
    {
        Page<Brand> brandPage = null;
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
        
        brandPage = repository.findAll(pageRequest);
        
        return brandPage;
    }
    
    /**
     * 删除品牌
     * 
     * @param id 品牌ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除品牌
     * 
     * @param brand 商品
     */
    public void delete(Brand brand)
    {
        if (null != brand)
        {
            repository.delete(brand);
        }
    }
    
    /**
     * 查找品牌
     * 
     * @param id 品牌ID
     * @return
     */
    public Brand findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    /**
     * 保存品牌
     * 
     * @param brand 品牌
     * @Param logoPic 品牌图片
     * @return 保存的品牌，错误时返回NULL
     */
    public Brand save(Brand brand, MultipartFile logoPic)
    {
        if (null == brand)
        {
            return null;
        }
        
        String typeStr = brand.getType();
        
        if (null != typeStr)
        {
            String newTypeStr = "";
            String[] typeSplit = typeStr.split(",");
            
            for (String type : typeSplit)
            {
                if (null != type && !"".equals(type))
                {
                    newTypeStr += "[" + type + "],";
                }
            }
            brand.setType(newTypeStr);
        }
        
        if (null != logoPic)
        {
            Map<String, String> uploadRes = ImageUtil.upload(logoPic);
            
            // 成功
            if ("0".equals(uploadRes.get("code"))) {
                // 保存uri
                brand.setLogoUri(uploadRes.get("message"));
            } 
            else // 失败
            {
                return null;
            }
        }
        
        if (null == brand.getId())
        {
            brand.setCreateTime(new Date());
        }
        
        if (null == brand.getIsRecommend())
        {
            brand.setIsRecommend(false);
        }
        
        return repository.save(brand);
    }
}
