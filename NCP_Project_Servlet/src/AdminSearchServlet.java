

import java.io.IOException;
import java.sql.Connection;
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
 * Servlet implementation class AdminSearchServlet
 */
@WebServlet("/adminSearch")
public class AdminSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		ArrayList<ArrayList<String>> leads = new ArrayList<ArrayList<String>>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sys","root","root");
			String select_leads = "select r.student_id, student_name, student_score, student_skill1, student_skill2\r\n" + 
					"from fiesta.table_student_registration r inner join fiesta.table_student_scores s on r.student_id = s.student_id\r\n" + 
					"inner join fiesta.table_student_profile_personal pp on pp.student_id = r.student_id;";
			PreparedStatement stmt = con.prepareStatement(select_leads);
			ResultSet rst = stmt.executeQuery();
			int cnt_leads = 0;
			while (rst.next()) {
				ArrayList<String> temp = new ArrayList<String>();
				temp.add(rst.getInt(1)+"");
				temp.add(rst.getString(2));
				temp.add(rst.getInt(3)+"");
				temp.add(rst.getString(4));
				temp.add(rst.getString(5));
				leads.add(temp);
				cnt_leads += 1;
			}					
		}
		catch(Exception e) {
			System.out.println(e);
			System.exit(1);
		}
		request.setAttribute("search", leads);
		request.getRequestDispatcher("Search/search_tags.jsp").forward(request, response);
		// response.sendRedirect("Search/search_tags.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
