<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.text.*" isELIgnored="false"%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Employee</title>
</head>

<body>

<%
String fname = request.getParameter("firstName");
String lname = request.getParameter("lastName"); 
String phone = request.getParameter("phone_number"); 
String age = request.getParameter("age");
String jDate = request.getParameter("join_date");

java.util.Date join_date=null;
SimpleDateFormat sd= new SimpleDateFormat("yyyy-MM-dd");
try{
	join_date = sd.parse(jDate);
}
catch(ParseException pe)
{
	pe.printStackTrace();
}

String department = request.getParameter("dep");
%>

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/javaschema" user="root" password="SharmaRY*2005"/>

<sql:update dataSource="${myDB}" var="result">

    INSERT INTO employees
    (firstName, lastName, phonenumber, age, Join_date,Department)
    VALUES (?, ?, ?, ?, ?, ?)


   <sql:param value="<%= fname %>" />
	<sql:param value="<%= lname %>" />
	<sql:param value="<%= phone %>" />
	<sql:param value="<%= age %>" />
	<sql:param value="<%= join_date %>" />
	<sql:param value="<%= department %>"/>

</sql:update>


<br>
<c:if test="${result > 0}">

    <h3 style="
        color: #166534;
        background-color: #dcfce7;
        border: 1px solid #86efac;
        padding: 12px 20px;
        border-radius: 8px;
        width: 60%;
        margin: 20px auto;
        text-align: center;
        font-family: Arial, sans-serif;
        box-shadow: 0 3px 8px rgba(0,0,0,0.1);
    ">
        Employee inserted successfully!
    </h3>

</c:if>

<button onclick="history.back()">Go back</button>

</body>
</html>