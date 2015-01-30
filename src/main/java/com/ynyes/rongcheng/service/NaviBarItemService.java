package com.ynyes.rongcheng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.NaviBarItem;
import com.ynyes.rongcheng.repository.NaviBarItemRepo;

/**
 * 首页横向导航栏服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class NaviBarItemService {
    @Autowired
    NaviBarItemRepo repository;
    
    /**
     * 查找前台显示的导航栏条目
     * 
     * @param type 品牌类型
     * @return 品牌列表
     */
    public List<NaviBarItem> findByIsShowTrue()
    {
        List<NaviBarItem> brandList = null;
        
        brandList = repository.findByIsShowTrue();
        
        return brandList;
    }
    
    /**
     * 查找前台显示的导航栏条目并分页
     * 
     * @param type 品牌类型
     * @param page 页号，从0开始
     * @param size 每页大小
     * @param direction 排序方向，不区分大小写，asc表示升序，desc表示降序，为NULL时不进行排序
     * @param property 排序的字段名，为NULL时不进行排序
     * @return
     */
    public Page<NaviBarItem> findByIsShowTrue(String type,
                            int page, int size, 
                            String direction, String property)
    {
        Page<NaviBarItem> itemPage = null;
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
        
        itemPage = repository.findByIsShowTrue(pageRequest);
        
        return itemPage;
    }
}
