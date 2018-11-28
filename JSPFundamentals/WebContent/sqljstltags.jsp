
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSTL SQL Tags</title>
</head>
<body>
	<sql:setDataSource var="myDB" driver="oracle.jdbc.driver.OracleDriver"
		url="jdbc:oracle:thin:@localhost:1521:xe" user="system"
		password="system123" />
	<sql:update dataSource="${myDB}" var="count">Insert Into Users values('abcxyz','abcxyz');
</sql:update>
	<sql:query var="rsUsers" dataSource="${myDB}">
	Select * From Users
	</sql:query>
	<c:forEach var="user" items="${rsUsers.rows}">
		<p>
			UserName :
			<c:out value="${user.username}" />
			, Password :
			<c:out value="${user.passwd}" />
		</p>
	</c:forEach>
</body>
</html>
