package com.ynyes.rongcheng.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ProductComment;
import com.ynyes.rongcheng.repository.ProductCommentRepo;

/**
 * 商品评论服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ProductCommentService {
    @Autowired
    ProductCommentRepo repository;
    
    /**
     * 新增商品评论
     * 
     * @param username 用户名
     * @param starCount 星级，取值为1~5
     * @param tags 标签，多个标签以逗号隔开
     * @param content 评论内容
     * @param productId 评论的商品ID
     * @param productVersionId 评论的商品的版本ID
     * 
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     *         map.data 成功时将返回保存后的订单
     */
    public Map<String, Object> add(String username,
                                   Long starCount,
                                   String tags,
                                   String content,
                                   Long productId,
                                   Long productVersionId)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || "".equals(username))
        {
            map.put("message", "用户名不能为空");
            return map;
        }
        
        ProductComment comment = new ProductComment();
        
        comment.setUsername(username);
        comment.setStars(starCount);
        comment.setTags(tags);
        comment.setContent(content);
        comment.setPid(productId);
        comment.setVid(productVersionId);
        comment.setCommentTime(new Date());
        
        map.put("code", 0);
        map.put("data", repository.save(comment));

        return map;
    }
    
    /**
     * 获取指定商品版本的所有评论
     * 
     * @param pid 商品ID
     * @param vid 商品版本ID
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向 asc:升序 desc:降序，为NULL时按默认规则排序
     * @param property 排序的字段名，为NULL时按默认规则排序
     * 
     * @return 商品评论列表分页
     */
    public Page<ProductComment> findByPidAndVid(Long pid,
                                                Long vid,
                                                int page,
                                                int size,
                                                String direction,
                                                String property)
    {
        Page<ProductComment> commentPage = null;
        PageRequest pageRequest = null;
        
        if (null == pid || null == vid)
        {
            return null;
        }
        
        if (page < 0 || size < 0)
        {
            return null;
        }
        
        if (null == direction || null == property)
        {
            Sort sort = new Sort(Direction.DESC, "id");
            pageRequest = new PageRequest(page, size, sort);
        }
        else
        {
            Sort sort = new Sort(direction.equalsIgnoreCase("asc") ? Direction.ASC : Direction.DESC, property);
            pageRequest = new PageRequest(page, size, sort);
        }
        
        commentPage = repository.findByPidAndVid(pid, vid, pageRequest);
        
        return commentPage;
    }
    
    /**
     * 删除评论
     * 
     * @param id 评论ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除评论
     * 
     * @param comment 评论
     */
    public void delete(ProductComment comment)
    {
        if (null != comment)
        {
            repository.delete(comment);
        }
    }
    
    /**
     * 查找评论
     * 
     * @param id 评论ID
     * @return
     */
    public ProductComment findOne(Long id)
    {
        if (null == id)
        {
            return null;
        }
        
        return repository.findOne(id);
    }
    
    /**
     * 保存评论
     * 
     * @param comment 评论
     * @return 保存的评论，错误时返回NULL
     */
    public ProductComment save(ProductComment comment)
    {
        if (null == comment)
        {
            return null;
        }
        
        return repository.save(comment);
    }
}
