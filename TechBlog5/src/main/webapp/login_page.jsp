<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.entities.Message"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
  .banner-background{
  clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 96%, 66% 81%, 31% 85%, 0% 70%, 0 0);

  }
</style>

</head>
<body>
<!-- navbar -->
<%@include file="normal_navbar.jsp" %>


<main class="d-flex align-items-center primary-background " style="height: 70vh">
<div class="container">
	<div class="row">
 		<div class="col-md4 offset-md-4">
			<div class="card">
   				<div class="card-header primary-background text-white text-center">
   				<span class="fa fa-user-plus fa-3x"></span>\
   				<br>
   				<p> Login hear</p>
   				
   				
   				</div>
   				<!-- //display error msg -->
   				<%
   				Message m = (Message)session.getAttribute("msg");
   				if(m!=null){
   				%>	
   				<div class="<%= m.getCssClass() %>" role="alert">
  					<%= m.getContant() %>
				</div>
   					
   				<%	
   					session.removeAttribute("msg");
  
   		
   				}
   				
   				
   				%>
   				
   				
   				
   				<div class="card-body">
   				
   				
   				
   				
   				<form action="LoginServlet" method="POST">
   				
   				
   				
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name = "email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name = "password" required type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <div class = "container text-center">
  <button type="submit" class="btn btn-primary">Submit</button>
  </div>
</form>
   				</div>
   
   
   			</div>
  		</div>
 	</div>
</div>
</main>



<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>

</body>
</html>