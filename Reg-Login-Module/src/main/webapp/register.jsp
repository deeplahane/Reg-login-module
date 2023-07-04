<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="all_css.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body style="background-color: #f2f3f5">
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
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-2 pb-0 ">
					<div class="card-header text-center">
						<h3>
							<i class="fa-solid fa-user-plus"></i> Sign-up page
						</h3>
					</div>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter First Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhon" name="fname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Last Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="doe" name="lname">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Username</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhon_doe"
									name="username">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="jhondoe@gmail.com"
									name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									placeholder="JhonDoe@123" name="password">
							</div>
							<div class="text-center pt-2">
								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>