package process;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import core.ConfigBean;

public class VitalBean {
	private String userName;
	private double bloodPressureSys;
	private double bloodPressureDys;
	private double bodyTemp;
	private double bloodGlucose;
	private double respiratoryRate;
	private double heartRate;
	private double age;
	private double hdlCholesterol;
	private double ldlCholesterol;
	private double triglercides;
	

	private double retrieveVital(String vital_id, int points) {
		// gets vital from database
		Connection c = null;
		Statement stmt = null;
		ResultSet rs = null;
		ConfigBean cb = new ConfigBean();
		try {
			Class.forName("com.mysql.jdbc.Driver");

			c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(),
					cb.getPassword());
			stmt = c.createStatement();
			try {
				rs = stmt
						.executeQuery("SELECT FORMAT(AVG(x.data_value),2) as average FROM (SELECT data_value FROM datas d, users u, users_datas ud "
								+ "WHERE d.data_type = '"
								+ vital_id
								+ "' AND d.id = ud.data_id AND ud.user_id = u.id AND u.username = '"
								+ userName
								+ "' ORDER BY d.id DESC limit "
								+ points + ") x;");
				rs.next();
				return rs.getDouble("average");
			} catch (Exception e) {
				System.out.println(vital_id + "empty");
			} finally {
				c.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	public VitalBean(String user, int points) {
		this.userName = user;
		// get vital record from database
		setBodyTemp(retrieveVital("1", points));
		setHeartRate(retrieveVital("2", points));
		setRespiratoryRate(retrieveVital("3", points));
		setBloodPressureSys(retrieveVital("4", points));
		setBloodPressureDys(retrieveVital("5", points));
		setLdlCholesterol(retrieveVital("6", points));
		setHdlCholesterol(retrieveVital("7", points));
		setTriglercides(retrieveVital("8", points));
		
		setBloodGlucose(retrieveVital("0", points));
	}

	public void setHdlCholesterol(double hdlCholesterol) {
		this.hdlCholesterol = hdlCholesterol;
	}

	public void setLdlCholesterol(double ldlCholesterol) {
		this.ldlCholesterol = ldlCholesterol;
	}

	public void setTriglercides(double triglercides) {
		this.triglercides = triglercides;
	}

	public double getHdlCholesterol() {
		return hdlCholesterol;
	}

	public double getLdlCholesterol() {
		return ldlCholesterol;
	}

	public double getTriglercides() {
		return triglercides;
	}

	public VitalBean(double age, double bloodPressure, double bodyTemp,
			double bloodGlucose, double respiratoryRate, double heartRate) {
		this.age = age;
		this.bloodPressureSys = bloodPressureSys;
		this.bodyTemp = bodyTemp;
		this.bloodGlucose = bloodGlucose;
		this.respiratoryRate = respiratoryRate;
		this.heartRate = heartRate;
	}

	public double getAge() {
		Statement stmt;
		ResultSet rs;
		Connection c = null;
		ConfigBean cb = new ConfigBean();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			c = DriverManager.getConnection(cb.getUrl(), cb.getUsername(),
					cb.getPassword());
			stmt = c.createStatement();

			try {
				rs = stmt
						.executeQuery("select timestampdiff(year, birthday, curdate()) as age from users where username = '"
								+ userName + "';");
				rs.next();
				age = rs.getInt("age");
			} catch (Exception e) {
				System.out.println("missing age");
			} finally {
				c.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

		}

		return age;
	}

	public void setAge(double age) {
		this.age = age;
	}

	public double getBloodPressureDys() {
		return bloodPressureDys;
	}

	public void setBloodPressureDys(double bloodPressureDys) {
		this.bloodPressureDys = bloodPressureDys;
	}
	public double getBloodPressureSys() {
		return bloodPressureSys;
	}

	public void setBloodPressureSys(double bloodPressureSys) {
		this.bloodPressureSys = bloodPressureSys;
	}

	public double getBodyTemp() {
		return bodyTemp;
	}

	public void setBodyTemp(double bodyTemp) {
		this.bodyTemp = bodyTemp;
	}

	public double getBloodGlucose() {
		return bloodGlucose;
	}

	public void setBloodGlucose(double bloodGlucose) {
		this.bloodGlucose = bloodGlucose;
	}

	public double getRespiratoryRate() {
		return respiratoryRate;
	}

	public void setRespiratoryRate(double respiratoryRate) {
		this.respiratoryRate = respiratoryRate;
	}

	public double getHeartRate() {
		return heartRate;
	}

	public void setHeartRate(double heartRate) {
		this.heartRate = heartRate;
	}

}
