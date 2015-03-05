package com.ynyes.rongcheng.controller.front;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.rongcheng.util.ImageUtil;

/**
 * 图片控制器
 *
 * @author Sharon
 *
 */
@Controller
public class ImageController{
	/*
	 * 返回图片
	 */
	@RequestMapping(value="/images/goods/{name}", method = RequestMethod.GET)
	@ResponseBody
	public void getPic(@PathVariable String name,
	            HttpServletResponse resp) throws IOException {
		if (null == name)
		{
		    return;
		}
		
		String path = ImageUtil.ImageRoot + "/images/goods/";
		
		File file = new File(path + name);
		
		BufferedImage bufferedImage = ImageIO.read(file);
		
		String format =  getFormatName(file);
		
		// 禁止图像缓存。         
        resp.setHeader("Pragma", "no-cache");         
        resp.setHeader("Cache-Control", "no-cache");         
        resp.setDateHeader("Expires", 0);     
        
        
        if (format.equals("PNG"))
        {
            resp.setContentType("image/png");
        }
        else if (format.equals("GIF"))
        {
            resp.setContentType("image/gif");
        }
        else
        {
            resp.setContentType("image/jpeg");    
        }
        
        // 将图像输出到Servlet输出流中。         
        ServletOutputStream sos = resp.getOutputStream();         
        ImageIO.write(bufferedImage, "jpeg", sos);         
        sos.close(); 
	}
	
	private String getFormatName(Object o) {
        try {
            ImageInputStream iis = ImageIO.createImageInputStream(o);
            Iterator<ImageReader> iter = ImageIO.getImageReaders(iis);
            
            if (!iter.hasNext()) {
                return null;
            }
    
            ImageReader reader = iter.next();
            iis.close();
            return reader.getFormatName();
        } catch (IOException e) {
        }
        return null;
    }


}
