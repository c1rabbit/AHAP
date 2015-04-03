package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/Login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ConfigBean cb = new ConfigBean();
		
		Connection c = null;
        try {
        	Class.forName("com.mysql.jdbc.Driver");
            c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(), cb.getPassword());
            
            Statement stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("select username, password from users");

            while(rs.next()) {
                if (rs.getString("username").equals(username) && rs.getString("password").equals(password)) {
                	request.getSession().setAttribute("user", username);
        			response.sendRedirect("Main");
        			return;
                }
            }
            response.sendRedirect("Login?error=0");
            
            c.close();
        } catch(Exception e) {
            throw new ServletException(e);
        }
	}
}