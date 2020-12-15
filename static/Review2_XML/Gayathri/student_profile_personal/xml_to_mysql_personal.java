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

public class xml_to_mysql_personal{
public static void main ( String [] args ) throws Exception {

		Class.forName ("com.mysql.cj.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta", "admin", "nithin_aakash");
		
        System.out.println("JDBC CONNECTION SUCCESSFUL!");
		
		
		Statement stmt = con.createStatement ();
		
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance ();
		
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder ();
		Document doc = docBuilder.parse (new File("src/student_profile_personal.xml "));
		doc.getDocumentElement().normalize();
		NodeList listOfrecords = doc.getElementsByTagName("profile-personal");
		
		
		for ( int s = 0 ; s < listOfrecords.getLength(); s++) {
				int id = 0, year = 0;
				String temp = "", dob = "", dept="", about="", school="";
				String m1 = "", m2 = "", m3 = "", phone = "", address = "";
			
				Node firstrecordNode = listOfrecords.item(s);
				/*if ( firstCerealNode.getNodeType() == Node.ELEMENT_NODE ) {*/
				Element firstrecordElement = (Element) firstrecordNode ;
				
				try {
				NodeList idList = firstrecordElement.getElementsByTagName("student_id");
				Element idElement = (Element) idList.item(0);
				NodeList textidList = idElement . getChildNodes ();
				temp = ((Node) textidList.item(0)).getNodeValue().trim();
				id = Integer.parseInt(temp);
				}
				
				catch(Exception e){
					System.out.println("Student ID cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList dobList = firstrecordElement.getElementsByTagName ("student_dob");
				Element dobElement = (Element) dobList.item(0);
				NodeList textdobList = dobElement.getChildNodes();
				dob = ((Node) textdobList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Student DOB cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList yearList = firstrecordElement.getElementsByTagName ("student_year_of_study");
				Element yearElement = (Element) yearList.item(0);
				NodeList textyearList = yearElement.getChildNodes();
				temp = ((Node) textyearList.item(0)).getNodeValue().trim();
				year = Integer.parseInt(temp);
				}
				
				catch(Exception e) {
					System.out.println("Year of study cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList deptList = firstrecordElement.getElementsByTagName ("student_dept");
				Element deptElement = (Element) deptList.item(0);
				NodeList textdeptList = deptElement.getChildNodes();
				dept = ((Node) textdeptList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Student department cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList aboutList = firstrecordElement.getElementsByTagName ("student_about_myself");
				Element aboutElement = (Element) aboutList.item(0);
				NodeList textaboutList = aboutElement.getChildNodes();
				about = ((Node) textaboutList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("About student cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList phoneList = firstrecordElement.getElementsByTagName ("student_phone");
				Element phoneElement = (Element) phoneList.item(0);
				NodeList textphoneList = phoneElement.getChildNodes();
				phone = ((Node) textphoneList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Phone value not provided, is null for the stu_id: " + id );
				}
				
				try {
				NodeList schoolList = firstrecordElement.getElementsByTagName ("student_school");
				Element schoolElement = (Element) schoolList.item(0);
				NodeList textschoolList = schoolElement.getChildNodes();
				school = ((Node) textschoolList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("School of student cannot be null");
					System.exit(0); 
				}
				
				try {
				NodeList addressList = firstrecordElement.getElementsByTagName ("student_address");
				Element addressElement = (Element) addressList.item(0);
				NodeList textaddressList = addressElement.getChildNodes();
				address = ((Node) textaddressList.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Address value not provided, is null for the stu_id: " + id );
				}
				
				try {
				NodeList m1List = firstrecordElement.getElementsByTagName ("student_socialmedia_1");
				Element m1Element = (Element) m1List.item(0);
				NodeList textm1List = m1Element.getChildNodes();
				m1 = ((Node) textm1List.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Social media 1 not provided, is null for the stu_id: " + id);
				}
				
				try {
				NodeList m2List = firstrecordElement.getElementsByTagName ("student_socialmedia_2");
				Element m2Element = (Element) m2List.item(0);
				NodeList textm2List = m2Element.getChildNodes();
				m2 = ((Node) textm2List.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Social media 2 not provided, is null for the stu_id: " + id);
				}
				
				try {
				NodeList m3List = firstrecordElement.getElementsByTagName ("student_socialmedia_3");
				Element m3Element = (Element) m3List.item(0);
				NodeList textm3List = m3Element.getChildNodes();
				m3 = ((Node) textm3List.item(0)).getNodeValue().trim();
				}
				
				catch(Exception e) {
					System.out.println("Social media 3 not provided, is null for the stu_id: " + id);
				}
				
				String query = "insert into table_student_profile_personal values(' " + id + " ',' " + dob + " ',' " + year + " ',' " + dept + " ',' " + about + " ',' " + phone + " ',' " + school + " ',' " + address + " ',' " + m1 + " ',' " + m2 + " ',' " + m3 + "') ";
				
				
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