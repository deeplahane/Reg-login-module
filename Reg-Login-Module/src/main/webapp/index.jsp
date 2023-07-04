<%@page import="com.entities.User"%>
<%@page import="antlr.debug.MessageAdapter"%>
<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
	<%
	User u = (User) session.getAttribute("user");
	if (u == null) {
		System.out.println("success1");
		Message msg = new Message("Please Login First", "alert-danger");
		session.setAttribute("msg", msg);
		response.sendRedirect("login.jsp");
	}
	%>
	<%-- <c:if test="${empty user }">
		<c:redirect url="login_page.jsp" />
	</c:if> --%>
	<%
	Message m = (Message) session.getAttribute("msg");
	if (m != null) {
	%>
	<div class="alert <%=m.getCssClass()%>">
		<%=m.getContent()%></div>
	<%
	}
	session.removeAttribute("msg");
	%>
	<div class="container text-center mt-4">
		<h1>Welcome to Home page</h1>
	</div>
</body>
</html>