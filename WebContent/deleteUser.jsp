<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.romashkov.lab24.DAO"%>  
<%@ page import="com.romashkov.lab24.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="/LabNo24/css/main.css" />
<title>Delete User Page</title>
</head>
<body>
<h1>List of users</h1>
<jsp:useBean id="obj" class="com.romashkov.lab24.User">  
</jsp:useBean>  
<jsp:setProperty property="*" name="obj"/>
<table>
<%  
DAO.deleteUser(Integer.valueOf(request.getParameter("id")));
List<User> users = DAO.getAllUsers(); 

for (User u: users) {
	out.println ("<tr><td>" + u.getId() 
		+ "</td><td>" + u.getUsername() 
		+ "</td><td>" + u.getEmail() 
		+ "</td><td>" + u.getFullName()
		+ "</td><td><a href=\"deleteUser.jsp?id=" 
		+ u.getId() + "\">Delete</a>"
		+ "</td></tr>");
}%>
</table>
</body>
</html>