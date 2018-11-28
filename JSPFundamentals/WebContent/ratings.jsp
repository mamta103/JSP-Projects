<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.io.*,java.util.*,java.sql.*, com.mysql.jdbc.Driver" session="true"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>


<sql:setDataSource var="courseds" 
                   driver="oracle.jdbc.driver.OracleDriver"
     		   url="jdbc:oracle:thin:@localhost:1521:xe"
                   user="system"  
                   password="system123"/>

<sql:update dataSource="${courseds}" var="rows">
	insert into ratings(CourseTitle,UserName,Rating) values(?,?,?)
	<sql:param value="${param.courseName}" />
	<sql:param value="${sessionScope.user}" />
	<sql:param value="${param.ratings}" />
</sql:update>    


<jsp:forward page="findCourse.jsp">
	<jsp:param name="courseName" value="${param.courseName}" />
</jsp:forward>

