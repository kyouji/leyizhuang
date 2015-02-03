package com.ynyes.rongcheng.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.ShippingAddress;
import com.ynyes.rongcheng.repository.ShippingAddressRepo;

/**
 * 收货地址服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ShippingAddressService {
    @Autowired
    ShippingAddressRepo repository;
    
    
    /**
     * 保存收货地址
     * 
     * @param sa 收货地址
     * @return 保存的收货地址
     */
    public ShippingAddress save(ShippingAddress sa)
    {
        if (null == sa)
        {
            return null;
        }
        
        return repository.save(sa);
    }
  
 
    /**
     * 获取收货地址
     * 
     * @param id 收货地址ID
     * @return 获取到的收货地址
     */
    public ShippingAddress findOne(Long id)
    {
        ShippingAddress sa = null;
        
        if (null != id)
        {
            sa = repository.findOne(id);
        }
        
        return sa;
    }
    
    /**
     * 删除收货地址
     * 
     * @param id 收货地址ID
     */
    public void delete(Long id)
    {
        if (null != id)
        {
            repository.delete(id);
        }
    }
    
    /**
     * 删除收货地址
     * 
     * @param so 收货地址实体
     */
    public void delete(ShippingAddress sa)
    {
        if (null != sa)
        {
            repository.delete(sa);
        }
    }
}
