<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="sql"
    uri="http://java.sun.com/jsp/jstl/sql"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
</head>

<body style=" background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);">

<%
String id = request.getParameter("id");
%>

<sql:setDataSource
    var="myDB"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/javaschema"
    user="root"
    password="SharmaRY*2005"
/>

<sql:update dataSource="${myDB}" var="result">

    DELETE FROM employees
    WHERE id = ?

    <sql:param value="<%= id %>" />

</sql:update>


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
        Employee deleted successfully!
    </h3>

</c:if>


<c:if test="${result == 0}">

    <h3 style="
        color: #991b1b;
        background-color: #fee2e2;
        border: 1px solid #fca5a5;
        padding: 12px 20px;
        border-radius: 8px;
        width: 60%;
        margin: 20px auto;
        text-align: center;
        font-family: Arial, sans-serif;
        box-shadow: 0 3px 8px rgba(0,0,0,0.1);
    ">
        Employee ID ${id} not found!
    </h3>

</c:if>

<br>

<a href="index.jsp">Back to Employee List</a>

</body>
</html>