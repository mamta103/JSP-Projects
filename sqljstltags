<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> JSTL SQL Tags </title>
</head>
<body>
<sql:setDataSource var="myDB" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/mydb" user="root" password="password-1"	
/>
<sql:update dataSource="${myDB}" var="count">Insert Into users values("MamtaCompanyUpdated","Mamta");
</sql:update>
<sql:query var="rsUsers" dataSource="${myDB}">Select * From users</sql:query>
<c:forEach var="user" items="${rsUsers.rows}">
<p> UserName : <c:out value="${user.username}"/>,
    Password : <c:out value="${user.passwd}"/></p>
</c:forEach>
</body>
</html>
****************************************************************
UserName : admin, Password : admin

UserName : customer, Password : customer

UserName : MamtaCompany, Password : Mamta

UserName : MamtaCompanyUpdated, Password : Mamta

UserName : mamta_570035, Password : mamta_570035
