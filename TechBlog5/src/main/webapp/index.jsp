<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import = "java.sql.*" %>
<%@page import = "com.tech.blog.helper.ConnectionProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- css -->
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
<%-- <% Connection conn = ConnectionProvider.getConnection(); 
out.print(conn);
%> --%>
<!-- navabr -->
<%@include file = "normal_navbar.jsp" %>

<!-- banner -->
<div class="container-fluid p-0 m-0">
<div class="jumbotron primary-background text-white">
<div class="container">
<h3 class="display-3">Welcome to Tech Blog</h3>

<p>A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.

The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language. Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages (such as Perl) have a dominant implementation that is treated as a reference. Some languages have both, with the basic language defined by a standard and extensions taken from the dominant implementation being common.</p>

<p>he term computer language is sometimes used interchangeably with programming language.[2] However, the usage of both terms varies among authors, including the exact scope of each. One usage describes programming languages as a subset of computer languages.[3] Similarly, languages used in computing that have a different goal than expressing computer programs are generically designated computer languages. For instance, markup languages are sometimes referred to as computer languages to emphasize that they are not meant to be used for programming.[4] One way of classifying computer languages is by the computations they are capable of expressing, as described by the theory of computation. </p>

<button class="btn-outline-light btn-lg"><span class="fa fa-user-plus"></span>Start ! its Free</button>
<a href="login_page.jsp" class="btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>Login</a>
</div>
</div>

</div>

<!-- cards -->
<div class="container">
<div class = "row mb-2">
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Java programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>

<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Python programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>

<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">C++ programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>


</div>


<div class = "row">
<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">PHP programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>

<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Ruby programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>

<div class="col-md-4">
<div class="card">
  <div class="card-body">
    <h5 class="card-title">Kotlin programming language</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">read more</a>
  </div>
</div>
</div>


</div>
</div>

<!--javaScript  -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="js/myjs.js" type="text/javascript"></script>
</body>
</html>