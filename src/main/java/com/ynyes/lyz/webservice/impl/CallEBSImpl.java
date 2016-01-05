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
import com.ynyes.lyz.entity.TdGoods;
import com.ynyes.lyz.entity.TdPriceList;
import com.ynyes.lyz.entity.TdPriceListItem;
import com.ynyes.lyz.service.TdDiySiteService;
import com.ynyes.lyz.service.TdGoodsService;
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
	
	@Autowired
	private TdGoodsService tdGoodsService;

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
				Long sob_id = null;
				Long customer_id = null;
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
								sob_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
							// 空值
							else
							{
								sob_id = null;
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_ID"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_NUMBER"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_number = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("CUSTOMER_NAME"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								customer_name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("STORE_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								store_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("CUST_TYPE_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								cust_type_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("CUST_TYPE_NAME"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								cust_type_name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("ADDRESS"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								address = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("DEPT_CODE"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								dept_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("DEPT_DESC"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								dept_desc = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("ENABLED_FLAG"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								enabled_flag = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						
						
					}
				}

					
					
				TdDiySite diySite = tdDiySiteService.findByCustomerIdAndSobId(customer_id, sob_id);

				if (diySite == null)
				{
					diySite = new TdDiySite();
				}

				diySite.setRegionId(sob_id);
				diySite.setCustomerId(customer_id);
				
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
				diySite.setTitle(customer_name);
				diySite.setAddress(address);
				diySite.setInfo(dept_desc);
				diySite.setSobId(sob_id);
				tdDiySiteService.save(diySite);
				
				return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
			}
		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_OM_PRICE_LIST_H_OUT"))//TdPriceList
		{
			// 遍历所有TABLE结构
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Long list_header_id = null;//价目表ID
				Long sob_id = null;//分公司ID
				String name = null;//价目表名称
				String active_flag = null;//有效标识 Y有效， N无效
				String description = null;//描述
				String start_date_active = null;//生效日期
				String end_date_active = null;//失效日期
				String price_type = null;//价目表类型
				String price_type_DESC = null;//价目表类型描述
				
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
								list_header_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						if (childNode.getNodeName().equalsIgnoreCase("sob_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								sob_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
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
				TdPriceList tdPriceList = tdPriceListService.findOne(list_header_id);
				if (tdPriceList == null)
				{
					tdPriceList = new TdPriceList();
					tdPriceList.setId(list_header_id);
				}
				tdPriceList.setCityId(sob_id);;
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
				Long list_header_id = null;//价目表头ID
				Long list_line_id = null;//价目表行ID
				Long inventory_item_id = null;//产品ID
				String  description= null;//描述
				String item_num = null;//产品编号
				String item_desc = null;//物料描述
				String product_uom_code = null;//物料单位
				Double price = null;//价格
				String start_date_active = null;//生效日期
				String end_date_active = null;//失效日期
				
				
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
								list_header_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("list_line_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								list_line_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("inventory_item_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								inventory_item_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("description"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								description = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_num"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_num = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_desc"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_desc = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("product_uom_code"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								product_uom_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("price"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								price = Double.parseDouble(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("start_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								start_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("end_date_active"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								end_date_active = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
					}
				}
				//保存
				
				TdPriceListItem tdPriceListItem =  tdPriceListItemService.findOne(list_line_id);
				if (tdPriceListItem == null)
				{
					tdPriceListItem = new TdPriceListItem();
					tdPriceListItem.setId(list_line_id);
				}
				tdPriceListItem.setPriceListId(list_header_id);
				tdPriceListItem.setDescription(description);
				tdPriceListItem.setListLineId(list_line_id);
				tdPriceListItem.setItemNum(item_num);
				tdPriceListItem.setItemDesc(item_desc);
				tdPriceListItem.setProductUomCode(product_uom_code);
				tdPriceListItem.setPrice(price);
				tdPriceListItem.setGoodsId(inventory_item_id);
				
				tdPriceListItemService.save(tdPriceListItem);
			}
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_INV_ITEMS_OUT"))//TdGoods
		{
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Long inventory_item_id = null; //物料ID
				String item_code = null;//物料编号
				String item_description = null;//物料描述
				String item_barcode= null;//产品条码
				Long inv_category_id = null;//库存分类ID
				Long brad_category_id = null;//品牌分类ID
				Long product_category_id = null;//物理分类ID
				String item_type_name = null;//物料类型名称
				String item_type_code = null;//物料类型CODE
				Integer inventory_item_status = null;//物料状态 0 失效，1 有效
				String product_flag = null;//产品标识 LYZ乐易装,HR华润
				Double attribute1 = null;//采购价
				
				
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
						else if (childNode.getNodeName().equalsIgnoreCase("item_code"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_description"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_description = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_barcode"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_barcode = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_type_name"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_type_name = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("item_type_code"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								item_type_code = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("inv_category_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								inv_category_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("brad_category_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								brad_category_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("inventory_item_status"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								inventory_item_status = Integer.parseInt(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("product_category_id"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								product_category_id = Long.parseLong(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("product_flag"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								product_flag = childNode.getChildNodes().item(0).getNodeValue();
							}
						}
						else if (childNode.getNodeName().equalsIgnoreCase("attribute1"))
						{
							if (null != childNode.getChildNodes().item(0))
							{
								attribute1 = Double.parseDouble(childNode.getChildNodes().item(0).getNodeValue());
							}
						}
					}
				}
				//保存
				TdGoods tdGoods = null;
				if (inv_category_id != null)
				{
				 tdGoods = tdGoodsService.findOne(inventory_item_id);
				}
				if (tdGoods == null)
				{
					tdGoods = new TdGoods();
					tdGoods.setId(inventory_item_id);
				}
				tdGoods.setCode(item_code);
				tdGoods.setDetail(item_description);
				tdGoods.setItemBarcode(item_barcode);
				tdGoods.setBradCategoryId(brad_category_id);
				tdGoods.setProductCategoryId(product_category_id);
				tdGoods.setItemTypeName(item_type_name);
				tdGoods.setItemTypeCode(item_type_code);
				if (inventory_item_status == 0)
				{
					tdGoods.setIsOnSale(false);
				}
				else
				{
					tdGoods.setIsOnSale(true);
				}
				if (product_flag.equalsIgnoreCase("LYZ"))
				{
					tdGoods.setBelongTo(2L);
				}
				else
				{
					tdGoods.setBelongTo(1L);
				}
				tdGoods.setAttribute1(attribute1);
				tdGoodsService.save(tdGoods, "数据导入");
			}
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}
		else if (STRTABLE.equalsIgnoreCase("CUXAPP_INV_ITEM_CATES_OUT"))
		{
			return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
		}

		return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>不支持的表数据传输</MESSAGE></STATUS></RESULTS>";
	}
}
// END SNIPPET: service
