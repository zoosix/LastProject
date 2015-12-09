package com.stock.dao;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.ParseConversionEvent;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

public class RSSReader {
	private static RSSReader instance = null;
	private URL rssURL;

	private RSSReader() {}

   public static RSSReader getInstance() {
      if (instance == null)
         instance = new RSSReader();
      return instance;
   }

   public void setURL(URL url) {
      rssURL = url;
   }

   public List<RssVO> writeFeed() {
	   List<RssVO> list=new ArrayList<RssVO>();
	   try {
		   DocumentBuilder builder = DocumentBuilderFactory.newInstance().newDocumentBuilder();
		   Document doc = builder.parse(rssURL.openStream());
		   NodeList items = doc.getElementsByTagName("item");
		   for (int ii = 0; ii < items.getLength(); ii++) {
			   Element item = (Element) items.item(ii);
			   RssVO rvo=new RssVO();
			   rvo.setTitle(getValue(item, "title"));
			   rvo.setDescription(getValue(item, "description"));
			   rvo.setLink(getValue(item, "link"));
			   list.add(rvo);
		   }
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   return list;
   }

   public String getValue(Element parent, String nodeName) {
      return parent.getElementsByTagName(nodeName).item(0).getFirstChild().getNodeValue();
   }
}
