<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/33de41b32e.js"
	crossorigin="anonymous"></script>


<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<script src="https://kit.fontawesome.com/33de41b32e.js"
	crossorigin="anonymous"></script>

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
</style>
</head>

<body class="bg-dark-subtle">
	<nav class="navbar navbar-expand-md bg-dark navbar-dark sticky-top">
		<!-- Brand -->
		<a class="navbar-brand p-2 mx-3" href="#"><i
			class="fa-regular fa-user"></i>&nbsp; ${userSession.userName}</a>

		<!-- Navbar links -->
		<div class="collapse navbar-collapse" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<li class="nav-item"><a class="nav-link" href="./viewUser">View
						Citizen</a></li>
				<li class="nav-item"><a class="nav-link" href="./postTable">Post
						CRUD</a></li>
				<li class="nav-item"><a class="nav-link"
					href="./candidateTable">Candidate CRUD</a></li>
				<li class="nav-item"><a class="nav-link" href="./viewWinners">View
						Winners</a></li>
			</ul>
			<ul class="navbar-nav ms-auto me-4 ">
				<li class="nav-item"><a class="nav-link" href="./logout">Logout
						&nbsp;<i class="fa-solid fa-right-from-bracket"></i>
				</a></li>
			</ul>

		</div>
	</nav>

	<div class="m-3">
		<c:if test="${msg ne null}">
			<h4 id="alertId" class="alert alert-success">${msg}</h4>
		</c:if>

		<c:if test="${userList ne null}">
			<div class="card m-5">
				<div class="card-header text-white bg-success text-center">
					<h2>Registration Detail</h2>
				</div>
				<div class="card-body">
					<table class="table table-striped">
						<thead>
							<tr>
								<th>Sl#</th>
								<th>Name</th>
								<th>Phone No</th>
								<th>Email</th>
								<th>Role</th>
								<th>Permission</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${userList }" var="user" varStatus="counter">
								<tr>
									<td>${counter.count }</td>
									<td>${user.userName }</td>
									<td>${user.phoneNo }</td>
									<td>${user.userMail }</td>
									<td>${user.userRole }</td>
									<td><a href="welcomeUser?uid=${user.userId}"> <%-- grantUser?userId=${user.userId}
																--%>
											<button class="btn btn-warning">Login</button>
									</a>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>

		<c:if test="${postList ne null }">
			<div class="container mt-5">
				<form action="savePost" method="post">
					<div class="card">
						<div class="card-header text-white bg-secondary text-center">
							<h2>Create New Post</h2>
						</div>
						<div class="card-body">
							<div class="row">
								<div class="col-md-4">

									<label for="">Post Id</label> <input type="text" name="postId"
										id="postId" class="form-control" value="${post.postId }"
										<c:if
														test="${post ne null }">readonly
						</c:if>>
								</div>
								<div class="col-md-4">
									<label for="">Post Name</label> <input type="text"
										name="postName" id="postName" class="form-control"
										value="${post.postName }">
								</div>
							</div>
						</div>
						<div class="card-footer text-center">
							<button type="submit" class="btn btn-success">${post ne null ? 'Update':'Submit' }</button>
							<button type="reset" class="btn btn-danger">reset</button>
						</div>
					</div>

				</form>

				<c:if test="${deletemsg ne null}">
					<h6 id="alertId" class="alert alert-danger mt-5">${deletemsg}</h6>
				</c:if>

				<div class="card mt-5">
					<div class="card-header text-white bg-dark text-center">
						<h2>Post Detail</h2>
					</div>
					<div class="card-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th>Sl#</th>
									<th>Post Id</th>
									<th>Post Name</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${postList }" var="post" varStatus="counter">
									<tr>
										<td>${counter.count }</td>
										<td>${post.postId }</td>
										<td>${post.postName }</td>
										<td><a href="editPost?postId=${post.postId}">
												<button class="btn btn-warning">Edit</button>
										</a> &nbsp; <a href="deletePost?postId=${post.postId}"><button
													class="btn btn-danger">Delete</button> </a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>


		<c:if test="${candimsg ne null}">
			<h4 id="alertId" class="alert alert-success">${candimsg}</h4>
		</c:if>

		<c:if test="${candidateList ne null }">
			<div class="container mt-5">
				<form action="saveCandidate" method="post">
					<div class="card">
						<div class="card-header text-white bg-secondary text-center">
							<h2>New Candidate Registration</h2>
						</div>
						<div class="card-body">
							<div class="row">
								<input type="hidden" name="candidateId"
									value="${candidate.candidateId}">
								<div class="col-md-4">

									<label for="">Post Id</label> <input type="text" name="post"
										id="post" class="form-control"
										value="${candidate.post.postId }">
								</div>
								<div class="col-md-4">
									<label for="">User Id</label> <input type="text" name="user"
										id="user" class="form-control" value="${userSession.userId }"
										readonly>
								</div>
							</div>
						</div>
						<div class=" m-3 text-center">
							<button type="submit" class="btn btn-success">
								${candidate ne null ? 'Update':'Submit' }</button>
							<button type="reset" class="btn btn-danger">reset</button>
						</div>
					</div>

				</form>

				<c:if test="${deletemsg ne null}">
					<h6 id="alertId" class="alert alert-danger mt-5">${deletemsg}</h6>
				</c:if>

				<div class="card mt-5">
					<div class="card-header text-white bg-dark text-center">
						<h2>Candidate Details</h2>
					</div>
					<div class="card-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th>Sl#</th>
									<th>Candidate Id</th>
									<th>Post Name</th>
									<th>Registerd By</th>
									<th>Action</th>

								</tr>
							</thead>
							<tbody>
								<c:forEach items="${candidateList }" var="candidate"
									varStatus="counter">
									<tr>
										<td>${counter.count }</td>
										<td>${candidate.candidateId }</td>
										<td>${candidate.post.postName }</td>
										<td>${candidate.user.userName }</td>
										<td><a
											href="editCandidate?candidateId=${candidate.candidateId}">
												<button class="btn btn-warning">Edit</button>
										</a> &nbsp; <a
											href="deleteCandidate?candidateId=${candidate.candidateId}"><button
													class="btn btn-danger">Delete</button> </a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>

		<c:if test="${voteList ne null}">
			<div class="mt-5">
				<div class="card m-auto w-50">
					<div class="card-header text-white bg-dark text-center">
						<h2>Winners</h2>
					</div>
					<div class="card-body">
						<table class="table table-striped text-center">
							<thead>
								<tr>
									<th>Sl#</th>
									<th>Post Name</th>
									<th>Candidate</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${voteList }" var="vote" varStatus="counter">
									<tr>
										<td>${counter.count}</td>
										<td>${vote[0]}</td>
										<td>${vote[1]}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</c:if>
	</div>


	<script type="text/javascript">
						document.addEventListener("DOMContentLoaded", () => {
							setTimeout(function () {
								document.getElementById('alertId').style.display = 'none';
							}, 3000);
						});
					</script>

</body>

</html>