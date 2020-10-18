package project_xml_to_db;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Arrays;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class team_details {
	static private String getTextContent(Node parentNode,String childName) {
	    NodeList nlist = parentNode.getChildNodes();
	    for (int i = 0 ; i < nlist.getLength() ; i++) {
	    Node n = nlist.item(i);
	    String name = n.getNodeName();
	    if ( name != null && name.equals(childName) )
	        return n.getTextContent();
	    }
	    return "";
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");  
			Connection con = DriverManager.getConnection(  
					"jdbc:mysql://localhost:3306/project","root","root"); 
			if (con != null) {
				System.out.println("Connected");						
			}
			else {
				System.out.println("Not Connected");
			}
					 
				
				
			
			
			File file = new File("src/project_xml_to_db/team_details.xml");
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document xmlDoc = builder.parse(file);		

			
			NodeList recordslength= xmlDoc.getElementsByTagName("row");
			
			System.out.println("Number of records available in xml: "+recordslength.getLength());
			
			XPath xpath = XPathFactory.newInstance().newXPath();
			Object res = xpath.evaluate("/team/row",
			                 xmlDoc,
			                 XPathConstants.NODESET);
			
			PreparedStatement stmt = con
				    .prepareStatement("insert into team_details values(?,?,?)");
			
			for (int i = 0 ; i < recordslength.getLength() ; i++) {
				Node node = recordslength.item(i);
//				if(getAttrValue(node, "name")!=null) {
					List<String>columns = Arrays
			    			.asList(getTextContent(node, "id"),
			    			getTextContent(node, "name"),
						    getTextContent(node, "student_id")
						    );					
					for (int n = 0 ; n < columns.size() ; n++) {
						stmt.setString(n+1, columns.get(n));
					}
					stmt.execute();
				}
//			}
						
		}
		catch (Exception e) {
			System.out.println(e);
		}


	}

}
