package com.ynyes.cheyou.controller.front;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ynyes.cheyou.util.ImageUtil;

/**
 * 图片控制器
 *
 * @author Sharon
 *
 */
@Controller
public class TdImageController {
    /*
     * 返回图片
     */
    @RequestMapping(value = "/images/{name:.+}", method = RequestMethod.GET)
    @ResponseBody
    public void getPic(@PathVariable String name, HttpServletResponse resp)
            throws IOException {
        if (null == name) {
            return;
        }

        String path = ImageUtil.ImageRoot + "/";

        FileInputStream fis = new FileInputStream(path + name);

        int size = fis.available(); // 得到文件大小

        byte data[] = new byte[size];

        fis.read(data); // 读数据

        fis.close();

        resp.setContentType("image/gif");

        OutputStream os = resp.getOutputStream();
        os.write(data);
        os.flush();
        os.close();

        // File file = new File(path + name);
        //
        // if (file.exists())
        // {
        // BufferedImage bufferedImage = ImageIO.read(file);
        //
        // String format = getFormatName(file);
        //
        // // 禁止图像缓存。
        // resp.setHeader("Pragma", "no-cache");
        // resp.setHeader("Cache-Control", "no-cache");
        // resp.setDateHeader("Expires", 0);
        //
        // if (format.equalsIgnoreCase("PNG")) {
        // resp.setContentType("image/png");
        // } else if (format.equalsIgnoreCase("GIF")) {
        // resp.setContentType("image/gif");
        // } else {
        // resp.setContentType("image/jpeg");
        // }
        //
        // // 将图像输出到Servlet输出流中。
        // ServletOutputStream sos = resp.getOutputStream();
        // ImageIO.write(bufferedImage, "jpeg", sos);
        // sos.close();
        // }
    }

//    private String getFormatName(Object o) {
//        try {
//            ImageInputStream iis = ImageIO.createImageInputStream(o);
//            Iterator<ImageReader> iter = ImageIO.getImageReaders(iis);
//
//            if (!iter.hasNext()) {
//                return null;
//            }
//
//            ImageReader reader = iter.next();
//            iis.close();
//            return reader.getFormatName();
//        } catch (IOException e) {
//        }
//        return null;
//    }

}
