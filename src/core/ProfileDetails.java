package core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProfileDetails")
public class ProfileDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProfileDetails() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getSession().getAttribute("user").toString();
		} catch (Exception e) {
			response.sendRedirect("Login");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/ProfileDetails.jsp").forward(request, response);
	}
}