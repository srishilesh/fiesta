import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.sql.*;
import java.io.File;

public class table_idcounter_xml_database_entry {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/fiesta", "root", "root");
		if (con != null)
			System.out.println("Database connected!");
		else
			System.out.println("Database not connected!");

         File id_counter_xmlfile = new File("./table_id_counter.xml");
        
		 DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		 DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		 Document doc = docBuilder.parse(id_counter_xmlfile);
		 doc.getDocumentElement().normalize();
		 NodeList rows = doc.getElementsByTagName("root");

		 for (int i = 0; i < rows.getLength(); i++) {
		 	Node row = rows.item(i);

		 	if (row.getNodeType() == Node.ELEMENT_NODE) {
		 		Element rowElement = (Element) row;

		 		NodeList studentID = rowElement.getElementsByTagName("student_id");
		 		Element studentElement = (Element) studentID.item(0);
		 		NodeList textFNList = studentElement.getChildNodes();
                String tmp = ((Node) textFNList.item(0)).getNodeValue().trim();
                int student = Integer.parseInt(tmp);
				
		 		 NodeList teamID = rowElement.getElementsByTagName("team_id");
		 		 Element teamElement = (Element) teamID.item(0);
		 		 NodeList textLNList = teamElement.getChildNodes();
                 tmp = ((Node) textLNList.item(0)).getNodeValue().trim();
                 int team =  Integer.parseInt(tmp);
				 
		 		NodeList eventID = rowElement.getElementsByTagName("event_id");
		 		Element eventElement = (Element) eventID.item(0);
		 		NodeList textLNList1 = eventElement.getChildNodes();
                 tmp = ((Node) textLNList1.item(0)).getNodeValue().trim();
                 int event = Integer.parseInt(tmp);

		 		NodeList announcmentID = rowElement.getElementsByTagName("announcement_id");
		 		Element announcementElement = (Element) announcmentID.item(0);
		 		NodeList textLNList2 = announcementElement.getChildNodes();
                 tmp = ((Node) textLNList2.item(0)).getNodeValue().trim();
                 int announcement = Integer.parseInt(tmp);
				
		 		NodeList contactID = rowElement.getElementsByTagName("contact_id");
		 		Element contactElement = (Element) contactID.item(0);
		 		NodeList textLNList3 = contactElement.getChildNodes();
                 tmp = ((Node) textLNList3.item(0)).getNodeValue().trim();
                 int contact = Integer.parseInt(tmp);
			
		 		NodeList newsID = rowElement.getElementsByTagName("news_id");
		 		Element newsElement = (Element) newsID.item(0);
		 		NodeList textLNList4 = newsElement.getChildNodes();
                 tmp = ((Node) textLNList4.item(0)).getNodeValue().trim();
                 int news = Integer.parseInt(tmp);
				 
		 		String query = "insert into fiesta.table_id_counter values (?,?,?,?,?,?)";
		 		PreparedStatement stmt = con.prepareStatement(query);
				
		 		stmt.setInt(1, student);
		 		stmt.setInt(2, team);
		 		stmt.setInt(3, event);
		 		stmt.setInt(4, announcement);
		 		stmt.setInt(5, contact);
		 		stmt.setInt(6, news);

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
