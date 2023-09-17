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


<title>${book.title}</title>
</head>
<body class="bg-dark text-white">
	<div class="text-center">
		<h1 class="mt-5"><c:out value="${book.title}"/></h1>
		<div class="border border-solid m-5"></div>
		<h3><span class="text-danger"><c:out value="${book.user.userName}"/></span> read <span class="text-success"><c:out value="${book.title}"/></span> by <span class="text-primary"><c:out value="${book.author}"/></span>.</h3>
	
		<h4 class="text-strong m-5">Here are ${book.user.userName}'s thoughts:</h4>
		<p class="m-5 text-wrap"><c:out value="${book.thoughts}"/></p>

		<div class="border border-solid m-5"></div>
		
		<div  class="text-center mt-5 d-flex align-items-center">
			<form action="/books/${book.id}/delete" method="POST" class="my-auto mx-auto">
			
				<c:if test="${sessionScope.userId == book.user.id}" >
				
					<a href="/books/${book.id}/edit" class="btn btn-outline-primary m-2">Edit Book</a>
					
			        <input type="hidden" name="_method" value="DELETE">
			        <button type="submit" class="btn btn-outline-danger">Delete Book</button>
			        
		        </c:if>
		        
		        <a href="/dashboard" class="btn btn-outline-secondary m-2">Back to my shelf</a>
		        
	    	</form>
		</div>
		
	</div>
</body>
</html>