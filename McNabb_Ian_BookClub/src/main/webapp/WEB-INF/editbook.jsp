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


<title>Edit Book</title>
</head>
<body class="bg-dark">
	<div>
		<h1 class="text-white text-center">Edit Book</h1>
	</div>
	
	<div class="border border-solid m-5"></div>
	
	<div class="my-auto mx-auto col-5">
		<form:form action="/books/${book.id}" method="POST" modelAttribute="book">
			<input type="hidden" name="_method" value="put">
		
			<form:label path="title" class="form-label text-white">Title:</form:label>
			<form:errors path="title" class="text-danger "/>
			<form:input type="text" path="title" class="form-control mb-2 col-2"/>
			
			<form:label path="author" class="form-label text-white">Author:</form:label>
			<form:errors path="author" class="text-danger"/>
			<form:input type="text" path="author" class="form-control mb-2"/>
			
			<form:label path="thoughts" class="form-label text-white">My Thoughts:</form:label>
			<form:errors path="thoughts" class="text-danger"/>
			<form:textarea path="thoughts" class="form-control mb-2 "/>
			
			<form:input type="hidden" path="user" value="${user.id}" class="form-control"/>
			
			<input type="submit" value="Submit" class="btn btn-primary mt-2">
		</form:form>
		
	</div>
	<div  class="text-center mt-5">
	<a href="/dashboard" class="btn btn-secondary">Back to my shelf</a>
	</div>
</body>
</html>