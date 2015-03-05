package process;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/Analyze")
public class Analyze extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Analyze() {
		super();

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		JSONObject json = new JSONObject();

		String username = (String) request.getSession().getAttribute("user");
		Process get = new Process(username);
		
		json = get.getJson();
		
		// end of analyze
		System.out.println(username + ": " + json.toString());
		
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json.toString());

	}
}
