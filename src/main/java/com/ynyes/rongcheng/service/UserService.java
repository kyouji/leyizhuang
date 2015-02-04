package com.ynyes.rongcheng.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ShippingAddress;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.entity.UserPoint;
import com.ynyes.rongcheng.repository.ProductRepo;
import com.ynyes.rongcheng.repository.ShippingAddressRepo;
import com.ynyes.rongcheng.repository.UserPointRepo;
import com.ynyes.rongcheng.repository.UserRepo;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 品牌服务类
 * 
 * @author Sharon
 *
 */

@Service
@Transactional
public class UserService {
    @Autowired
    UserRepo repository;
    
    @Autowired
    ShippingAddressRepo shippingAddresRepository;
    
    @Autowired
    UserPointRepo userPointRepository;
    
    @Autowired
    ProductRepo productRepository;
    
    /**
     * 添加用户
     * 
     * @param username 用户名
     * @param md5Password 密码的MD5值
     * @param mobile 移动电话
     * @return res.code 0: 成功 1: 失败
     *         res.message 失败时的失败信息
     */
    public Map<String, Object> add(String name, String password, String mobile,HttpServletRequest request)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == name || "".equals(name))
        {
            map.put("message", "用户名不能为空");
            return map;
        }
        
        if (null != repository.findByUsername(name))
        {
            map.put("message", "该用户名已存在");
            return map;
        }

        User user = new User();
 
        user.setUsername(name);
        
        user.setPassword(StringUtils.encryption(password));
        
        user.setMobile(mobile);
        
        user.setRole("USER");
        
        user.setRegisterTime(new Date());
        
        user.setIsEnable(true);
        
        repository.save(user);
        
        map.put("code", 0);
        request.getSession().setAttribute("user", user);
        return map;
    }
    
    /**
     * 通过用户名查找用户
     * 
     * @param username 用户名
     * @return 找到的用户，未找到时返回NULL
     */
    public User findByUsername(String username)
    {
        return repository.findByUsername(username);
    }
    
    /**
     * 登录判断
     * 
     * @param username 用户名
     * @param md5Password 密码的MD5值
     * @return res.code 0：成功   1：失败
     *         res.message 失败时的具体信息
     */
    public Map<String, Object> loginCheck(String username, String md5Password,HttpServletRequest request)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            map.put("message", "该用户不存在");
            return map;
        }
        
        if (null == user.getIsEnable() || false == user.getIsEnable())
        {
            map.put("message", "已禁用该用户");
            return map;
        }
        
        if ("USER".equalsIgnoreCase(user.getRole()))
        {
            map.put("message", "用户无访问权限");
            return map;
        }
        
        if (!user.getPassword().equals(md5Password))
        {
            map.put("message", "密码错误");
            return map;
        }
        request.getSession().setAttribute("user", user);
        map.put("code", 0);
        
        return map;

    }
    
    /**
     * 获取收货地址
     * 
     * @param username 用户名
     * @return 指定用户的收货地址
     */
    public List<ShippingAddress> findShippingAddressList(String username)
    {
        List<ShippingAddress> saList = null;
        
        if (null == username)
        {
            return null;
        }
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            return null;
        }
        
        saList = user.getShippingAddressList();
        
        return saList;
    }
    
    /**
     * 添加收货地址
     * 
     * @param username 用户名
     * @param address 收货地址
     * @return res.code 0:成功 1:失败
     *         res.message 失败时的具体消息内容
     */
    public Map<String, Object> addShippingAddress(String username, ShippingAddress address)
    {
        List<ShippingAddress> saList = null;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        saList = user.getShippingAddressList();
        
        if (null == saList)
        {
            saList = new ArrayList<ShippingAddress>();
        }
        
        saList.add(address);

        repository.save(user);
        
        shippingAddresRepository.save(address);
        
        map.put("code", 0);
        
        return map;
    }
    
    /**
     * 通过ID删除收货地址
     * 
     * @param username 用户名
     * @param addressId 收货地址的ID
     * @return
     */
    public Map<String, Object> deleteShippingAddressById(String username, Long addressId)
    {
        List<ShippingAddress> saList = null;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        saList = user.getShippingAddressList();
        
        if (null == saList)
        {
            map.put("message", "未找到指定ID的收货地址");
            return map;
        }
        
        for (ShippingAddress sa : saList)
        {
            if (sa.getId().equals(addressId))
            {
                saList.remove(sa);
                repository.save(user);
                shippingAddresRepository.delete(addressId);
                
                map.put("code", 0);
                
                return map;
            }
        }
        
        map.put("message", "未找到该ID的收货地址");
        
        return map;
    }
    
    /**
     * 获取积分列表
     * 
     * @param username 用户名
     * @return 指定用户的积分列表
     */
    public List<UserPoint> findPointsList(String username)
    {
        List<UserPoint> upList = null;
        
        if (null == username)
        {
            return null;
        }
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            return null;
        }
        
        upList = user.getPointList();
        
        return upList;
    }
    
    /**
     * 新增积分
     * 
     * @param username 用户名
     * @param userPoint 用户积分
     * @return res.code 0:成功 1:失败
     *         res.message 失败时的具体消息内容
     */
    public Map<String, Object> addPoints(String username, UserPoint userPoint)
    {
        List<UserPoint> upList = null;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        upList = user.getPointList();
        
        if (null == upList)
        {
            upList = new ArrayList<UserPoint>();
        }
        
        upList.add(userPoint);

        repository.save(user);
        
        userPointRepository.save(userPoint);
        
        map.put("code", 0);
        
        return map;
    }
    
    /**
     * 通过ID删除用户积分
     * 
     * @param username 用户名
     * @param userPointId 用户积分ID
     * @return
     */
    public Map<String, Object> deleteUserPointById(String username, Long userPointId)
    {
        List<UserPoint> upList = null;
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        upList = user.getPointList();
        
        if (null == upList)
        {
            map.put("message", "未找到指定ID的用户积分");
            return map;
        }
        
        for (UserPoint up : upList)
        {
            if (up.getId().equals(userPointId))
            {
                upList.remove(up);
                repository.save(user);
                userPointRepository.delete(userPointId);
                
                map.put("code", 0);
                
                return map;
            }
        }
        
        map.put("message", "未找到该ID的用户积分");
        
        return map;
    }
    
    /**
     * 获取收藏商品的ID列表
     * 
     * @param username 用户名
     * @return
     */
    public List<Long> findCollectedProductIds(String username)
    {
        List<Long> idList = new ArrayList<Long>();
        
        if (null == username)
        {
            return null;
        }
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            return null;
        }
        
        String pids = user.getCollectedProductIds();
        
        String[] idStrArray = pids.split(",");
        
        for (String idStr : idStrArray)
        {
            idList.add(Long.parseLong(idStr));
        }
        
        return idList;
    }
    
    /**
     * 获取收藏商品列表
     * 
     * @param username 用户名
     * @return
     */
    public List<Product> findCollectedProducts(String username)
    {
        List<Long> idList = new ArrayList<Long>();
        
        if (null == username)
        {
            return null;
        }
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            return null;
        }
        
        String pids = user.getCollectedProductIds();
        
        String[] idStrArray = pids.split(",");
        
        for (String idStr : idStrArray)
        {
            idList.add(Long.parseLong(idStr));
        }
        
        return productRepository.findByIsOnSaleTrueAndIdIn(idList);
    }
    
    /**
     * 分页获取商品列表
     * 
     * @param username 用户名
     * @param page 页号，从0开始
     * @param size 页大小
     * @param direction 排序方向 asc:升序 desc:降序
     * @param property 排序字段
     * @return 商品相应页面
     */
    public Page<Product> findCollectedProducts(String username,
                                               int page,
                                               int size,
                                               String direction,
                                               String property)
    {
        List<Long> idList = new ArrayList<Long>();
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
        
        if (null == username)
        {
            return null;
        }
        
        User user = repository.findByUsername(username);
        
        if (null == user)
        {
            return null;
        }
        
        String pids = user.getCollectedProductIds();
        
        String[] idStrArray = pids.split(",");
        
        for (String idStr : idStrArray)
        {
            idList.add(Long.parseLong(idStr));
        }
        
        return productRepository.findByIsOnSaleTrueAndIdIn(idList, pageRequest);
    }
    
    /**
     * 添加收藏
     * 
     * @param username 用户名
     * @param productId 商品ID
     * @return res.code 0:成功 1:失败
     *         res.message 失败时的错误信息
     */
    public Map<String, Object> addCollectedProductId(String username, Long productId)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        String idStr = user.getCollectedProductIds();
        
        if (null == idStr)
        {
            idStr = "";
        }
        
        if (idStr.contains(productId + ","))
        {
            map.put("message", "已收藏过该商品");
            return map;
        }
        
        user.setCollectedProductIds(idStr + productId + ","); 

        repository.save(user);
        
        map.put("code", 0);
        
        return map;
    }
    
    /**
     * 删除收藏
     * 
     * @param username 用户名
     * @param productId 商品ID
     * @return res.code 0:成功 1:失败
     *         res.message 失败时的错误信息
     */
    public Map<String, Object> deleteCollectedProductId(String username, Long productId)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("code", 1);
        
        if (null == username)
        {
            map.put("message", "用户名为空");
            return map;
        }
        
        User user = repository.findByUsernameAndRoleAndIsEnableTrue(username, "USER");
        
        if (null == user)
        {
            map.put("message", "未找到该用户或权限错误");
            return map;
        }
        
        String idStr = user.getCollectedProductIds();
        
        if (null == idStr)
        {
            idStr = "";
        }
        
        if (!idStr.contains(productId + ","))
        {
            map.put("message", "未收藏该商品");
            return map;
        }
        
        idStr.replace(productId+",", "");
        
        user.setCollectedProductIds(idStr); 

        repository.save(user);
        
        map.put("code", 0);
        
        return map;
    }
    
    /**
     * 保存用户
     * 
     * @param user 要保存的用户
     * @return 保存的用户
     */
    public User save(User user){
        if (null == user)
        {
            return null;
        }
        return repository.save(user);
    }
    
    
}
