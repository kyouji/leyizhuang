package com.ynyes.rongcheng.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.entity.ShoppingCart;
import com.ynyes.rongcheng.repository.ShoppingCartRepo;

/**
 * 购物车服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class ShoppingCartService {
    @Autowired
    ShoppingCartRepo repository;
    
    @Autowired
    ProductService productService;
    
    /**
     * 获取购物车项
     * 
     * @param username 用户名
     * @param id 购物车ID
     * @return 获取到的购物车项
     */
    public ShoppingCart findOne(String username, Long id)
    {
        ShoppingCart sc = null;
        
        if (null != id)
        {
            sc = repository.findByUsernameAndId(username, id);
        }
        
        // 填充其他字段
        if (null != sc.getPid())
        {
            Product product = productService.findOne(sc.getPid());
            
            if (null != product)
            {
                sc.setProductName(product.getName());
                sc.setProductBrief(product.getBrief());
                sc.setProductCoverImageUri(product.getCoverImageUri());
                sc.setProductCode(product.getCode());
                
                for (ProductVersion ver : product.getVersionList())
                {
                    if (ver.getId().equals(sc.getVid()))
                    {
                        sc.setProductVerCap(ver.getCapacity());
                        sc.setProductVerName(ver.getName());
                        sc.setProductVerColor(ver.getColor());
                        sc.setProductNumber(ver.getLeftNumber());
                    }
                }
                
            }
        }
        
        return sc;
    }
    
    /**
     * 根据用户名查找购物车商品列表
     * @param username 用户名
     * @return 购物车项列表
     */
    public List<ShoppingCart> findByUsername(String username)
    {
        List<ShoppingCart> cartList = null;
        
        if (null != username)
        {
            cartList = repository.findByUsername(username);
            
            for (ShoppingCart sc : cartList)
            {
                if (null != sc)
                {
                    // 填充其他字段
                    if (null != sc.getPid())
                    {
                        Product product = productService.findOne(sc.getPid());
                        
                        if (null != product)
                        {
                            sc.setProductName(product.getName());
                            sc.setProductBrief(product.getBrief());
                            sc.setProductCoverImageUri(product.getCoverImageUri());
                            sc.setProductCode(product.getCode());
                            
                            for (ProductVersion ver : product.getVersionList())
                            {
                                if (ver.getId().equals(sc.getVid()))
                                {
                                    sc.setProductVerCap(ver.getCapacity());
                                    sc.setProductVerName(ver.getName());
                                    sc.setProductVerColor(ver.getColor());
                                    sc.setProductNumber(ver.getLeftNumber());
                                }
                            }
                            
                        }
                    }
                }
            }
        }
        
        return cartList;
    }
    
    /**
     * 根据用户名查找已勾选进行结算的购物车商品列表
     * 
     * @param username 用户名
     * @return 已勾选进行结算的购物车项列表
     */
    public List<ShoppingCart> findByUsernameAndIsSelectTrue(String username)
    {
        List<ShoppingCart> cartList = null;
        List<ShoppingCart> selectCartList = new ArrayList<ShoppingCart>();
        
        if (null != username)
        {
            cartList = repository.findByUsername(username);
            
            for (ShoppingCart sc : cartList)
            {
                if (null != sc && null != sc.getIsSelected() && sc.getIsSelected().equals(true))
                {
                    // 填充其他字段
                    if (null != sc.getPid())
                    {
                        Product product = productService.findOne(sc.getPid());
                        
                        if (null != product)
                        {
                            sc.setProductName(product.getName());
                            sc.setProductBrief(product.getBrief());
                            sc.setProductCoverImageUri(product.getCoverImageUri());
                            sc.setProductCode(product.getCode());
                            
                            for (ProductVersion ver : product.getVersionList())
                            {
                                if (ver.getId().equals(sc.getVid()))
                                {
                                    sc.setProductVerCap(ver.getCapacity());
                                    sc.setProductVerName(ver.getName());
                                    sc.setProductVerColor(ver.getColor());
                                    sc.setProductNumber(ver.getLeftNumber());
                                }
                            }
                            selectCartList.add(sc);
                        }
                    }
                }
            }
        }
        
        return selectCartList;
    }
    
    /**
     * 统计购物车商品数量 
     *
     * @param username 用户名
     * @return 购物车内商品数量
     */
    public Long countByUsername(String username)
    {
        Long count = 0L;
        
        if (null != username)
        {
            List<ShoppingCart> cartList = repository.findByUsername(username);
            
            for (ShoppingCart sc : cartList)
            {
                if (null != sc)
                {
                    count += sc.getQuantity();
                }
            }
        }
        
        return count;
    }
    
    /**
     * 添加商品到购物车
     * 
     * @param username 用户名
     * @param pid 商品ID
     * @param vid 版本ID
     * @param quantity 商品数量
     * @param price 成交价
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     *         map.data 成功时将返回新增的购物车项
     */
    public Map<String, Object> add(String username, 
                                   Long pid,
                                   Long vid,
                                   Long quantity,
                                   Double price)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || "".equals(username) || null == pid 
                || null == vid || null == quantity || null == price)
        {
            map.put("message", "参数错误");
            return map;
        }
        
        // 判断商品剩余数量
        ProductVersion ver = productService.findVersion(pid, vid);
        
        if (null == ver)
        {
            map.put("message", "商品不存在该版本");
            return map;
        }
        
        if (quantity > ver.getLeftNumber())
        {
            map.put("message", "商品库存不足");
            return map;
        }
        
        ShoppingCart sc = new ShoppingCart();
        
        sc.setUsername(username);
        sc.setPid(pid);
        sc.setVid(vid);
        sc.setQuantity(quantity);
        sc.setPrice(price);
        sc.setIsSelected(false);
        
        // 保存
        sc = repository.save(sc);
        
        map.put("code", 0);
        map.put("data", sc);
        
        return map;
    }
    
    /**
     * 删除购物车项
     * 
     * @param username 用户名
     * @param id 购物车ID
     */
    public void delete(String username, Long id)
    {
        if (username != null && null != id)
        {
            ShoppingCart sc = repository.findByUsernameAndId(username, id);
            
            if (null != sc)
            {
                repository.delete(sc);
            }
        }
    }
    
    /**
     * 删除购物车项
     * 
     * @param sc 购物车项
     */
    public void delete(ShoppingCart sc)
    {
        if (null != sc)
        {
            repository.delete(sc);
        }
    }
    
    /**
     * 修改购物车商品数量，当quantity为0时为删除购物车中该商品
     * 
     * @param username 用户名
     * @param pid 商品ID
     * @param vid 版本ID
     * @param quantity 商品数量
     * @return
     */
    public Map<String, Object> updateQuantity(String username, Long pid, Long vid, Long quantity)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || null == pid || null == vid || null == quantity)
        {
            map.put("message", "参数错误");
            return map;
        }
        
        List<ShoppingCart> scList = repository.findByUsername(username);
        
        if (null == scList || 1 > scList.size())
        {
            map.put("message", "用户购物车中没有商品");
            return map;
        }
        
        for (ShoppingCart sc : scList)
        {
            if (sc.getPid().equals(pid) && sc.getVid().equals(vid))
            {
                if (quantity.equals(0))
                {
                    repository.delete(sc);
                    map.put("code", 0);
                    return map;
                }
                else
                {
                    sc.setQuantity(quantity);
                    repository.save(sc);
                    map.put("code", 0);
                    return map;
                }
            }
        }
        
        map.put("message", "用户购物车中没有该商品");
        
        return map;
    }
    
    /**
     * 是否选中进行结算
     * 
     * @param username 用户名
     * @param pid 商品ID
     * @param vid 版本ID
     * @param ifSelect true: 选择进行结算 false: 选择不进行结算
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     */
    public Map<String, Object> updateSelect(String username, Long pid, Long vid, Boolean ifSelect)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || null == pid || null == vid || null == ifSelect)
        {
            map.put("message", "参数错误");
            return map;
        }
        
        List<ShoppingCart> scList = repository.findByUsername(username);
        
        if (null == scList || 1 > scList.size())
        {
            map.put("message", "用户购物车中没有商品");
            return map;
        }
        
        for (ShoppingCart sc : scList)
        {
            if (sc.getPid().equals(pid) && sc.getVid().equals(vid))
            {
                sc.setIsSelected(ifSelect);
                repository.save(sc);
                map.put("code", 0);
                return map;
            }
        }
        
        map.put("message", "用户购物车中没有该商品");
        
        return map;
    }
    
    /**
     * 是否全部选中进行结算
     * 
     * @param username 用户名
     * @param ifSelect true: 选择进行结算 false: 选择不进行结算
     * @return map.code 0:成功 1:失败
     *         map.message 失败时的错误信息
     */
    public Map<String, Object> updateSelectAll(String username, Boolean ifSelect)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username || null == ifSelect)
        {
            map.put("message", "参数错误");
            return map;
        }
        
        List<ShoppingCart> scList = repository.findByUsername(username);
        
        if (null == scList || 1 > scList.size())
        {
            map.put("message", "用户购物车中没有商品");
            return map;
        }
        
        for (ShoppingCart sc : scList)
        {
            sc.setIsSelected(ifSelect);
            repository.save(sc);
        }
        
        map.put("code", 0);
        return map;
    }
}
