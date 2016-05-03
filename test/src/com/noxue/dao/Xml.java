package com.noxue.dao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

public class Xml {
	public Document getDocument(String filename) throws DocumentException {
		
		SAXReader saxReader = new SAXReader();
        Document document = saxReader.read(new File(filename));
        document.setXMLEncoding("utf-8");
		return document;
	}

	public Element getRootElement(Document doc) {
		return doc.getRootElement();
	}
	
	public void WriteToXML(Document doc, String filename) throws IOException{
		
	//	XMLWriter writer = new XMLWriter(new FileWriter(new File(filename)));
		XMLWriter writer = new XMLWriter(new FileOutputStream(filename));
        writer.write(doc); 
        writer.flush();
        writer.close();
	}
}
