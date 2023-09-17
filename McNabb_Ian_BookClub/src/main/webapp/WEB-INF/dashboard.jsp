<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- New line below to use the JSP Standard Tag Library -->
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
    
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">


<title>Dashboard</title>
</head>
<body class="bg-dark">
	<div class="container border border-solid">
		<h1 class="text-center text-white">Hello, <c:out value="${user.userName}"/>!</h1>
		<p class="text-center text-white">Books from everyone's shelves.</p>
		<a href="/books">+ Add a book to my shelf</a>
		<table class="table table-striped table-hover table-dark border-solid">
				<tr>
					<th class="text-center">ID: </th>
					<th class="text-center">Title: </th> 
					<th class="text-center">Author Name:</th>
					<th class="text-center">Posted By:</th>
				</tr>

				<c:forEach var="book" items ="${books}">
					<tr>
						<td class="text-center"><c:out value="${book.id}"></c:out></td>
						<td class="text-center"><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
						<td class="text-center"><c:out value="${book.author}"/></td>
						<td class="text-center"><c:out value="${book.user.userName}"/></td>
					</tr>
				</c:forEach>

		</table>
		<a href="/logout" class="btn btn-danger text-center m-2">Logout</a>
	</div>
</body>
</html>