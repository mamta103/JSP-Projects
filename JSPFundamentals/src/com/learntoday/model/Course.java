package com.learntoday.model;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Course implements Serializable{
 private static final long serialVersionUID= 1L;
 private String courseName;
 private String facultyName;
 private String description;
 private String imageUrl;
 private int fees;
 private int userRating;
 private String ratings;
public String getCourseName() {
	return courseName;
}
public void setCourseName(String courseName) {
	this.courseName = courseName;
}
public String getFacultyName() {
	return facultyName;
}
public void setFacultyName(String facultyName) {
	this.facultyName = facultyName;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
public String getImageUrl() {
	return imageUrl;
}
public void setImageUrl(String imageUrl) {
	this.imageUrl = imageUrl;
}
public int getFees() {
	return fees;
}
public void setFees(int fees) {
	this.fees = fees;
}
public int getUserRating() {
	return userRating;
}
public void setUserRating(int userRating) {
	this.userRating = userRating;
}
public String getRatings() {
	return ratings;
}
public void setRatings(String ratings) {
	this.ratings = ratings;
}

public static List getCourses(){
	List courses;
	courses = new ArrayList<Course>();
	
	try{
		String sqlQuery;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system123");
		Statement stmt= conn.createStatement();
		sqlQuery= "Select * From Course";
		ResultSet rs= stmt.executeQuery(sqlQuery);
		while( rs.next()){
			Course course = new Course();
			course.setCourseName(rs.getString("COURSETITLE"));
			course.setFacultyName(rs.getString("TRAINER"));
			course.setImageUrl(rs.getString("IMAGEURL"));
			course.setFees(rs.getInt("FEES"));
			course.setDescription(rs.getString("COURSEDESCRIPTION"));
			courses.add(course);
		}
	}
	catch(Exception ex){
		ex.printStackTrace();
	}
	return courses;
	
}
 
 





 
 
}
