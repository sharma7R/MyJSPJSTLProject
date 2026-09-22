<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Registration</title>
    <style>
    div{
    padding:10px;
    background:red;
    width:60%;
    margin:auto;
    border-radius:35px;
    background-image: linear-gradient(120deg, #a1c4fd 0%, #c2e9fb 100%);
    margin-bottom:10px;
    }
    h3 {
    text-align: center;
    margin-top: 25px;
    margin-bottom: 25px;
    font-size: 24px;
}
    label {
        display: inline-block;
        width: 40%;
        text-align:right;
        font-weight: bold;
        margin-right: 20px;
        margin-bottom: 10px;
    }
    input{
    padding:8px;
    outline:none;
    }
    .submit {
    width: 30%;
    display: block;
    margin: 20px auto 30px auto;
    text-align: center;
    padding: 10px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
}
.jdate{
margin-top:3%;
margin-left:43%;
}
.one{
width:20%;
padding:5px;
}
    </style>
    
</head>

<body style="background: linear-gradient(120deg, #dbeafe, #eff6ff);">


    <h2 style="text-align:center">Employee Record Management</h2>

    <form action="insert.jsp" method="POST">
    	<div> 
            <h3>Insert Employee Details</h3>

            <label>First Name:</label>
            <input type="text" name="firstName" required>
            <br><br>

            <label>Last Name:</label>
            <input type="text" name="lastName" required>
            <br><br>

            <label>Phone Number:</label>
            <input type="text" name="phone_number" required>
            <br><br>

            <label>Age:</label>
            <input type="number" name="age" required>
            <br><br>

            <label>Join Date:</label>
            <input type="date" name="join_date" required>
            <br><br>
            
            <label>Department:</label>
            <input type="number" name="dep" required>
            <br><br>

            <input type="submit" value="Insert" class="submit">
         </div>
    </form>
    
    
   <sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/javaschema" user="root" password="SharmaRY*2005"/>

<sql:query dataSource="${myDB}" var="ids">
select id from employees
</sql:query>

<form action="Delete.jsp" method="GET">
<div>
<h3>

Delete League records:
</h3>
<label>Id:</label>

<select name="id" class="one">

<c:forEach var="myId" items="${ids.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select>

<br>

<input type="submit" value="submit" class="submit">

</div>
</form>


<form action="Update.jsp" method="GET">
<div>
	<h3>Update Employee Details</h3>
    <label>Id:</label>
    <select name="id" class="one">
        <c:forEach var="myId" items="${ids.rows}">
            <option value="${myId.id}">
                ${myId.id}
            </option>
        </c:forEach>
    </select>

    <br>

    <label>Field:</label>

    <input type="radio" name="myField" value="firstName">
    firstName

    <input type="radio" name="myField" value="lastName">
    lastName

    <input type="radio" name="myField" value="phone_number">
    phone_number

    <input type="radio" name="myField" value="age">
    age

    <input type="radio" name="myField" value="join_date">
    Join Date

    <br>

    <label>Value:</label>
    <input type="text" name="fieldValue">

    <br>

    <input type="datetime-local" name="join_date" class="jdate">

    <br>

    <input type="submit" value="Submit" class="submit">
    </div>

</form>
<div>
<h3>View the Employee Details</h3>
    <a href="ListEmployees.jsp">
    <button class="submit">List Employees</button>
</a>

</div>
    
    
 
</body>
</html>