import java.io.* ;
import java.util.* ;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class xml_to_mysql_achievement{
public static void main ( String [] args ) throws Exception {

		Class.forName ("com.mysql.cj.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta", "admin", "nithin_aakash");
		
        System.out.println("JDBC CONNECTION SUCCESSFUL!");
		
		
		Statement stmt = con.createStatement ();
		
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance ();
		
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder ();
		Document doc = docBuilder.parse (new File("src/student_profile_achievement.xml "));
		doc.getDocumentElement().normalize();
		NodeList listOfAchievements = doc.getElementsByTagName("achievement");
		
		for ( int s = 0 ; s < listOfAchievements.getLength(); s++) {
			
				int id = 0;
				String ach = ""; 
				
				Node firstAchievementNode = listOfAchievements.item(s);
				/*if ( firstCerealNode.getNodeType() == Node.ELEMENT_NODE ) {*/
				Element firstAchievementElement = (Element) firstAchievementNode ;
				
				try {
				NodeList idList = firstAchievementElement.getElementsByTagName("student_id");
				Element idElement = (Element) idList.item(0);
				NodeList textidList = idElement . getChildNodes ();
				String temp = ((Node) textidList.item(0)).getNodeValue().trim();
				id = Integer.parseInt(temp);
				}
				catch(Exception e) {
					System.out.println("Student ID cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList achList = firstAchievementElement.getElementsByTagName ("student_achievement");
				Element achElement = (Element) achList.item(0);
				NodeList textachList = achElement.getChildNodes();
				ach = ((Node) textachList.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Student achievement cannot be null");
					System.exit(0); 
				}
				
				String query = "insert into table_student_profile_achievements values(' " + id + " ',' " + ach + "') ";
				
				
				if ( stmt.executeUpdate(query) == 1 ) {
				System.out.println(" Successful entry of row " + (s+1));
				} else {
				System.out.println(" Execution Failed at row " + (s+1));
				}
				
		}
		con.close ();
		System.out.println("SUCCESSFUL INSERTION FROM XML TO DATABASE ");
	}
}
