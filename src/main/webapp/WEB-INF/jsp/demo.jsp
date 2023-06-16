<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
			<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

				<!DOCTYPE html>
				<html>

				<head>
					<meta charset="ISO-8859-1">
					<title>Assessment</title>

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

						body {
							background-image: url('');
							background-repeat: no-repeat;
							background-attachment: fixed;
							background-size: cover;
						}

						.error {
							color: red;
						}
					</style>

				</head>

				<body class="bg-dark-subtle">

					<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
						<!-- Brand -->
						<a class="navbar-brand" href="#"></a>

						<!-- Navbar links -->
						<div class="collapse navbar-collapse ml-5" id="collapsibleNavbar">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="./login">Login</a></li>
								<li class="nav-item"><a class="nav-link" href="./addNewUser">New
										Citizen</a></li>
							</ul>

						</div>
					</nav>
					<c:if test="${msg  ne null}">
						<h3 class="alert alert-danger" id="alertId">${msg}</h3>
					</c:if>

					<c:if test="${login ne null }">
						<div class="mt-5">
							<div class="m-auto p-5 shadow bg-light w-25" style="background-color: antiquewhite;">
								<div>
									<h2>User Login</h2>
									<hr>
								</div>
								<div>
									<form action="./loginValidate" method="post" id="loginForm">
										<div>
											<dt>User Id</dt>
											<dd>
												<input type="text" name="userId" id="userId" class="form-control"
													autocomplete="off">
											</dd>
										</div>
										<div>
											<dt>Password</dt>
											<dd>
												<input type="password" name="password" id="password"
													class="form-control">
											</dd>
										</div>
										<div class="mt-4">
											<button class="btn btn-primary" type="submit" id="submitbtn">Login</button>
											<button class="btn btn-danger" type="reset">Reset</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</c:if>

					<c:if test="${newUser ne null }">
						<div class="container">
							<form action="saveUser" method="post" id="saveUserForm">
								<div class="card m-5 shadow bg-light rounded-3">
									<div class="card-header text-center text-white bg-dark">
										<h2>Add New Citizen</h2>
									</div>
									<div class="card-body ">
										<div class="row">

											<div class="col-md-4">
												<label for="">User Name</label> <input type="text" name="userName"
													id="userName" class="form-control">
											</div>

											<div class="col-md-4">
												<label for="">Password</label> <input type="text" name="password"
													id="password" class="form-control">
											</div>

											<div class="col-md-4">
												<label for="">Phone No</label> <input type="text" name="phoneNo"
													id="phoneNo" class="form-control">
											</div>

											<div class="col-md-4">
												<label for="">Mail</label> <input type="text" name="userMail"
													id="userMail" class="form-control">
											</div>

											<div class="col-md-4">
												<label for="">Role</label> <br> <input type="radio" name="userRole"
													id="userRole" class="form-check-input" value="admin"> Admin <br>
												<input type="radio" name="userRole" id="userRole"
													class="form-check-input" value="user"> User
											</div>

										</div>
									</div>
									<div class=" text-center m-3">
										<button type="submit" class="btn btn-success" id="submitbtn">Submit</button>
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

						//Form validation
						$().ready(function () {

							$.validator.addMethod("pwcheck", function (value) {
								return /^[A-Za-z0-9\d=!\-@._*]*$/.test(value) // consists of only these
									&& /[a-z]/.test(value) // has a lowercase letter
									&& /[A-Z]/.test(value) // has a Upper letter
									&& /\d/.test(value) // has a digit
									&& /^(?=.*[@#$%&])/.test(value)// has a special symbole
							}, "Password must contain one capital letter, one small letter,one numerical and one special character");

							$("#loginForm").validate({
								// in 'rules' user have to specify all the constraints for respective fields
								rules: {
									// userId: {
									// 	required: true,
									// 	minlength: 6,
									// },
									// name: {
									// 	required: true,
									// 	minlength: 2 //for length of lastname
									// },
									// password: {
									// 	required: true,
									// 	minlength: 8,
									// 	pwcheck: true,
									// },
									// rePassword: {
									// 	required: true,
									// 	minlength: 8,
									// 	equalTo: "#password" //for checking both passwords are same or not
									// },
									// email: {
									// 	required: true,
									// 	email: true
									// },
									userId: {
										required: true,
										digits: true,
									},
									password: "required",
									// photoPath: "required",
									// dob: "required",

									// gender: "required",
								},
								// in 'messages' user have to specify message as per rules
								messages: {
									// userId: {
									// 	required: "Please Enter userId",
									// 	minlength: "UserId must be 6 charecters"
									// },
									// name: {
									// 	required: " Please enter a username",
									// 	minlength: " Your username must consist of at least 2 characters"
									// },
									// password: {
									// 	required: " Please enter a password",
									// 	minlength: " Your password must be consist of at least 8 characters",
									// 	// pwcheck: "must contain atleast one special symoble,numeric,uppercase & lowercase",
									// },
									// rePassword: {
									// 	required: " Please enter a password",
									// 	minlength: " Your password must be consist of at least 5 characters",
									// 	equalTo: " Please enter the same password as above"
									// },
									userId: {
										required: "Please enter your userId",
										digits: "User Id must be only digits",
									},
									password: "Please Enter password",
								}
							});

							$("#saveUserForm").validate({
								rules: {
									userName: "required",
									password: {
										required: true,
										minlength: 8,
										pwcheck: true,
									},
									phoneNo: {
										required: true,
										digits: true,
										rangelength: [10, 10],
									},
									userMail: {
										required: true,
										email: true,
									},
									userRole: "required",
								},
								messages: {
									userName: "Please Enter User Name",
									password: {
										pwcheck: true,
										required: "Please enter password",
										minlength: "Your password must be consist of at least 8 characters",
									},
									phoneNo: {
										required: "Please enter phone no",
										digits: "must be digits only",
										rangelength: "Enter a 10 digits valid phone no"
									},
									userMail: {
										required: "please enter email id",
										email: "Enter a valid Email",
									},
									userRole: "Enter your role",
								}
							});

						});

					</script>
				</body>

				</html>