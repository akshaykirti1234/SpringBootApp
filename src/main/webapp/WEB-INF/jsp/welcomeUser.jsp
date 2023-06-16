<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="ISO-8859-1">
					<title>Insert title here</title>
					<!-- Font Awesome -->
					<script src="https://kit.fontawesome.com/33de41b32e.js" crossorigin="anonymous"></script>


					<!-- jQuery -->
					<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
					<!-- jQuery Validator -->
					<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
					<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>

					<!-- Bootstrap -->
					<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
						rel="stylesheet"
						integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
						crossorigin="anonymous">
					<script src="https://kit.fontawesome.com/33de41b32e.js" crossorigin="anonymous"></script>

					<!-- Datepicker -->
					<link
						href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css'
						rel='stylesheet' type='text/css'>
					<script
						src='https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js'
						type='text/javascript'></script>

					<style type="text/css">
						label {
							font-weight: bold;
						}

						.error {
							color: red;
						}
					</style>
				</head>

				<body class="bg-dark-subtle">
					<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
						<!-- Brand -->
						<a class="navbar-brand p-2 ms-3" href="#"><i class="fa-regular fa-user"></i>&nbsp;
							${userSession.userName}</a>

						<!-- Navbar links -->
						<div class="collapse navbar-collapse ml-5" id="collapsibleNavbar">
							<ul class="navbar-nav">

								<li class="nav-item"><a class="nav-link" href="./changePassword">Change Password</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="./editUser">Edit
										Profile</a></li>
								<li class="nav-item"><a class="nav-link" href="./castVote">Cast
										Vote</a></li>
							</ul>
							<ul class="navbar-nav ms-auto me-4 ">
								<li class="nav-item"><a class="nav-link" href="./logout">Logout
										&nbsp;<i class="fa-solid fa-right-from-bracket"></i>
									</a></li>
							</ul>

						</div>
					</nav>



					<c:if test="${msg ne null}">
						<div class="alert alert-success" id="alertId">${msg}</div>
					</c:if>

					<c:if test="${cp ne null}">
						<div class="container mt-5 w-50">
							<form action="updatePassword" method="post" id="updatePassword">
								<div class="card shadow">
									<div class="card-header text-white bg-secondary text-center">
										<h2>Change password</h2>
									</div>
									<div class="card-body">
										<div class="row">
											<input type="hidden" name="userId" value="${userSession.userId}">
											<div class="col-md-8">
												<label for="">Enter Old password</label> <input type="text"
													name="oldPassword" id="oldPassword" class="form-control">
												<div class="text-danger">
													<c:if test="${pc ne null}">***Invalid Password</c:if>
												</div>
											</div>

											<div class="col-md-8">
												<label for="">Enter New password</label>
												<input id="pass" type="password" name="pass" class="form-control"
													required>

												<label for="">Confirm password</label>
												<input id="confirm_pass" type="password" name="confirm_pass"
													class="form-control" required onkeyup="validate_password()">
												<div>
													<small id="wrong_pass_alert"></small>
												</div>
											</div>
										</div>
									</div>
									<div class="text-center p-3">
										<button type="submit" class="btn btn-success" id="create"
											onclick="wrong_pass_alert()">Update</button>
										<button type="reset" class="btn btn-danger">reset</button>
									</div>
								</div>

							</form>
						</div>
					</c:if>

					<c:if test="${editprofile ne null}">
						<div class="container mt-5">
							<form action="updateUser" method="post">
								<div class="card">
									<div class="card-header text-white bg-secondary text-center">
										<h2>Edit Profile</h2>
									</div>
									<div class="card-body">
										<div class="row">
											<input type="hidden" name="userId" value="${userSession.userId}">
											<div class="col-md-4">
												<label for="">userName</label> <input type="text" name="userName"
													id="userName" class="form-control" value="${userSession.userName}">
											</div>
											<div class="col-md-4">
												<label for="">phoneNo</label> <input type="text" name="phoneNo"
													id="phoneNo" class="form-control" value="${userSession.phoneNo}">
											</div>
											<div class="col-md-4">
												<label for="">userMail</label> <input type="text" name="userMail"
													id="userMail" class="form-control" value="${userSession.userMail}">
											</div>
											<div class="col-md-4">
												<label for="">userRole</label> <input type="text" name="userRole"
													id="userRole" readonly class="form-control"
													value="${userSession.userRole}">
											</div>

										</div>
									</div>
									<div class="card-footer text-center">
										<button type="submit" class="btn btn-success">Update</button>
										<button type="reset" class="btn btn-danger">reset</button>
									</div>
								</div>

							</form>
						</div>
					</c:if>

					<c:if test="${castVote ne null}">
						<div class="container">
							<form action="saveVote" method="post">
								<div class="card m-5 shadow">
									<div class="card-header text-center text-white bg-dark">
										<h2>Vote Form</h2>
									</div>
									<div class="card-body">
										<div class="row">
											<input type="hidden" id="userId" name="userId"
												value="${userSession.userId }">

											<div class="col-md-4">
												<label for=""> Select Post</label> <select name="postId" id="postId"
													class="form-control" onchange="getCandidateById()">
													<option value="0">-Select-</option>
													<c:forEach items="${postList}" var="post">
														<option value="${post.postId}">${post.postName}</option>
													</c:forEach>
												</select>
											</div>
											<div class="col-md-4">
												<label for="">Candidate ID</label> <select name="candidate"
													id="candidate" class="form-control">
												</select>
											</div>
										</div>
									</div>
									<div class=" text-center m-3">
										<button type="submit" class="btn btn-success">Vote</button>
										<button type="reset" class="btn btn-danger">Reset</button>
									</div>
								</div>
							</form>
						</div>
					</c:if>


					<script type="text/javascript">
						document.addEventListener("DOMContentLoaded", () => {
							setTimeout(function () {
								document.getElementById('alertId').style.display = 'none';
							}, 3000);
						});

						//Ajax
						function getCandidateById() {
							var postId = $("#postId").val();
							$.ajax({
								type: "get",
								url: "getCandidate",
								data: "postId=" + postId,
								success: function (res) {
									$('#candidate').html(res);
								}
							});
						}

						//Form validation
						$().ready(function () {

							$.validator.addMethod("pwcheck", function (value) {
								return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
									&& /[a-z]/.test(value) // has a lowercase letter
									&& /[A-Z]/.test(value) // has a Upper letter
									&& /\d/.test(value) // has a digit
									&& /^(?=.*[@#$%&])/.test(value)// has a special symbole
							}, "Password must contain one capital letter, one small letter,one numerical and one special character");

							$("#updatePassword").validate({
								// in 'rules' user have to specify all the constraints for respective fields
								rules: {

									pass: {
										required: true,
										minlength: 8,
										pwcheck: true,
									},
									confirm_pass: {
										required: true,
										equalTo: "#pass", //for checking both passwords are same or not
									},
								},
								// in 'messages' user have to specify message as per rules
								messages: {
									pass: {
										required: " Please enter a password",
										minlength: " Your password must be consist of at least 8 characters",
									},
									confirm_pass: {
										required: " Please enter a password",
										equalTo: " Please enter the same password as above",
									},
								}
							});
						});
					</script>

				</body>

				</html>