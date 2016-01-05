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

import javax.jws.WebService;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.geronimo.mail.util.Base64;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

import com.ynyes.lyz.webservice.ICallEBS;

@WebService
public class CallEBSImpl implements ICallEBS {

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

		if (STRTABLE.equalsIgnoreCase("CUXAPP_AR_CUST_STORES_OUT")) 
		{
			// 解析XML
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = null;
			try 
			{
				builder = factory.newDocumentBuilder();
			} catch (ParserConfigurationException e) 
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
			
			for (int i = 0; i < nodeList.getLength(); i++)
			{
				Node node = nodeList.item(i);
				NodeList childNodeList = node.getChildNodes();
				
				for (int idx = 0; idx < childNodeList.getLength(); idx++)
				{
					Node childNode = childNodeList.item(idx);
					
					if (childNode.getNodeType() == Node.ELEMENT_NODE) 
					{
						System.out.println("node.name: " + childNode.getNodeName());
						
						if (null != childNode.getChildNodes().item(0))
						{
							System.out.println("node.value: " + childNode.getChildNodes().item(0).getNodeValue() + "\n");
						}
						else
						{
							
						}
					}
				}

//				if (node.getNodeType() == Node.ELEMENT_NODE) 
//				{
//					System.out.println("node.name: " + node.getNodeName());
//					System.out.println("node.value: " + node.getNodeValue() + "\n");
//					
//					if (node.getNodeName().equals("SOB_ID"))
//					{
//						String test = node.getNodeValue();
//					}
//					
////					Element elem = (Element) node;
//
////					NodeList name = elem.getElementsByTagName("SOB_ID");
////					Element line = (Element) name.item(0);
////					
////					Integer customer_id = Integer.parseInt(elem.getElementsByTagName("customer_id")
////							.item(0).getChildNodes().item(0).getNodeValue());
////					
////					String customer_number = elem.getElementsByTagName("customer_number")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String customer_name = elem.getElementsByTagName("customer_name")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String store_code = elem.getElementsByTagName("store_code")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String cust_type_code = elem.getElementsByTagName("cust_type_code")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String cust_type_name = elem.getElementsByTagName("cust_type_name")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String dept_code = elem.getElementsByTagName("dept_code")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String dept_desc = elem.getElementsByTagName("dept_desc")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String attribute1 = elem.getElementsByTagName("attribute1")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String attribute2 = elem.getElementsByTagName("attribute2")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String attribute3 = elem.getElementsByTagName("attribute3")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String attribute4 = elem.getElementsByTagName("attribute4")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					String attribute5 = elem.getElementsByTagName("attribute5")
////							.item(0).getChildNodes().item(0).getNodeValue();
////					
////					System.out.println("sob_id: "  + " customer_id:" + customer_id
////							+ "customer_number: " + customer_number 
////							+ "customer_name: " + customer_name
////							+ "store_code: " + store_code
////							+ "cust_type_code: " + cust_type_code
////							+ "cust_type_name: " + cust_type_name
////							+ "dept_code: " + dept_code
////							+ "dept_desc: " + dept_desc
////							+ "attribute1: " + attribute1
////							+ "attribute2: " + attribute2
////							+ "attribute3: " + attribute3
////							+ "attribute4: " + attribute4
////							+ "attribute5: " + attribute5);
//
//					return "<RESULTS><STATUS><CODE>0</CODE><MESSAGE></MESSAGE></STATUS></RESULTS>";
//				}
			}

		}

		return "<RESULTS><STATUS><CODE>1</CODE><MESSAGE>不支持的表数据传输</MESSAGE></STATUS></RESULTS>";
	}
}
// END SNIPPET: service
