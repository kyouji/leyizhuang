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

import com.ynyes.rongcheng.entity.Advertisement;
import com.ynyes.rongcheng.repository.AdvertisementRepo;
import com.ynyes.rongcheng.util.ImageUtil;

/**
 * 广告服务类
 * @author Sharon
 *
 */

@Service
@Transactional
public class AdvertisementService {
    @Autowired
    AdvertisementRepo repository;
 
    /**
     * 删除广告
     * 
     * @param ad 广告
     */
    public void delete(Advertisement ad){
        repository.delete(ad); 
    }
    
    /**
     * 删除广告
     * 
     * @param id 广告ID
     */
    public void delete(Long id){
        repository.delete(id);
    }

    /**
     * 查找广告
     * 
     * @param id 广告类型ID
     * @return
     */
    public Advertisement findOne(Long id){
        return repository.findOne(id);
    }

    /**
     * 查找所有广告
     * 
     * @return 广告列表
     */
    public List<Advertisement> findAll(){
        return (List<Advertisement>) repository.findAll();
    }
    
    /**
     * 查找所有广告
     * 
     * @param page 页号
     * @param size 页大小
     * @param direction 排序方向 ASC升序 DESC降序
     * @param property 排序字段
     * @return 广告分页
     */
    public Page<Advertisement> findAll(int page, int size, String direction, String property)
    {
        PageRequest pageRequest = null;
        
        if (null != direction && null != property)
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        else
        {
            pageRequest = new PageRequest(page, size);
        }
        
        return repository.findAll(pageRequest);
    }
    
    /**
     * 按类型名查找广告
     * 
     * @param type 类型名
     * @param page 页号
     * @param size 页大小
     * @param direction 排序方向 ASC升序 DESC降序
     * @param property 排序字段
     * @return 广告分页
     */
    public Page<Advertisement> findByType(String type, 
                                          int page, int size, 
                                          String direction, String property)
    {
        PageRequest pageRequest = null;
        
        if (null == type)
        {
            return null;
        }
        
        if (null != direction && null != property)
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        else
        {
            pageRequest = new PageRequest(page, size);
        }
        
        return repository.findByTypeAndIsShowTrue(type, pageRequest);
    }
 
    /**
     * 保存广告
     * 
     * @param ad 广告
     * @param pic 广告图片 
     */
    public Advertisement save(Advertisement ad, MultipartFile pic){
        if (null == ad)
        {
            return null;
        }
        
        if (null != pic && !pic.isEmpty())
        {
            Map<String, String> uploadRes = ImageUtil.upload(pic);
            
            // 成功
            if ("0".equals(uploadRes.get("code"))) {
                // 保存uri
                ad.setImageUri(uploadRes.get("message"));
            } 
            else // 失败
            {
                return null;
            }
        }
        
        if (null == ad.getId())
        {
            ad.setCreateTime(new Date());
            
            ad.setIsShow(true);
        }
        
        if (null == ad.getClickNumber())
        {
            ad.setClickNumber(0L);
        }
        
        if (null == ad.getViewNumber())
        {
            ad.setViewNumber(0L);
        }
        
        return repository.save(ad);
    }
}
