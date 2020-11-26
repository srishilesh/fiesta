

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/adminLogin")
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.sendRedirect("Login%20pages/login_admin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		String email = request.getParameter("email");
		String pword = request.getParameter("password");
		System.out.println("Admin Login");
		System.out.println("Email: " + email);
		System.out.println("Password: " + pword);
		if (email.equals("admin@gmail.com") && pword.equals("admin")) {
			System.out.println("Login successful");
			try {
//				response.setContentType("text/html");
//				PrintWriter out = response.getWriter();
//			    out.println("\n\n<h1>" + "Login Successful !!" + "</h1>");
//			    out.close();
				response.sendRedirect("Admin/admin_home.jsp");
			}
			catch(Exception e) {
				System.out.println(e);
			}
		}
		else {
			System.out.println("Login unsuccessful");
		}
	}

}
