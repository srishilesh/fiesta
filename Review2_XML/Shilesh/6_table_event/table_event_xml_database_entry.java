import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import java.sql.*;
import java.io.File;
import java.io.FileInputStream;

public class table_event_xml_database_entry {
	public static void main(String[] args) throws Exception {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys", "root", "root");
		if (con != null)
			System.out.println("Database connected! \n");
		else
			System.out.println("Database not connected! \n");

        File event_xmlfile = new File("./src/table_event.xml");
        
		DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
		Document doc = docBuilder.parse(event_xmlfile);
		doc.getDocumentElement().normalize();
		NodeList events = doc.getElementsByTagName("event");
		
		
		for (int i = 0; i < events.getLength(); i++) {
			int eventid = 0, eventType = 0, maxParticipants = 10;
			String eventname = "", eventdesc = "", startDateTime = "", endDateTime = "", eventVenue = "", registrationLink = "";
			String organizerCollege = "", organizerCampus = "", organizerOther = "", organizerName = "";
			String organizerEmail = "", organizerPhone = "", organizerDetails = "", tags = "", poster="";
			FileInputStream fileread = null;
			
			Node row = events.item(i);

			if (row.getNodeType() == Node.ELEMENT_NODE) {
				Element rowElement = (Element) row;

				try {
					NodeList eventID = rowElement.getElementsByTagName("event_id");
					Element eventElement = (Element) eventID.item(0);
					NodeList textFNList = eventElement.getChildNodes();
					String eventno = ((Node) textFNList.item(0)).getNodeValue().trim();
					eventid = Integer.parseInt(eventno);
				}
				catch(Exception e) {
					System.out.println("Event ID: null");
				}
				
				try {
					NodeList eventNameList = rowElement.getElementsByTagName("event_name");
					 Element eventNameElement = (Element) eventNameList.item(0);
					 NodeList textLNList = eventNameElement.getChildNodes();
					 eventname = ((Node) textLNList.item(0)).getNodeValue().trim();
				}
				catch (Exception e) {
					System.out.println("Event Name: null");
				}
								 
				try {
					NodeList eventDescList = rowElement.getElementsByTagName("event_desc");
					Element eventDescElement = (Element) eventDescList.item(0);
					NodeList textLNList1 = eventDescElement.getChildNodes();
					eventdesc = ((Node) textLNList1.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Event Description: null");
				}

				// WRITE FOR EVENT_TAGS
				try {
					NodeList eventTagsList = rowElement.getElementsByTagName("event_tags");
					for (int j = 0; j < eventTagsList.getLength(); j ++) {
						Node tag = eventTagsList.item(j);

						if (tag.getNodeType() == Node.ELEMENT_NODE) {
							Element tagElement = (Element) tag;
							
							NodeList tagList = tagElement.getElementsByTagName("tag");
							Element aa = (Element) tagList.item(j);
							NodeList bb = aa.getChildNodes();
							tags += ((Node) bb.item(j)).getNodeValue().trim();
						}
					}
//					System.out.println("TAGS LENGTH: " + tags);
				}
				catch(Exception e) {
					System.out.println("Tags: null");
				}

				try {
					NodeList eventTypeList = rowElement.getElementsByTagName("event_type_participation");
					Element eventTypeElement = (Element) eventTypeList.item(0);
					NodeList textLNList2 = eventTypeElement.getChildNodes();
					String eventype = ((Node) textLNList2.item(0)).getNodeValue().trim();
					eventType = 0;
					if (eventype.equals("Team"))
						eventType = 1;
					else
						eventType = 0;
				}
				catch(Exception e) {
					System.out.println("Event Type: null");
				}
				
				try {
					NodeList startdatetimeList = rowElement.getElementsByTagName("event_start_datetime");
					Element startdatetimeElement = (Element) startdatetimeList.item(0);
					NodeList aa = startdatetimeElement.getChildNodes();
					startDateTime = ((Node) aa.item(0)).getNodeValue().trim();

					NodeList enddatetimeList = rowElement.getElementsByTagName("event_end_datetime");
					Element enddatetimeElement = (Element) enddatetimeList.item(0);
					NodeList bb = enddatetimeElement.getChildNodes();
					endDateTime = ((Node) bb.item(0)).getNodeValue().trim();

				}
				catch(Exception e) {
					System.out.println("Date & Time: null");
				}
				
				try {
					NodeList eventVenueList = rowElement.getElementsByTagName("event_venue");
					Element eventVenueElement = (Element) eventVenueList.item(0);
					NodeList cc = eventVenueElement.getChildNodes();
					eventVenue = ((Node) cc.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Event Venue: null");
				}
				
				try {
					NodeList eventMaxList = rowElement.getElementsByTagName("event_max_participants");
					Element eventMaxElement = (Element) eventMaxList.item(0);
					NodeList textLNList4 = eventMaxElement.getChildNodes();
					String maxparticipants = ((Node) textLNList4.item(0)).getNodeValue().trim();
					maxParticipants = Integer.parseInt(maxparticipants);
				}
				catch(Exception e) {
					System.out.println("Max participants: null");
				}
				
				
				try {
					NodeList linkList = rowElement.getElementsByTagName("event_registration_link");
					Element linkElement = (Element) linkList.item(0);
					NodeList textLNList5 = linkElement.getChildNodes();
					registrationLink = ((Node) textLNList5.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Registration link: null");
				}
				
				try {
					NodeList organizerCollegeList = rowElement.getElementsByTagName("event_organizer_college");
					Element organizerCollegeElement = (Element) organizerCollegeList.item(0);
					NodeList dd = organizerCollegeElement.getChildNodes();
					organizerCollege = ((Node) dd.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizing college: null");
				}
				
				try {
					NodeList organizerCampusList = rowElement.getElementsByTagName("event_organizer_campus");
					Element organizerCampusElement = (Element) organizerCampusList.item(0);
					NodeList ee = organizerCampusElement.getChildNodes();
					organizerCampus = ((Node) ee.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizing campus: null");
				}
				

				try {
					NodeList organizerOtherList = rowElement.getElementsByTagName("event_organizer_other");
					Element organizerOtherElement = (Element) organizerOtherList.item(0);
					NodeList ff = organizerOtherElement.getChildNodes();
					organizerOther = ((Node) ff.item(0)).getNodeValue().trim();
					System.out.println(organizerOther);
				}
				catch(Exception e) {
					System.out.println("Other organizer: null");
				}
				
				try {
					NodeList organizerNameList = rowElement.getElementsByTagName("event_organizer_name");
					Element organizerNameElement = (Element) organizerNameList.item(0);
					NodeList gg = organizerNameElement.getChildNodes();
					organizerName = ((Node) gg.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizer name: null");
				}
				
				try {
					NodeList organizerEmailList = rowElement.getElementsByTagName("event_organizer_email");
					Element organizerEmailElement = (Element) organizerEmailList.item(0);
					NodeList hh = organizerEmailElement.getChildNodes();
					organizerEmail = ((Node) hh.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizer email: null");
				}
				
				try {
					NodeList organizerPhoneList = rowElement.getElementsByTagName("event_organizer_phone");
					Element organizerPhoneElement = (Element) organizerPhoneList.item(0);
					NodeList ii = organizerPhoneElement.getChildNodes();
					organizerPhone = ((Node) ii.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizer phone: null");
				}
				
				try {
					NodeList organizerDetailsList = rowElement.getElementsByTagName("event_organizer_details");
					Element organizerDetailsElement = (Element) organizerDetailsList.item(0);
					NodeList jj = organizerDetailsElement.getChildNodes();
					organizerDetails = ((Node) jj.item(0)).getNodeValue().trim();
				}
				catch(Exception e) {
					System.out.println("Organizer details: null");
				}
				
				try {
//					File file = new File(poster);
//					fileread = new FileInputStream(file);
				}
				catch(Exception e) {
					System.out.println("Event poster: null");
				}
				
//				PRINTING OUT THE STATEMENTS
//				System.out.println(eventid);
//				System.out.println(eventname);
//				System.out.println(eventdesc);
//				System.out.println(eventType);
//				System.out.println(startDateTime);
//				System.out.println(endDateTime);
//				System.out.println(eventVenue);
//				System.out.println(maxParticipants);
//				System.out.println(registrationLink);
//				System.out.println(organizerCollege);
//				System.out.println(organizerCampus);
//				System.out.println(organizerOther);
//				System.out.println(organizerName);
//				System.out.println(organizerEmail);
//				System.out.println(organizerPhone);
//				System.out.println(organizerDetails);
//				System.out.println();
				
				String query = "insert into fiesta.table_event values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement stmt = con.prepareStatement(query);
				
				stmt.setInt(1, eventid);
				stmt.setString(2, eventname);
				stmt.setString(3, eventdesc);
				stmt.setString(4, tags);
				stmt.setInt(5, eventType);
				stmt.setString(6, eventVenue);
				stmt.setInt(7, maxParticipants);
				stmt.setString(8, organizerCollege);
				stmt.setString(9, organizerCampus);
				stmt.setString(10, organizerName);
				stmt.setString(11, organizerEmail);
				stmt.setString(12, organizerPhone);
				stmt.setString(13, organizerDetails);
				stmt.setBinaryStream(14, fileread);
				stmt.setString(15, organizerOther);
				stmt.setString(16, registrationLink);
				stmt.setString(17, startDateTime);
				stmt.setString(18, endDateTime);

				try {
					int q = stmt.executeUpdate();
					System.out.println("Inserted successfully! \n");
				}
				catch(Exception e) {
					System.out.println("Either the data has already been inserted or its an error during insertion!! \n");
				}
				
			}
		}
		con.close();
	}
}
