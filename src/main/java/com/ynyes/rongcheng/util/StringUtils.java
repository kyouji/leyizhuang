package com.ynyes.rongcheng.util;
/**
 * 常用字符串工具类
 * （小郭封装）
 * StringUtils<BR>
 * 创建人:guozhengyang <BR>
 * 时间：2015年1月29日-下午12:35:10 <BR>
 * @version 1.0.0
 *
 */
public class StringUtils {

    /**
     * 判断字符串是否是整数
     */
    public static boolean isInteger(String value) {
     try {
      Integer.parseInt(value);
      return true;
     } catch (NumberFormatException e) {
      return false;
     }
    }

    /**
     * 判断字符串是否是浮点数
     */
    public static boolean isDouble(String value) {
     try {
      Double.parseDouble(value);
      if (value.contains("."))
       return true;
      return false;
     } catch (NumberFormatException e) {
      return false;
     }
    }

    /**
     * 判断字符串是否是数字
     */
    public static boolean isNumber(String value) {
     return isInteger(value) || isDouble(value);
    }
    /**
     * 判断字符串是否为空
     * @param str
     * @return
     */
    public static boolean isEmpty(String str) {
        return null == str || str.length() == 0 || "".equals(str)
                || str.matches("\\s*");
    }
    
    /**
     * 非空判断
     * 方法名：isNotEmpty<BR>
     * 创建人：guozhengyang <BR>
     * 时间：2014年8月12日-下午9:36:18 <BR>
     * @param str
     * @return boolean<BR>
     * @exception <BR>
     * @since  1.0.0
     */
    public static boolean isNotEmpty(String str) {
        return !isEmpty(str);
    }
public static void main(String[] args) {
    String str="1233232";
    System.out.println(isNumber(str));
}
}
