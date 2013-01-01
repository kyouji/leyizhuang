/**
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements. See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership. The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
// START SNIPPET: service
package com.ynyes.lyz.webservice.impl;

import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.jws.WebService;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.geronimo.mail.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.ynyes.lyz.entity.TdDiySite;
import com.ynyes.lyz.entity.TdPriceList;
import com.ynyes.lyz.entity.TdPriceListItem;
import com.ynyes.lyz.service.TdDiySiteService;
import com.ynyes.lyz.service.TdPriceListItemService;
import com.ynyes.lyz.service.TdPriceListService;
import com.ynyes.lyz.webservice.ICallEBS;

@WebService
public class CallEBSImpl implements ICallEBS {
	
	@Autowired
	private TdDiySiteService tdDiySiteService;
	
	@Autowired
	private TdPriceListService tdPriceListService;
	
	@Autowired
	private TdPriceListItemService tdPriceListItemService;

	public String GetErpInfo(String STRTABLE, String STRTYPE, String XML) 
	{
		System.out.println("getErpInfo called");

		if (null == STRTABLE || STRTABLE.isEmpty() || STRTABLE.equals("?"))
		{
			return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>STRTABLE参数错误</MESSAGE></STATUS></RESULTS>";
		}

		if (null == XML || XML.isEmpty() || XML.equals("?")) 
		{
			return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>XML参数错误</MESSAGE></STATUS></RESULTS>";
		}

		byte[] decoded = Base64.decode(XML);

		String decodedXML = null;

		try
		{
			decodedXML = new String(decoded, "UTF-8");
		} 
		catch (UnsupportedEncodingException e)
		{
			System.out.println("UnsupportedEncodingException for decodedXML");
			e.printStackTrace();
		}

		if (null == decodedXML || decodedXML.isEmpty()) 
		{
			return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>解密后XML数据为空</MESSAGE></STATUS></RESULTS>";
		}

		System.out.println(decodedXML);

		// 解析XML
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = null;
		try
		{
			builder = factory.newDocumentBuilder();
		}
		catch (ParserConfigurationException e) 
		{
			e.printStackTrace();
		}

		Document document = null;

		InputSource is = new InputSource(new StringReader(decodedXML));

		try
		{
			document = builder.parse(is);
		} 
		catch (SAXException | IOException e)
		{
			e.printStackTrace();
		}
		NodeList nodeList = document.getElementsByTagName("TABLE");
		

		if (STRTABLE.equalsIgnoreCase("CUXAPP_AR_CUST_STORES_OUT")) //门店表
		{
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Integer sob_id = null;
				Integer customer_id = null;
				String customer_number = null;
				String customer_name = null;
				String store_code = null;
				String cust_type_code = null;
				String cust_type_name = null;
				String address = null;
				String dept_code = null;
				String dept_desc = null;
				String enabled_flag = null;
				
				
				Node node = nodeList.item(i);
				NodeList childNodeList = node.getChildNodes();
				for (int idx = 0; idx < childNodeList.getLength(); idx++)
				{
					Node childNode = childNodeList.item(idx);
					
					if (childNode.getNodeType() == Node.ELEMENT_NODE) 
					{
						// 比较字段名
						if (childNode.getNodeName().equalsIgnoreCase("SOB_ID"))
						{
							// 有值
							if (null != childNode.getChildNodes().item(0))
							{
								sob_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
							// 空值
							else
							{
								sob_id = null;
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_ID"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_NUMBER"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_number = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_NAME"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("STORE_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								store_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("CUST_TYPE_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								cust_type_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("CUST_TYPE_NAME"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								cust_type_name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("ADDRESS"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								address = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("DEPT_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								dept_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("DEPT_DESC"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								dept_desc = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("ENABLED_FLAG"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								enabled_flag = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						
						
					}
				}

					
					
				TdDiySite diySite = tdDiySiteService.findBySobIdAndCustomerId(sob_id, customer_id);

				if (diySite == null)
				{
					diySite = new TdDiySite();
				}

				if (cust_type_code.equalsIgnoreCase("JX"))
				{
					diySite.setIsDirect(false);
				}
				else
				{
					diySite.setIsDirect(true);
				}
				if (enabled_flag.equalsIgnoreCase("Y")) 
				{
					diySite.setIsEnable(true);
				}
				else
				{
					diySite.setIsEnable(false);
				}
				diySite.setTitle(cust_type_name);
				diySite.setAddress(address);
				diySite.setInfo(dept_desc);
				tdDiySiteService.save(diySite);
				
				return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
			}

		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_OM_PRICE_LIST_H_OUT"))//TdPriceList
		{
			// 遍历所有TABLE结构
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Integer list_header_id = null;
				Integer sob_id = null;
				String name = null;
				String active_flag = null;
				String description = null;
				String start_date_active = null;
				String end_date_active = null;
				String price_type = null;
				String price_type_DESC = null;
				
				Node node = nodeList.item(i);
				NodeList childNodeList = node.getChildNodes();
				
				// 遍历所有TABLE中的字段
				for (int idx = 0; idx < childNodeList.getLength(); idx++)
				{
					Node childNode = childNodeList.item(idx);
					
					if (childNode.getNodeType() == Node.ELEMENT_NODE) 
					{
						// 比较字段名
						if (childNode.getNodeName().equalsIgnoreCase("list_header_id"))
						{
							// 有值
							if (null != childNode.getChildNodes().item(0))
							{
								list_header_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("sob_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								sob_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("name"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("active_flag"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								active_flag = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("description"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								description = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("start_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								start_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("end_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								end_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("price_type"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								price_type = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("price_type_DESC"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								price_type_DESC = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
					}
				}
				TdPriceList tdPriceList = tdPriceListService.findByListHeaderId(list_header_id);
				if (tdPriceList == null)
				{
					tdPriceList = new TdPriceList();
				}
				tdPriceList.setListHeaderId(list_header_id);
				tdPriceList.setSobId(sob_id);
				tdPriceList.setName(name);
				tdPriceList.setActiveFlag(active_flag);
				tdPriceList.setDescription(description);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date startdate ;
				try {
					startdate = sdf.parse(start_date_active);
					tdPriceList.setStartDateActive(startdate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				try {
					Date enddate = sdf.parse(end_date_active);
					tdPriceList.setEndDateActive(enddate);
				} catch (ParseException e) {
					e.printStackTrace();
				}
				tdPriceList.setPriceType(price_type);
				tdPriceList.setPriceTypeDesc(price_type_DESC);
				tdPriceListService.save(tdPriceList);
			}
			
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_OM_PRICE_LIST_L_OUT")) //TdPriceListItem
		{
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Integer list_header_id = null;
				Integer list_line_id = null;
				Integer inventory_item_id = null;
				String  description= null;
				String item_num = null;
				String item_desc = null;
				String product_uom_code = null;
				Double price = null;
				String start_date_active = null;
				String end_date_active = null;
				
				
				Node node = nodeList.item(i);
				NodeList childNodeList = node.getChildNodes();
				for (int idx = 0; idx < childNodeList.getLength(); idx++)
				{
					Node childNode = childNodeList.item(idx);
					
					if (childNode.getNodeType() == Node.ELEMENT_NODE) 
					{
						// 比较字段名
						if (childNode.getNodeName().equalsIgnoreCase("list_header_id"))
						{
							// 有值
							if (null != childNode.getChildNodes().item(0))
							{
								list_header_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("list_line_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								list_line_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("inventory_item_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								inventory_item_id = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("description"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								description = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("item_num"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_num = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("item_desc"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_desc = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("product_uom_code"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								product_uom_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("price"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								price = Double.parseDouble(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("start_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								start_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("end_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								end_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
					}
				}
				//保存
				
				TdPriceListItem tdPriceListItem =  tdPriceListItemService.findByListHeaderId(list_header_id);
				if (tdPriceListItem == null)
				{
					tdPriceListItem = new TdPriceListItem();
				}
				tdPriceListItem.setListHeaderId(list_header_id);
				tdPriceListItem.setDescription(description);
				tdPriceListItem.setListLineId(list_line_id);
				tdPriceListItem.setItemNum(item_num);
				tdPriceListItem.setItemDesc(item_desc);
				tdPriceListItem.setProductUomCode(product_uom_code);
				tdPriceListItem.setPrice(price);
				
				tdPriceListItemService.save(tdPriceListItem);
				
				
			}
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_INV_ITEMS_OUT"))
		{
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Long inventory_item_id = null;
				String item_code = null;
				String item_description = null;
				String item_barcode= null;
				String unit = null;
				String unit_name = null;
				Long inv_category_id = null;
				Long brad_category_id = null;
				Long product_category_id = null;
				String weight_uom_code = null;
				Integer weight_uom_name = null;
				Integer unit_weight = null;
				Integer volume_uom_code = null;
				String  volume_uom_name= null;
				String unit_volume = null;
				String dimension_uom_code = null;
				String unit_length = null;
				Double unit_width = null;
				String unit_height = null;
				String item_type_name = null;
				Integer item_type_code = null;
				Integer inventory_item_status = null;
				Integer product_flag = null;
				String  gross_weight= null;
				String denomination = null;
				String t_flag = null;
				String sr_flag = null;
				Double coupon_useful_life = null;
				String coupon_start_date_active = null;
				String coupon_end_date_active = null;
				Integer attribute1 = null;
				
				
				Node node = nodeList.item(i);
				NodeList childNodeList = node.getChildNodes();
				for (int idx = 0; idx < childNodeList.getLength(); idx++)
				{
					Node childNode = childNodeList.item(idx);
					
					if (childNode.getNodeType() == Node.ELEMENT_NODE) 
					{
						// 比较字段名
						if (childNode.getNodeName().equalsIgnoreCase("inventory_item_id"))
						{
							// 有值
							if (null != childNode.getChildNodes().item(0))
							{
								inventory_item_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("item_code"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("item_description"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_description = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
//						if (childNode.getNodeName().equalsIgnoreCase("description"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								description = childNode.getChildNodes().item(0).getNodeValue();
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("item_num"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								item_num = childNode.getChildNodes().item(0).getNodeValue();
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("item_desc"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								item_desc = childNode.getChildNodes().item(0).getNodeValue();
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("product_uom_code"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								product_uom_code = childNode.getChildNodes().item(0).getNodeValue();
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("price"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								price = Double.parseDouble(childNode.getChildNodes().item(0).getNodeValue());
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("start_date_active"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								start_date_active = childNode.getChildNodes().item(0).getNodeValue();
//							}
//						}
//						if (childNode.getNodeName().equalsIgnoreCase("end_date_active"))
//						{
//							if (null != childNode.getChildNodes().item(0))
//							{
//								end_date_active = childNode.getChildNodes().item(0).getNodeValue();
//							}
						}
					}
				}
				//保存
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}

		return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>不支持的表数据传输</MESSAGE></STATUS></RESULTS>";
	}
}
// END SNIPPET: service
