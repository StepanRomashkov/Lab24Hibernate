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
<title>Authentification</title>
</head>
<body>

<jsp:useBean id="login" class="com.romashkov.lab24.LoginInfo">
</jsp:useBean>
<jsp:setProperty property="*" name="login"/>

<jsp:useBean id="obj" class="com.romashkov.lab24.User">
</jsp:useBean>  
<jsp:setProperty property="*" name="obj"/>

<%
	List<User> users = DAO.getAllUsers();
	
	boolean loginCorrect = false;
	for (User u: users) {
		if (login.getuName().equals(u.getUsername())) {
			loginCorrect = true;
			if (u.checkUserPass(login.getuPass(), u.getPassword())) {
				out.println("Logged in");
				out.println("<a href=\"adminPage.html\">Proceed to admin page</a>");
				break;
			} else {
				out.println("Password incorrect");
				out.println("<a href=\"index.html\">Try again</a>");
				break;	
			}
		}
	}
	if (!loginCorrect) {
		out.println("Username not found");
		out.println("<a href=\"index.html\">Try again</a>");
	}
%>

</body>
</html>