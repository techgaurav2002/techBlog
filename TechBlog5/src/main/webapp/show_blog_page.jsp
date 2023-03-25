<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.tech.blog.dao.Userdao"%>
<%@page import="com.tech.blog.dao.LikeDao"%>

<!-- validatation ki user login hai ki nahi -->
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page");
}
%>
<%
int postId= Integer.parseInt(request.getParameter("post_id"));
PostDao d = new PostDao(ConnectionProvider.getConnection());
Post p = d.getPostByPostId(postId);


%>







<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= p.getpTitle() %> || TechBlog</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="css/mystyle.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 96%, 66% 81%, 31% 85%, 0% 70%, 0 0);
	
}
.post-title{
font-weight: 100;
font-size: 30px;

}
.post-content{
font-weigth: 100;
font-size: 25px
}
.post-date{
font-style: italic;
font-weight: bold;
font-size: 10px;
}
.post-user-info{
font-size: 20px;
font-weigth: 200;
}
.row-user{
border: 1px solid #e2e2e2;
padding-top: 15px;
}

body{
background:url(img/bg.jpg);
background-size: cover;
background-attachment: fixed;
}

</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v15.0" nonce="sVCKaeXb"></script>

</head>
<body>

<!-- Start of navbae -->
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"><span
			class="fa fa-asterisk"></span>Tech Blog</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="profile.jsp"><span
						class="fa fa-bell-o"></span>Home <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-asterisk"></span>Do Post</a></li>


			</ul>
			<ul class="navbar-nav ar-right">

				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span><%=user.getName()%></a></li>
				<li class="nav-item"><a class="nav-link" href="LogOutServlet"><span
						class="fa fa-user-plus"></span>Log out</a></li>
			</ul>

		</div>
	</nav>

<!-- end of navbar -->

<!-- start of main Content of the body -->
<div class="container">
<div class="row my-4">
<div class="col-md-8 offset-md-2">
<div class="card">
<div class="card-header primary-background text-white">
<h4 class="post-title"><%= p.getpTitle() %></h4>

</div>
<div class="card-body">
<img src="blog_pics/<%= p.getpPic() %>" class="card-img-top mt-2" alt="...">

<div class="row my-3 row-user">
<div class="col-md-8">
<% Userdao ud = new Userdao(ConnectionProvider.getConnection());%>
<p class="post-user-info"> <a href="#" ><%= ud.getUserByUserId(p.getUserId()).getName() %> </a> has posted </p>
</div>
<div class="col-md-4">

<p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())  %></p>
</div>

</div>

<p class="post-content"><%=p.getpContent() %></p>
<br>
<div class="post-code">
<pre><%=p.getpCode() %></pre>
</div>
</div>
<div class="card-footer primary-background">
<div class="card-footer primary-background text-center">

		<%
		LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
		%>
		<a href="#" onclick="doLike(<%=p.getPid() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"><span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></i></a>
		<a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
		
		</div>
		
		<div class="card-footer">
			<div class="fb-comments" data-href="http://localhost:8080/TechBlog5/show_blog_page.jsp?post_id=<%=p.getPid() %>" data-width="" data-numposts="5"></div>
		</div>

</div>

</div>
</div>

</div>
</div>


<!-- end of main Content of the body -->



<!-- start of profile model -->
	<!-- Button trigger modal -->
	<!-- Button trigger modal --

<!-- Modal -->
	<div class="modal fade" id="profile-modal" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="staticBackdropLabel">TechBlog</h5>

				</div>
				<div class="modal-body">
					<div class="continer text-center">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							style="borde-radius: 50%; max-width: 150px;"> <br>
						<h5 class="modal-title mt-2" id="staticBackdropLabel"><%=user.getName()%></h5>

						<!-- details -->
						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">ID</th>
										<td><%=user.getId()%></td>

									</tr>
									<tr>
										<th scope="row">Email</th>
										<td><%=user.getEmail()%></td>

									</tr>
									<tr>
										<th scope="row">Gender</th>
										<td colspan="2"><%=user.getGender()%></td>

									</tr>
									<tr>
										<th scope="row">Status</th>
										<td colspan="2"><%=user.getAbout()%></td>

									</tr>
									<tr>
										<th scope="row">Registered on</th>
										<td colspan="2"><%=user.getDateTime()%></td>

									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile-edit -->
						<div id="profile-edit" style="display: none">
							<h3 class="mt-2">Plese Edit Carefully</h3>
							<form action="EditServlet" method="Post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control"">
										</td>
									</tr>
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About :</td>
										<td><textarea rows="2" cols="" class="form-control"
												name="user_about"><%=user.getAbout()%></textarea></td>
									</tr>


								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>


							</form>
						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">Edit</button>
				</div>
			</div>
		</div>
	</div>


	<!-- end of profile model -->

	<!-- add post model -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Post details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">


					<form id="add-post-form" action="AddPostServlet" method="POST">
						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>--Select Category---</option>
								<%
								PostDao postd = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postd.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%=c.getCid()%>"><%=c.getName()%></option>

								<%
								}
								%>

							</select>

						</div>
						<div class="form-group">

							<input name="pTitle" type="text" placeholder="Title"
								class="form-control" />

						</div>

						<div class="form-group">
							<textarea name="pContent" class="form-control"
								style="heigth: 200px" placeholder="Enter your Content"></textarea>


						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control" style="heigth: 200px"
								placeholder="Enter your program (if any)"></textarea>


						</div>
						<div class="form-group">
							<label>Select your pic..</label> <br> <input type="file"
								name="pic" />

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-outline-primary">Post</button>

						</div>



					</form>



				</div>

			</div>
		</div>
	</div>







	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"
		integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js">
		
	</script>

	<script src="js/myjs.js" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			let editStatus = false;

			$('#edit-profile-button').click(function() {
				/* alert("button clicked") */
				/* target karo profile-detail wali id ko */
				if (editStatus == false) {
					$("#profile-details").hide();

					$("#profile-edit").show();

					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show();

					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			})
		});
	</script>

	<script>
		$(document)
				.ready(
						function() {
							console.log("loaded........")

							$('#add-post-form')
									.on(
											'submit',
											function(event) {
												event.preventDefault();
												console
														.log("you have clicked on submit....")

												let form = new FormData(this);

												//send registor servlet;
												$
														.ajax({
															url : "AddPostServlet",
															type : 'POST',
															data : form,
															success : function(
																	data,
																	textStatus,
																	jqXHR) {
																console
																		.log(data)
																if (data.trim() == 'done') {
																	swal(
																			"Good job!",
																			"Posted",
																			"success")
																} else {
																	swal(
																			"Error!",
																			"Something went Wrong try again...",
																			"error")
																}

															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorThrown) {
																//error
																swal(
																		"Error!",
																		"Something went Wrong try again...",
																		"error")

															},
															processData : false,
															contentType : false
														})

											})
						})
						/*  */
	</script>
	

</body>
</html>