package com.ynyes.rongcheng.controller.front;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ynyes.rongcheng.entity.Parameter;
import com.ynyes.rongcheng.entity.Product;
import com.ynyes.rongcheng.entity.ProductComment;
import com.ynyes.rongcheng.entity.ProductVersion;
import com.ynyes.rongcheng.entity.User;
import com.ynyes.rongcheng.service.ParameterService;
import com.ynyes.rongcheng.service.ProductCommentService;
import com.ynyes.rongcheng.service.ProductConsultService;
import com.ynyes.rongcheng.service.ProductService;
import com.ynyes.rongcheng.service.ProductTypeService;
import com.ynyes.rongcheng.service.UserService;
import com.ynyes.rongcheng.util.StringUtils;

/**
 * 商品详情页面
 * 
 * TypeListContentController<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-上午10:39:56 <BR>
 * @version 1.0.0
 *
 */
@Controller
public class Productontroller {
    @Autowired
    private  ProductService productservice;//商品信息相关
    @Autowired
    private  ParameterService parameterService;//商品参数相关
    @Autowired
    private  UserService userService;//用户相关
    @Autowired
    private ProductCommentService productCommentService;//商品评论相关
    @Autowired
    private ProductConsultService productConsultService;//商品资讯相关
    @Autowired
    private ProductTypeService productTypeService;//商品类型相关
    private  String flag;
    /**
     * 
     * 商品详情页面<BR>
     * 方法名：index<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月5日-下午1:43:30 <BR>
     * @param typeId
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>                          Long pid,
                                                Long vid,
                                                int page,
                                                int size,
                                                String direction,
                                                String property
                                                co 已选颜色
                                                ca 已选容量
                                                na 已选版本名
     * @since  1.0.0
     */
    @RequestMapping("/product/{typeId}")
    public ModelAndView index(@PathVariable Long typeId,Long vid,String co, String ca, String na){
        ModelAndView modelAndView=new ModelAndView();
        Product product=productservice.findOne(typeId);

        Page<ProductComment> productConsult = null;
        if(vid==null){
            vid=(long) 0;
            productConsult=productCommentService.findByPidAndVid(typeId, vid, 0, 10, "desc", "commentTime");
        }
        
        String type =product.getType();
        List<String> versionColors = new ArrayList<String>();
        List<String> versionNames = new ArrayList<String>();
        List<String> versionCapacities = new ArrayList<String>();
        List<ProductVersion> productVersions =product.getVersionList();
        for (ProductVersion ver : productVersions) {
        {
            // 版本颜色全部添加
            if (null != ver.getColor()
                    && !"".equals(ver.getColor()) 
                    && !versionColors.contains(ver.getColor()))
            {
                versionColors.add(ver.getColor());
            }
            
            // 添加版本
            // 已选颜色
            if (null != co && !"".equals(co))
            {
                // 匹配已选颜色才添加
                if (null != ver.getName() 
                        && !"".equals(ver.getName()) 
                        && co.equals(ver.getColor())
                        && !versionNames.contains(ver.getName()))
                {
                    versionNames.add(ver.getName());
                }
            }
            else // 未选颜色
            {
                if (null != ver.getName() 
                        && !"".equals(ver.getName()) 
                        && !versionNames.contains(ver.getName()))
                {
                    versionNames.add(ver.getName());
                }
            }
            
            // 添加容量
            // 已选颜色
            if (null != co && !"".equals(co))
            {
                // 已选版本
                if (null != na && !"".equals(na))
                {
                    // 满足版本和颜色均匹配
                    if (null != ver.getCapacity()
                            && !"".equals(ver.getCapacity()) 
                            && co.equals(ver.getColor())
                            && na.equals(ver.getName())
                            && !versionCapacities.contains(ver.getCapacity()))
                    {
                        versionCapacities.add(ver.getCapacity());
                    }
                }
                else
                {
                    // 仅满足颜色匹配
                    if (null != ver.getCapacity()
                            && !"".equals(ver.getCapacity()) 
                            && co.equals(ver.getColor())
                            && !versionCapacities.contains(ver.getCapacity()))
                    {
                        versionCapacities.add(ver.getCapacity());
                    }
                }
            }
            else // 未选颜色
            {
                // 添加所有版本
                if (null != ver.getCapacity()
                        && !"".equals(ver.getCapacity()) 
                        && !versionCapacities.contains(ver.getCapacity()))
                {
                    versionCapacities.add(ver.getCapacity());
                }
            }
        }
        

        modelAndView.addObject("co", co);
        modelAndView.addObject("ca", ca);
        modelAndView.addObject("na", na);
        modelAndView.addObject("version_names", versionNames);
        modelAndView.addObject("version_colors", versionColors);
        modelAndView.addObject("version_capacities", versionCapacities);
    }
        List<Parameter> parameters= parameterService.findByType(type);
        String list=product.getShowPictures();
        String[] sList = list.split(",");
        
        modelAndView.addObject("qgPictures",productservice.findStar(0, 10, "desc","sortNumber").getContent());//抢购
        modelAndView.addObject("ShowPictures",sList);//轮播展示图片
        modelAndView.addObject("product",product);//商品详情
        modelAndView.addObject("parameters",parameters);//商品属性
        modelAndView.addObject("productConsult",productConsult.getContent());//商品评论
        modelAndView.addObject("productComm",productConsultService.findByPidAndVid(product.getId(),vid, 0, 10, "desc","consultTime" ).getContent());//商品资讯
        modelAndView.addObject("productcount",productConsult.getTotalElements());//商品评论数量

        modelAndView.setViewName("/front/type_list_content");
    return modelAndView;
    }
    /**
     * 
     * 商品对比页面跳转<BR>
     * 方法名：productContrast<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年1月29日-下午1:03:54 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/ProductContrast")
    public String productContrast(){
        return "/front/ProductContrast";
    }
    /**
     * 
     * 添加收藏<BR>
     * 方法名：collect<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月6日-下午1:36:24 <BR>
     * @param model
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>
     * @since  1.0.0
     */
    @RequestMapping("/addcollect")
    @ResponseBody
    public String collect(HttpServletRequest request,Long productid){
      User user= (User) request.getSession().getAttribute("user");
    
      if(user==null){
          flag="logout";
          return flag;
      }else{
          String username=user.getUsername();
          if(StringUtils.isNotEmpty(username)){
              Map<String,Object> map=userService.addCollectedProductId(username, productid);
              if(map.get("code").equals(0)){
                  flag="success";
                  return flag;
              }else if(map.get("message").equals("已收藏过该商品")){
                  flag="flok";
                  return flag;
              }
          }
          flag="flase";
      }
      return flag;
    }
    /**
     * 
     * 添加评论<BR>
     * 方法名：saveComment<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月7日-下午5:15:45 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>String username,
                                   Long starCount,
                                   String tags,
                                   String content,
                                   Long productId,
                                   Long productVersionId
     * @since  1.0.0
     */
    @RequestMapping(value="/saveComm",method=RequestMethod.POST)
    @ResponseBody
    public String saveComment(HttpServletRequest request,String verify,Long starCount,String tags,String content,Long productId,Long productVersionId){
        User user= (User) request.getSession().getAttribute("user");
       String msg = (String)request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
      if(user!=null){ 
           if(StringUtils.isNotEmpty(user.getUsername())){
               if(verify.equalsIgnoreCase(msg)){
                   if(productVersionId==null || starCount==null){
                       productVersionId=(long) 0;
                       starCount=(long) 0;
                       productCommentService.add(user.getUsername(), productVersionId, tags, content, productId, productVersionId);
                       flag="success";
                       return flag;
                   }
               }else{
                   flag="vfalse";//验证码失败
                   return flag;
               }
           }
       }
    return flag;
     }
    /**
     * 
     * 添加评论<BR>
     * 方法名：saveConnect<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2015年2月7日-下午5:15:45 <BR>
     * @return String<BR>
     * @param  [参数1]   [参数1说明]
     * @param  [参数2]   [参数2说明]
     * @exception <BR>String username,
                                   Long starCount,
                                   String tags,
                                   String content,
                                   Long productId,
                                   Long productVersionId
     * @since  1.0.0
     */
    @RequestMapping(value="/saveConn",method=RequestMethod.POST)
    @ResponseBody
    public String saveConnect(HttpServletRequest request,String verify,Long starCount,String type,String content,Long productId,Long productVersionId){
        User user= (User) request.getSession().getAttribute("user");
        String msg = (String)request.getSession().getAttribute("RANDOMVALIDATECODEKEY");
        if(user!=null){ 
            if(StringUtils.isNotEmpty(user.getUsername())){
                if(verify.equalsIgnoreCase(msg)){
                    if(productVersionId==null || starCount==null){
                        productVersionId=(long) 0;
                        starCount=(long) 0;
                        productConsultService.add(user.getUsername(), type, content, productId, productVersionId);
                        flag="success";
                        return flag;
                    }
                }else{
                    flag="vfalse";//验证码失败
                    return flag;
                }
            }
        }
        return flag;
    }
    //grt/set
    public String getFlag() {
        return flag;
    }
    public void setFlag(String flag) {
        this.flag = flag;
    }
    
}
