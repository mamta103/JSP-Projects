<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
	 <%@ taglib uri="/WEB-INF/ratings.tld" prefix="cs" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><jsp:getProperty name="course" property="courseName" /></title>
</head>
<body>
	<div class="container">
	    <!--* * * * * * * * * * * * * * Header * * * * * * * * * * * * * * *-->
		<header> <%@ include file="header.jsp"%>
		</header>

	    <!--* * * * * * * * * * * * * * Article * * * * * * * * * * * * * * *-->
		<article> 
		<jsp:scriptlet>
		String user= (String)session.getAttribute("user");
		String message= "Welcome "+ user +" !";
		</jsp:scriptlet>
 
       <div class="row">
       <div class="col-md-12">
		<h3><b><jsp:expression>message</jsp:expression></b></h3>
		<form name="coursefrm" action="ratings.jsp" method="post">
	   </div>
	   </div>
	   
	   <!--* * * * * * * * * * * * * * Jsp Bean * * * * * * * * * * * * * * *-->
       <jsp:useBean id="course" class="com.learntoday.model.Course" scope="request"/>
       
		<div class="panel panel-primary">
		<p class="panel-heading"> Course Details </p>
		
		<div class="panel-body">
		
		<div class="media">
		<div class="media-left">
		
		<a href="#">
		<img src='${course.imageUrl}' width="300" height="300" />
		</a>
		</div>
		
		<div class="media-body">
		  <h4 class="media-heading">${course.courseName}</h4>
		  <p><strong>Trainer Name: </strong>${course.facultyName}</p>
		  <p><strong>Course Description: </strong>${course.description}</p>
		  <p><strong>Course Fee: </strong>${course.fees}</p>
		  
<p><strong>Course Ratings : </strong>  <cs:ratings course="${course.courseName}"/> </p>
		   		
		   		<c:if test="${course.userRating > 0}">
		   			<p><strong>Your Ratings: </strong> ${course.userRating} </p>
		   		</c:if>
		   		<c:if test="${course.userRating == 0}">
		   		<p><strong>Enter your rating : 
		   		<select name="ratings">
		   		<c:forEach var="i" begin="1" end="5">
   						<option value='${i}'>${i}</option><p>
				</c:forEach>
				</select>
		   		</strong>
		   		</p>
		   		</c:if>
  			</div>
	</div>

		   	<p class="text-center"><c:if test="${course.userRating==0}"><input type="submit" name="submit" value="Save Ratings" 
   	class="btn btn-lg btn-success"/> </c:if> <a href="courses.jsp" class="btn btn-lg btn-success">View All Courses</a> </p> 
		</div>
		</div>
		 <input type="hidden" name="courseName" value="${course.courseName}"/>
		</form>
	    </article>
	    <!--* * * * * * * * * * * * * * Footer * * * * * * * * * * * * * * *-->
         <footer> <%@ include file="footer.jsp"%></footer>
	</div>
</body>
</html>