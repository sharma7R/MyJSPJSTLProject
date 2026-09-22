<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*,java.text.*"
    isELIgnored="false" %>

<%@ taglib prefix="c"
    uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql"
    prefix="sql" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
</head>

<body style=" background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);" >

<%
    int myKey = Integer.parseInt(request.getParameter("id"));

    String myField = request.getParameter("myField");

    String myValue = "";

    String join_date = request.getParameter("join_date");

    Date jDate = null;

    if (myField.equals("join_date")) {

        SimpleDateFormat formatter =
            new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        try {
            jDate = formatter.parse(join_date);
        }
        catch (ParseException e) {
            e.printStackTrace();
        }

    }
    else {

        myValue = request.getParameter("fieldValue");

    }
%>


<c:set var="myKey" value="<%=myKey%>" />

<c:set var="myField" value="<%=myField%>" />

<c:set var="jDate" value="<%=jDate%>" />

<c:set var="myValue" value="<%=myValue%>" />


<sql:setDataSource
    var="myDB"
    driver="com.mysql.cj.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/javaschema"
    user="root"
    password="SharmaRY*2005" />


<sql:update dataSource="${myDB}" var="count">

    <c:choose>

        <c:when test="${myField == 'firstName'}">
            UPDATE employees
            SET firstName=?
            WHERE id=?
        </c:when>

        <c:when test="${myField == 'lastName'}">
            UPDATE employees
            SET lastName=?
            WHERE id=?
        </c:when>

        <c:when test="${myField == 'phone_number'}">
            UPDATE employees
            SET phone_number=?
            WHERE id=?
        </c:when>

        <c:when test="${myField == 'age'}">
            UPDATE employees
            SET age=?
            WHERE id=?
        </c:when>

        <c:when test="${myField == 'join_date'}">
            UPDATE employees
            SET join_date=?
            WHERE id=?
        </c:when>

    </c:choose>

    <c:choose>

        <c:when test="${myField == 'join_date'}">
            <sql:param value="${jDate}" />
        </c:when>

        <c:otherwise>
            <sql:param value="${myValue}" />
        </c:otherwise>

    </c:choose>

    <sql:param value="${myKey}" />

</sql:update>


<h1>Record updated successfully!</h1>

<h2>
    Employee ID:
    <c:out value="${myKey}" />
</h2>

<h2>
    Updated Field:
    <c:out value="${myField}" />
</h2>

<h2>
    New Value:

    <c:choose>

        <c:when test="${myField == 'join_date'}">
            <c:out value="${jDate}" />
        </c:when>

        <c:otherwise>
            <c:out value="${myValue}" />
        </c:otherwise>

    </c:choose>

</h2>

</body>
</html>