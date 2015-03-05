package process;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import core.ConfigBean;

public class Process {

	JSONObject json;
	String username;

	public JSONObject getJson() {
		return json;
	}

	// generic function for database calls for vital comparison and results
	private JSONArray compareVital(String vitalName, String table,
			double measurement, double lastVital) {
		ConfigBean cb = new ConfigBean();
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		JSONArray arr = new JSONArray();
		if (measurement == 0) {
			JSONArray error = new JSONArray();
			error.put("error");
			error.put("error");
			error.put("error");
			error.put("error");
			error.put("2");
			error.put("error");
			System.out.println("NO measurement to compare for: " + table);
			return error;
		}

		try {

			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(),
					cb.getPassword());
			stmt = c.createStatement();
			try {
				rs = stmt.executeQuery("SELECT result, level, search FROM " + table
						+ " WHERE tol_lower <= " + measurement
						+ " AND tol_upper >= " + measurement);

				if (rs.next()) {
					arr.put(vitalName);
					arr.put(Double.toString(measurement));
					arr.put(Double.toString(lastVital));
					arr.put(rs.getString("result"));
					arr.put(rs.getString("level"));
					arr.put(rs.getString("search"));
					
				} else {
					arr.put(vitalName);
					arr.put(Double.toString(measurement));
					arr.put(Double.toString(lastVital));
					arr.put(" Error: Measurement excceeds normal vitals.");
					arr.put("2");
					arr.put("error");
				}
			} catch (Exception e) {
				// exception if mysql query is empty
				e.printStackTrace();
			} finally {
				c.close();
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return arr;

	}

	// separate function for heart rate comparison
	private JSONArray compareVitalHeartRate(String table, double measurement,
			double lastVital, double age) throws Exception {
		if (measurement == 0)
			throw new Exception(table + " has NO measurement to compare");
		if (age == 0)
			throw new Exception("Missing Age Parameter");

		double maxRate = 220 - age;
		int level;
		String result = "";
		if (measurement > maxRate) {
			result = "Heart Rate is faster than 100% recommended rate.";
			level = 2;
		} else if (measurement <= maxRate && measurement > .7 * maxRate) {
			result = "Heart Rate is above normal at 70%-100% of your max heart rate.";
			level = 1;
		} else if (measurement > .5 * maxRate && measurement <= .7 * maxRate) {
			result = "Heart Rate is normal at 50%-70% of your max heart rate.";
			level = 0;
		} else if (measurement > .25 * maxRate && measurement <= .5 * maxRate) {
			result = "Heart Rate is below normal at 25%-50% of your max heart rate.";
			level = 1;
		} else {
			result = "Heart Rate is dangerously below recommended rate.";
			level = 2;
		}
		JSONArray arr = new JSONArray();
		arr.put("Heart Rate");
		arr.put(Double.toString(measurement));
		arr.put(lastVital);
		arr.put(result);
		arr.put(level);
		arr.put("Heart Rate");

		return arr;

	}

	public Process(String user) {
		this.username = user;
		VitalBean vitalAvg = new VitalBean(username, 60);
		VitalBean vitalLast = new VitalBean(username, 1);

		json = new JSONObject();

		// analyze data with database
		try {
			json.put(
					"BP",
					compareVital("Blood Pressure", "vital_blood_pressure",
							vitalAvg.getBloodPressureSys(),
							vitalLast.getBloodPressureSys()));
		} catch (Exception e) {
			System.out.println("BP" + e);
		}
		try {
			json.put(
					"BP2",
					compareVital("Blood Pressure", "vital_blood_pressure",
							vitalAvg.getBloodPressureDys(),
							vitalLast.getBloodPressureDys()));
		} catch (Exception e) {
			System.out.println("BP2" + e);
		}

		try {
			json.put(
					"BT",
					compareVital("Body Temperature", "vital_body_temp",
							vitalAvg.getBodyTemp(), vitalLast.getBodyTemp()));
		} catch (Exception e) {
			System.out.println("BT analyze issue");
		}

		try {
			json.put(
					"BG",
					compareVital("Blood Glucose", "vital_diabetes",
							vitalAvg.getBloodGlucose(),
							vitalLast.getBloodGlucose()));
		} catch (Exception e) {
			System.out.println("BG" + e);
		}
		try {
			json.put(
					"RR",
					compareVital("Respiratory Rate", "vital_respiratory_rate",
							vitalAvg.getRespiratoryRate(),
							vitalLast.getRespiratoryRate()));
		} catch (Exception e) {
			System.out.println("RR" + e);
		}
		try {
			json.put(
					"HR",
					compareVitalHeartRate("vital_heart_rate",
							vitalAvg.getHeartRate(), vitalLast.getHeartRate(),
							vitalAvg.getAge()));
		} catch (Exception e) {
			System.out.println("HR" + e);
		}
		try {
			json.put(
					"HDL",
					compareVital("Cholesterol", "vital_hdl_cholesterol",
							vitalAvg.getHdlCholesterol(),
							vitalLast.getHdlCholesterol()));
		} catch (Exception e) {
			System.out.println("HDL" + e);
		}
		try {
			json.put(
					"LDL",
					compareVital("Cholesterol", "vital_ldl_cholesterol",
							vitalAvg.getLdlCholesterol(),
							vitalLast.getLdlCholesterol()));
		} catch (Exception e) {
			System.out.println("LDL" + e);
		}

		try {
			json.put(
					"TRI",
					compareVital("Cholesterol", "vital_triglyceride",
							vitalAvg.getTriglercides(),
							vitalLast.getTriglercides()));
		} catch (JSONException e) {
			System.out.println("TRI" + e);
		}
	}
}
