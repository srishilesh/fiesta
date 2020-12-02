

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;  
/**
 * Servlet implementation class GenerateReportDurationServlet
 */
@WebServlet("/generateReportDuration")
public class GenerateReportDurationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GenerateReportDurationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		
		response.sendRedirect("Generate%20Report/report_duration.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String startDate = (String) request.getParameter("entrydate");
		String endDate = (String) request.getParameter("closedate");
		
		Date fromDate = Date.valueOf(startDate);
		Date toDate = Date.valueOf(endDate);
		
		ArrayList<ArrayList<String>> report = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://database-1.c4hq5iosxryf.us-east-1.rds.amazonaws.com/fiesta","admin","nithin_aakash");
			String select_announcements = "select * from fiesta.table_event where event_start_datetime > ? and event_start_datetime < ?";
			PreparedStatement stmt = con.prepareStatement(select_announcements);
			stmt.setDate(1, fromDate);
			stmt.setDate(2, toDate);
			ResultSet rst = stmt.executeQuery();
			int cnt_report = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getString(3));
//				temp.add(rst.getString(4));
//				temp.add(rst.getInt(5)+"");
//				temp.add(rst.getString(6));
//				temp.add(rst.getInt(7)+"");
				temp.add(rst.getString(8));
				temp.add(rst.getString(9));
//				temp.add(rst.getString(10));
				temp.add(rst.getString(11));
				temp.add(rst.getString(12));
//				temp.add(rst.getString(13)); 
//				temp.add(rst.getString(14));//blob
//				temp.add(rst.getString(15));
//				temp.add(rst.getString(16));
				temp.add(rst.getDate(17)+"");
				temp.add(rst.getDate(18)+"");
				report.add(temp);
				cnt_report += 1;
			}			
			
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		System.out.println(report);
		request.setAttribute("report", report);
		request.getRequestDispatcher("Generate%20Report/report_duration.jsp").forward(request, response); 
		
//		System.out.println(startDate + " " + endDate);
//		doGet(request, response);
	}

}
