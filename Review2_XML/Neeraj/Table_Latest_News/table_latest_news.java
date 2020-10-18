import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.sql.*;
import java.io.File;

public class table_latest_news {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/review2", "root", "neeraj11");
		if (con != null)
			System.out.println("Database connected!");
		else
			System.out.println("Database not connected!");

         File id_counter_xmlfile = new File("src/table_latest_news.xml");
        
		 DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		 DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		 Document doc = docBuilder.parse(id_counter_xmlfile);
		 doc.getDocumentElement().normalize();
		 NodeList rows = doc.getElementsByTagName("root");

		 for (int i = 0; i < rows.getLength(); i++) {
		 	Node row = rows.item(i);

		 	if (row.getNodeType() == Node.ELEMENT_NODE) {
		 		Element rowElement = (Element) row;

		 		NodeList studentID = rowElement.getElementsByTagName("News_id");
		 		Element studentElement = (Element) studentID.item(0);
		 		NodeList textFNList = studentElement.getChildNodes();
                String tmp = ((Node) textFNList.item(0)).getNodeValue().trim();
                int student = Integer.parseInt(tmp);
				
		 		 NodeList teamID = rowElement.getElementsByTagName("News_title");
		 		 Element teamElement = (Element) teamID.item(0);
		 		 NodeList textLNList = teamElement.getChildNodes();
                 tmp = ((Node) textLNList.item(0)).getNodeValue().trim();
                 int team =  Integer.parseInt(tmp);
				 
		 		NodeList eventID = rowElement.getElementsByTagName("News_message");
		 		Element eventElement = (Element) eventID.item(0);
		 		NodeList textLNList1 = eventElement.getChildNodes();
                 tmp = ((Node) textLNList1.item(0)).getNodeValue().trim();
                 int event = Integer.parseInt(tmp);
                 
                 NodeList announcmentID = rowElement.getElementsByTagName("News_link");
 		 		Element announcementElement = (Element) announcmentID.item(0);
 		 		NodeList textLNList2 = announcementElement.getChildNodes();
                  tmp = ((Node) textLNList2.item(0)).getNodeValue().trim();
                  int announcement = Integer.parseInt(tmp);
                  
		 		String query = "insert into review2.latest_news values (?,?,?,?)";
		 		PreparedStatement stmt = con.prepareStatement(query);
				
		 		stmt.setInt(1, student);
		 		stmt.setInt(2, team);
		 		stmt.setInt(3, event);
		 		stmt.setInt(4, announcement);
		 		
		 		if (stmt.executeUpdate() == 1) {
		 		 	System.out.println("Successful execution");
		 		 } else {
		 		 	System.out.println("Unsuccessful");
		 		}
		 	}
		 }
		 con.close();
	}
}
