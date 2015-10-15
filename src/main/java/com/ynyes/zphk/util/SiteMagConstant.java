package com.ynyes.zphk.util;

import java.util.Properties;

/**
 * 后台常用常量
 * @author Sharon
 *
 */
public class SiteMagConstant {

    public static final int pageSize = 20;
    
    //自动提醒时间间隔     site_mag/frame  中的  setInterval 方法
    
    public static final String templatePath = "src/main/resources/templates/client/";
    
    public static String backupPath; 
    public static String imagePath;
    
    static{
		Properties props = System.getProperties();
		String operation = props.getProperty("os.name");
		if(operation.contains("Linux")){
			backupPath = "/root/backup/";
			imagePath = "/root/images/goods";
		}else{
			backupPath = "src/main/resources/backup/";
			imagePath = "src/main/resources/static/images";
		}
    }
    
//    public static final String backupPath = "/root/backup/";
//    public static final String imagePath = "/root/images/goods";
}
