<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    import="sl314.myclasses.*" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>List Employees</title>

<style>

    body {
        margin: 0;
        padding: 30px;
        font-family: Arial, sans-serif;
        background: linear-gradient(120deg, #dbeafe, #eff6ff);
    }

    h1 {
        text-align: center;
        color: #1e3a8a;
        margin-bottom: 30px;
        font-size: 28px;
    }

    table {
        width: 85%;
        margin: auto;
        border-collapse: collapse;
        background-color: white;
        border: none;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.15);
    }

    th {
        padding: 14px;
        background-color: #2563eb;
        color: white;
        border: 1px solid #1d4ed8;
        text-align: center;
        font-size: 16px;
    }

    td {
        padding: 12px;
        border: 1px solid #d1d5db;
        text-align: center;
        color: #374151;
    }

    tr:nth-child(even) {
        background-color: #eff6ff;
    }

    tr:hover {
        background-color: #dbeafe;
    }

    #back {
        width: 200px;
        margin: 30px auto;
        text-align: center;
    }

    #back button {
        padding: 10px 30px;
        border: none;
        border-radius: 8px;
        background-color: #2563eb;
        color: white;
        font-size: 15px;
        font-weight: bold;
        cursor: pointer;
    }

    #back button:hover {
        background-color: #1d4ed8;
    }

</style>

</head>

<body>

<h1>The following are the list of employees:</h1>

<%
Data d = (Data)application.getAttribute("data");

ResultSet rs = d.rs;
%>

<table>

<tr>
    <th>ID</th>
    <th>FirstName</th>
    <th>LastName</th>
    <th>Phone Number</th>
    <th>Age</th>
    <th>Join Date</th>
</tr>

<%
while(rs.next())
{
%>

<tr>

    <td><%=rs.getInt(1)%></td>

    <td><%=rs.getString(2)%></td>

    <td><%=rs.getString(3)%></td>

    <td><%=rs.getString(4)%></td>

    <td><%=rs.getString(5)%></td>

    <td><%=rs.getDate(6)%></td>

</tr>

<%
}
%>

</table>

<div id="back">

    <button onclick="history.back();">
        Go back
    </button>

</div>

</body>

</html>