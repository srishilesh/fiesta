

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddPersonalServlet
 */
@WebServlet("/addPersonal")
public class AddPersonalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddPersonalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int student_id = getStudentID(request);
		ResultSet rst = null;
		ArrayList<String> personalDetails = new ArrayList<String>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");				
			String query = "select * from fiesta.table_student_profile_personal where student_id=?";
			PreparedStatement stmt = con.prepareStatement(query);
			stmt.setInt(1, student_id);
			rst = stmt.executeQuery();
			System.out.println("Queried Personal Details successfully!");
			
			if (rst.next() == false) {
				System.out.println("Inside loop");
				for (int i = 0; i < 12; i ++) {
					personalDetails.add("");
				}
				System.out.println(personalDetails);
			}
			else {
				if ((rst.getInt(1)+"").equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getInt(1)+"");
				if (rst.getString(2).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(2));
				if (rst.getString(3).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(3));
				if (rst.getString(4).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(4));
				if (rst.getString(5).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(5));
				if (rst.getString(6).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(6));
				if (rst.getString(7).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(7));
				if (rst.getString(8).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(8));
				if (rst.getString(9).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(9));
				if (rst.getString(10).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(10));
				if (rst.getString(10).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(11));
				if (rst.getString(10).equals(""))
					personalDetails.add("");
				else
					personalDetails.add(rst.getString(12));
			}
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		request.setAttribute("personalDetails", personalDetails);
		request.getRequestDispatcher("Student%20pages/profile/personal.jsp").forward(request, response);
//		response.sendRedirect("Student%20pages/profile/personal.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String name = request.getParameter("name");
		String regno = request.getParameter("reg_no");
		String graduation = request.getParameter("graduation");
		String dept = request.getParameter("dept");
		String dob = request.getParameter("dob");
		String school = request.getParameter("school");
		String skill1 = request.getParameter("skill1");
		String skill2 = request.getParameter("skill2");
		String skill1_rating = request.getParameter("skill1_rating");
		String skill2_rating = request.getParameter("skill2_rating");
		String address = request.getParameter("address");
		String aboutme = request.getParameter("aboutme");
		int student_id = getStudentID(request);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String query = "DELETE from fiesta.table_student_profile_personal where student_id=?";
			PreparedStatement stmt = con.prepareStatement(query);		
			stmt.setInt(1, student_id);
			int i = stmt.executeUpdate();
			System.out.println("Deleted Personal Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		
		insertIntoDatabase(student_id, name, regno, graduation, dept, dob, school, skill1, skill2, skill1_rating, skill2_rating, address, aboutme);
		response.sendRedirect(request.getContextPath() +"/studentHome");
		
	}
	
	public static int getStudentID(HttpServletRequest request) {
		Cookie cookie = null;
		Cookie[] cookies = null;
		  
		// Get an array of Cookies associated with this domain
		String student_id_str = "";
		cookies = request.getCookies();
		if( cookies != null ) {
			// System.out.println("Found Cookies Name and Value");
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (cookie.getName().equals("student_id"))
					student_id_str = cookie.getValue();
			}
		} 
		else {
			System.out.println("No cookies founds");
		}
		int student_id = 0;
		if (student_id_str.equals(""))
			student_id = 0;
		else
			student_id = Integer.parseInt(student_id_str);
		return student_id;
		
	}
	
	public static void insertIntoDatabase(int student_id, String name, String regno, String graduation, String dept,
			String dob, String school, String skill1, String skill2, String skill1_rating, String skill2_rating,
			String address, String aboutme) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			
			System.out.println("-------------- STUDENT - ADD PERSONAL DETAILS -------------------"); 
					
			String query = "insert into fiesta.table_student_profile_personal values (?,?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement stmt = con.prepareStatement(query);
			
			
			stmt.setInt(1, student_id);
			stmt.setString(2, dob);
			stmt.setString(3, graduation);
			stmt.setString(4, dept);
			stmt.setString(5, aboutme);
			stmt.setString(6, school);
			stmt.setString(7, address);
			stmt.setString(8, regno);
			stmt.setString(9, skill1);
			stmt.setString(10, skill2);
			stmt.setString(11, skill1_rating);
			stmt.setString(12, skill2_rating);
			

			
			int i = stmt.executeUpdate();
			System.out.println("Inserted Personal Details successfully!");
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
	}
}
