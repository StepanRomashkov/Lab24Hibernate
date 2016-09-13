<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.romashkov.lab24.DAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.romashkov.lab24.User"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="/LabNo24/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Adding new user</h1>
	<jsp:useBean id="obj" class="com.romashkov.lab24.User">
	</jsp:useBean>
	<jsp:setProperty property="*" name="obj"/>
	
	<%
		obj.encryptPassword();
		int i=DAO.addUser(obj);
		if (i > 0)
			out.println("User successfully added");
		else 
			out.println("Something went wrong. User not added");
	%>
	<a href="userListOfUsers.jsp">List of users</a>
</body>
</html>