package datagenerator;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import core.ConfigBean;

@WebServlet("/DataGenerator")
public class DataGenerator extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Random rand = new Random(1234567879);
	private volatile boolean stopRequested = false;
       
    public DataGenerator() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/DataGenerator.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String generate = null;
		String stop = null;
		String remove = null;
		
		try {
			generate = request.getParameter("generate");
			stop = request.getParameter("stop");
			remove = request.getParameter("remove");
		} catch (Exception e) {}
		
		if (generate != null && stop == null && remove == null) {
			stopRequested = false;

			int counter = 0;
			int dataCount = 200;
			int interval = 1;
			int userId, dataId;
			String dateTime;
			double bodyMin, bodyMax, pulseMin, pulseMax, respirationMin, respirationMax, systolicMin, systolicMax, diastolicMin, diastolicMax, 
				ldlMin, ldlMax, hdlMin, hdlMax, triglyceridesMin, triglyceridesMax;
			Statement stmt;
			ResultSet rs;
			boolean wait = true;
			ConfigBean cb = new ConfigBean();
			
			try {
				dataCount = Integer.parseInt(request.getParameter("datacount"));
			} catch (Exception e) {
				System.out.println("Warning: the data count is blank.");
			}
			
			try {
				interval = Integer.parseInt(request.getParameter("interval"));
			} catch (Exception e) {
				wait = false;
				System.out.println("Warning: the time interval is blank.");
			}
			
			try {
				userId = Integer.parseInt(request.getParameter("userid"));
				bodyMin = Double.parseDouble(request.getParameter("body_min"));
				bodyMax = Double.parseDouble(request.getParameter("body_max"));
				pulseMin = Double.parseDouble(request.getParameter("pulse_min"));
				pulseMax = Double.parseDouble(request.getParameter("pulse_max"));
				respirationMin = Double.parseDouble(request.getParameter("respiration_min"));
				respirationMax = Double.parseDouble(request.getParameter("respiration_max"));
				systolicMin = Double.parseDouble(request.getParameter("systolic_min"));
				systolicMax = Double.parseDouble(request.getParameter("systolic_max"));
				diastolicMin = Double.parseDouble(request.getParameter("diastolic_min"));
				diastolicMax = Double.parseDouble(request.getParameter("diastolic_max"));
				ldlMin = Double.parseDouble(request.getParameter("ldl_min"));
				ldlMax = Double.parseDouble(request.getParameter("ldl_max"));
				hdlMin = Double.parseDouble(request.getParameter("hdl_min"));
				hdlMax = Double.parseDouble(request.getParameter("hdl_max"));
				triglyceridesMin = Double.parseDouble(request.getParameter("triglycerides_min"));
				triglyceridesMax = Double.parseDouble(request.getParameter("triglycerides_max"));
			} catch (Exception e) {
				response.sendRedirect("DataGenerator?good=0");
				return;
			}
			
			Connection c = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(), cb.getPassword());
				stmt = c.createStatement();
				
				System.out.println("DATA GENERATION STARTED");
				
				while (!stopRequested) {
					if (counter == dataCount)
						break;
					
					dateTime = currentDateTime();
					
					// Body temperature
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (1, " + random(bodyMin, bodyMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Body Temperature generated at " + dateTime);
					
					// Pulse Rate
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (2, " + random(pulseMin, pulseMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Pulse Rate generated at " + dateTime);
					
					// Respiration Rate
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (3, " + random(respirationMin, respirationMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Respiration Rate generated at " + dateTime);
					
					// Systolic Rate
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (4, " + random(systolicMin, systolicMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Systolic rate generated at " + dateTime);
					
					// Diastolic Rate
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (5, " + random(diastolicMin, diastolicMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Diastolic rate generated at " + dateTime);
					
					// LDL
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (6, " + random(ldlMin, ldlMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("LDL generated at " + dateTime);
					
					// HDL
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (7, " + random(hdlMin, hdlMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("HDL generated at " + dateTime);
					
					// Triglycerides
					stmt.executeUpdate("insert into datas (data_type, data_value, data_time) values (8, " + random(triglyceridesMin, triglyceridesMax) + ", '" + dateTime + "')");
					rs = stmt.executeQuery("select id from datas order by id desc limit 1");
					rs.next();
					dataId = rs.getInt("id");
					stmt.executeUpdate("insert into users_datas (user_id, data_id) values (" + userId + ", " + dataId + ")");
					System.out.println("Triglycerides generated at " + dateTime);
					
					if (wait) {
						try {
							Thread.sleep(interval * 1000);
						} catch (Exception e) {
							System.out.println("Error: cannot pause the process!");
						}
					}
					
					counter++;
				}
				
				response.sendRedirect("DataGenerator?good=1");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (c != null)
						c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		} else if (generate == null && stop != null && remove == null) {
			requestStop();
			System.out.println("DATA GENERATION STOPPED");
			response.sendRedirect("DataGenerator?good=2");
		} else {
			int userIdRemove;
			Statement stmt;
			ConfigBean cb = new ConfigBean();
			
			try {
				userIdRemove = Integer.parseInt(request.getParameter("useridremove"));
			} catch (Exception e) {
				response.sendRedirect("DataGenerator?good=0");
				return;
			}
			
			Connection c = null;
			try {
				Class.forName("com.mysql.jdbc.Driver");
				c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(), cb.getPassword());
				stmt = c.createStatement();
				
				if (userIdRemove == 0) {
					stmt.executeUpdate("truncate table datas");
					stmt.executeUpdate("truncate table users_datas");
				} else {
					stmt.executeUpdate("delete d from datas d left join users_datas u on d.id = u.data_id where u.user_id = " + userIdRemove);
					stmt.executeUpdate("delete from users_datas where user_id = " + userIdRemove);
				}
				
				response.sendRedirect("DataGenerator?good=3");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (c != null)
						c.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public void requestStop() {
		stopRequested = true;
	}
	
	private String currentDateTime() {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		return dateFormat.format(date);
	}
	
	private double random (double min, double max) {
		return Math.round((rand.nextDouble() * (max - min) + min) * 100.0) / 100.0;
	}
}