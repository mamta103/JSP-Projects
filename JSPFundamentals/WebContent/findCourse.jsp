<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"
	import="java.sql.*, com.learntoday.model.Course"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String userName = (String) session.getAttribute("user");
	if (userName == null) {
    response.sendRedirect("login.jsp?requestUrl=findCourse");
    }
	else{
	%>
	
	<jsp:useBean id="course" class="com.learntoday.model.Course"
		scope="request"></jsp:useBean>
	
	<%! String courseName = null; %>
	
	<%
	String facultyName = null;
	String courseDuration = null;
	int courseFee = 0;

	courseName = request.getParameter("courseName");
	courseName = courseName.trim();
	System.out.println("course name selected :: "+courseName);
	  
	Connection connection = (Connection) application.getAttribute("connection");
	String sql = "select * from course where courseTitle='"+courseName+"'";
    Statement stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
    if(rs.next()){
	course.setCourseName(courseName);
    course.setFacultyName(rs.getString(3));
    course.setImageUrl(rs.getString(4));
    course.setFees(rs.getInt(5));
    course.setDescription(rs.getString(6));
}
	%>
	<jsp:forward page="viewCourse.jsp"></jsp:forward>
   <% } %>


</body>
</html>