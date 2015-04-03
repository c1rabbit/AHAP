package core;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import process.VitalBean;

@WebServlet("/Chart")
public class Chart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Chart() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getSession().getAttribute("user").toString();
		} catch (Exception e) {
			response.sendRedirect("Login");
			return;
		}
		
		request.getRequestDispatcher("Chart.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
		String result = "";
		String type = request.getParameter("type");
		JSONObject jo = new JSONObject();
		double dataValue = 0;
		
		String username = (String)request.getSession().getAttribute("user");
		
		VitalBean vb = new VitalBean(username, 1);
		
		if (type.equals("BT")) {
			dataValue = vb.getBodyTemp();
		} else if (type.equals("HR")) {
			dataValue = vb.getHeartRate();
		} else if (type.equals("RR")) {
			dataValue = vb.getRespiratoryRate();
		} else if (type.equals("BP")) {
			dataValue = vb.getBloodPressureSys();
		} else if (type.equals("LDL")) {
			dataValue = vb.getLdlCholesterol();
		}
		
		try {
			jo.put("DATA", dataValue);
			result = jo.toString();
		} catch (Exception e){
			e.printStackTrace();
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(result);
	}
}
