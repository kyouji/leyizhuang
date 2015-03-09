package com.ynyes.rongcheng.service;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.ynyes.rongcheng.entity.News;
import com.ynyes.rongcheng.repository.NewsRepo;
import com.ynyes.rongcheng.util.ImageUtil;

/**
 * 资讯服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class NewsService {
    @Autowired
    NewsRepo repository;
    
    /**
     * 保存资讯
     * 
     * @param news 资讯
     * @param pic  资讯封面图片
     * @return 保存的资讯
     */
    public News save(News news, MultipartFile pic){
        if (null == news)
        {
            return null;
        }
        
        if (null != pic && !pic.isEmpty())
        {
            Map<String, String> uploadRes = ImageUtil.upload(pic);
            
            // 成功
            if ("0".equals(uploadRes.get("code"))) {
                // 保存uri
                news.setCoverImageUri(uploadRes.get("message"));
            } 
            else // 失败
            {
                return null;
            }
        }
        
        if (null == news.getId())
        {
            news.setCreateTime(new Date());
        }
        
        if (null == news.getClickNumber())
        {
            news.setClickNumber(0L);
        }
        
        if (null == news.getIsShow())
        {
            news.setIsShow(false);
        }
        
        return repository.save(news);
    }
  
 
    /**
     * 获取资讯
     * 
     * @param id 资讯ID
     * @return 获取到的资讯
     */
    public News findOne(Long id)
    {
        News news= null;
        
        if (null != id)
        {
            news = repository.findOne(id);
        }
        
        return news;
    }
    
    /**
     * 查找所有资讯
     * 
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 获取到的资讯页面
     */
    public Page<News> findAll(int page, int size, 
                            String direction, String property)
    {
        Page<News> newsPage = null;
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
        
        newsPage = repository.findAll(pageRequest);
        
        return newsPage;
    }
    
    /**
     * 通过类型获取资讯列表
     * 
     * @param type 类型名称
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return 获取到的资讯页面
     */
    public Page<News> findByType(String type,
                            int page, int size, 
                            String direction, String property)
    {
        Page<News> newsPage = null;
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
        
        if (null != type)
        {
            newsPage = repository.findByTypeAndIsShowTrue(type, pageRequest);
        }
        
        return newsPage;
    }
    
    /**
     * 删除
     * 
     * @param id 资讯ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除
     * 
     * @param news 资讯
     */
    public void delete(News news)
    {
        if (null != news)
        {
            repository.delete(news);
        }
    }
}
