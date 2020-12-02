

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GenerateReportInputServlet
 */
@WebServlet("/generateReportInput")
public class GenerateReportInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateReportInputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Generate%20Report/report_input.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
				String category = request.getParameter("inputop");
		        String input = request.getParameter("inp");
				
				ArrayList<ArrayList<String>> report = new ArrayList<ArrayList<String>>();
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
					String select_announcements = "select distinct * from\r\n" + 
							"table_student_profile_achievements a\r\n" + 
							"inner join table_student_profile_contact c on a.student_id = c.student_id\r\n" + 
							"inner join table_student_profile_personal p on c.student_id = p.student_id\r\n" + 
							"where c.student_id=?;";
					PreparedStatement stmt = con.prepareStatement(select_announcements);
					stmt.setInt(1, Integer.parseInt(input));
					ResultSet rst = stmt.executeQuery();
					while (rst.next()) {
						
						ArrayList<String> temp = new ArrayList<String>();
						temp.add(rst.getInt(1)+"");
						temp.add(rst.getString(2));
						temp.add(rst.getDate(3)+"");
						temp.add(rst.getString(4));
						temp.add(rst.getInt(5)+"");
						temp.add(rst.getString(6));
						temp.add(rst.getString(7));
						temp.add(rst.getString(8));
						temp.add(rst.getString(9));
						temp.add(rst.getString(10));
						temp.add(rst.getInt(11)+"");
						temp.add(rst.getString(12));
						temp.add(rst.getString(13)); 
						temp.add(rst.getString(14));
						temp.add(rst.getString(15));
						temp.add(rst.getInt(16)+"");
						temp.add(rst.getDate(17)+"");
						temp.add(rst.getString(18));
						temp.add(rst.getString(19));
						temp.add(rst.getString(20));
						temp.add(rst.getString(21));
						temp.add(rst.getString(22));
						temp.add(rst.getString(23));
						temp.add(rst.getString(24));
						temp.add(rst.getString(25));
						temp.add(rst.getInt(26)+"");
						temp.add(rst.getInt(27)+"");
						report.add(temp);
					}			
					
				}
				catch(Exception e) {
					System.out.println(e);
					System.exit(1);
				}
//				System.out.println(report);
				request.setAttribute("report", report);
				request.getRequestDispatcher("Generate%20Report/report_input.jsp").forward(request, response); 
				
	}

}
