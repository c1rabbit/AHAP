package core;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Register() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/Register.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username, password1, firstname, lastname, birthday, gender, bloodType, buffer, sql;
		int feet, inches, height, weight;
		Statement stmt;
		PreparedStatement pstmt;
		ConfigBean cb = new ConfigBean();
		
		try {
			username = request.getParameter("username");
			password1 = request.getParameter("password1");
			firstname = request.getParameter("firstname");
			lastname = request.getParameter("lastname");
			birthday = request.getParameter("birthday");
			gender = request.getParameter("gender");
			bloodType = request.getParameter("bloodtype");
			feet = Integer.parseInt(request.getParameter("feet"));
			inches = Integer.parseInt(request.getParameter("inches"));
			weight = Integer.parseInt(request.getParameter("weight"));
		} catch (Exception e) {
			response.sendRedirect("Login?error=1");
			return;
		}
		
		Connection c = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(), cb.getPassword());
			stmt = c.createStatement();
			
			ResultSet rs = stmt.executeQuery("select username from users");
			
			// Duplicated username check
			while (rs.next()) {
				buffer = rs.getString("username");
				if (username.equals(buffer)) {
					response.sendRedirect("Login?username=" + username);
					return;
				}
			}
			
			height = inchesToHeight(feet, inches);
			sql = "insert into users (username, password, firstname, lastname, birthday, gender, blood_type, height, weight) values (?, ?, ?, ?, str_to_date(?, '%m/%d/%Y'), ?, ?, ?, ?)";
			pstmt = c.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, password1);
			pstmt.setString(3, firstname);
			pstmt.setString(4, lastname);
			pstmt.setString(5, birthday);
			pstmt.setString(6, gender);
			pstmt.setString(7, bloodType);
			pstmt.setInt(8, height);
			pstmt.setInt(9, weight);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("Login?register=1");
		} catch (Exception e) {
			throw new ServletException(e);
		} finally {
			try {
				if (c != null)
					c.close();
			} catch (SQLException e) {
				throw new ServletException(e);
			}
		}
	}
	
	private int inchesToHeight(int feet, int inches) {
		return feet * 12 + inches;
	}
}