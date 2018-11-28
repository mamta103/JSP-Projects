package com.learntoday.customtag;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class RatingDisplayTag extends SimpleTagSupport {
	private String course;

	public void setCourse(String course) {
		this.course = course;
	}

	public void doTag() throws IOException, JspException {
		JspWriter out = getJspContext().getOut();
		Connection con = getConnection();
		String sql = "select count(username) as users, rating from ratings where coursetitle='" + course
				+ "' group by rating";
		int userCount = 0;
		int rating = 0;
		int totalUserRating = 0;
		int totalUsers = 0;
		float courseRating = 0;

		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				userCount = rs.getInt("users");
				rating = rs.getInt("rating");
				totalUserRating += userCount * rating;
				totalUsers += userCount;
			}
			courseRating = totalUserRating / totalUsers;

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		System.out.println("Total count ::" + totalUserRating);
		System.out.println("Total Users ::" + totalUsers);

		System.out.println("courseRating ::" + courseRating);
		out.print(courseRating);
	}

	private Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system123");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;

	}

}
