<%@ page import="com.learntoday.model.Course"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.sql.*,java.util.*"
	session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Learntoday - All Courses</title>
</head>
<body>
<div class="container">
	<!--  * * * * * * * * * * Header  * * * * * * * * * * -->
	<header> <jsp:include page="header.jsp"></jsp:include> </header>

	<!--  * * * * * * * * * * Article  * * * * * * * * * * -->
	<article> 
	<jsp:useBean id="obj" class="com.learntoday.model.Course"></jsp:useBean>
	<div class="row">
	 <c:set var="i" value="0" scope="page" />
	 <c:forEach var="course" items="${obj.getCourses()}">
	 <c:set var="n"  value="${i%3}" />
	 <c:if test="${n==0}">
	 </div>
	 <div class="row">
	 </c:if>
	 <div class="col-md-4">
	 <p><img  src='${course.imageUrl}' width=200 height=200 class="img-thumnail" /></p>
	 <h3 class='text-primary'>${course.courseName}</h3>
	 <p class="text-success"> Trainer: <strong>${course.facultyName}</strong></p>
	 <p>
	 <a href="findCourse.jsp?courseName=${course.courseName}" class="btn btn-default"> View Details </a>
	 </p>
	 <c:set var="i" value="${i+1}"></c:set>
	 </div>
	 </c:forEach>
	</div>
	</article>

	<!--  * * * * * * * * * * Footer  * * * * * * * * * * -->
	<footer> <jsp:include page="footer.jsp"></jsp:include> </footer>
</div>

</body>
</html>