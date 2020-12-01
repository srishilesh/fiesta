

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
 * Servlet implementation class UpdateEventIntermediateServlet
 */
@WebServlet("/updateEventID")
public class UpdateEventIntermediateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEventIntermediateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		System.out.println("Inside Update Event Intermediate - GET");
		try {  
			Class.forName("com.mysql.cj.jdbc.Driver");
			String path_to_db = "jdbc:mysql://localhost:3306/fiesta";
			String username = "root";
			String password = "root";
			Connection con = DriverManager.getConnection(path_to_db, username, password);
			
			ArrayList<ArrayList<String>> event_ids = new ArrayList<ArrayList<String>>();
			PreparedStatement stmt = con.prepareStatement("select event_id, event_name from fiesta.table_event");
			ResultSet rst = stmt.executeQuery();
			while (rst.next()) {
				ArrayList<String> tmp = new ArrayList<String>();
				tmp.add(rst.getInt(1)+"");
				tmp.add(rst.getString(2));
				// event_ids.add(rst.getInt(1)+"");
				event_ids.add(tmp);
			}				
			
			con.close();
			request.setAttribute("event_ids", event_ids);
			System.out.println(event_ids);
			request.getRequestDispatcher("Events/update_event_intermediate.jsp").forward(request, response);
		}
		catch(Exception e) {
			System.out.println(e);
		} 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String event_id = request.getParameter("event_id");
		System.out.println("Inside Update Event Intermediate - POST");
		try {
			response.sendRedirect(request.getContextPath()+"/updateEvent");
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
