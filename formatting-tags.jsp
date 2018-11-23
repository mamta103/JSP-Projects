<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Jstl Formatting Tags</title>
</head>
<body>
<c:set var="now" scope="session" value="<%= new java.util.Date() %>"/>  
<c:out value="${now}"/>  
 <c:set var="no" value="4.5" />
        <p> Currency : <fmt:formatNumber type="currency" value="${no}" /></p>
        <p> Number Pattern : <fmt:formatNumber type="number" pattern="####.###E0" value="${no}" /></p>
        <p>	Percent :<fmt:formatNumber type="percent" value="${no}" /></p>
        <p> Date-Pattern :<fmt:formatDate pattern="yyyy/MM/dd" value="${now}" /></p>
        <p> Date - Long And Short :<fmt:formatDate type="both" dateStyle="long" timeStyle="short"  value="${now}"/> </p>
        <p> Date - Medium And Long :<fmt:formatDate type="both" dateStyle="medium" timeStyle="long"  value="${now}"/> </p>
        <p> Only Date :<fmt:formatDate type="date" value="${now}"/></p>
        <p> Only Time :<fmt:formatDate type="time" value="${now}" /></p>
        
</body>
</html>

******************************************************
outut->
Fri Nov 23 12:44:31 IST 2018
Currency : $4.50

Number Pattern : 4.5E0

Percent :450%

Date-Pattern :2018/11/23

Date - Long And Short :November 23, 2018 12:44 PM

Date - Medium And Long :Nov 23, 2018 12:44:31 PM IST

Only Date :Nov 23, 2018

Only Time :12:44:31 PM
