<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
</head>
<body>
<div class="container-fluid">
		<h1>회원정보</h1>
		
		<table class="table">
			<thead class="table-dark">
				<tr>
					<td>id</td>
					<td>등록일</td>
					<td>로그인 시도</td>
				</tr>
			</thead>
			<tbody>
			
				<c:if test="${list.size() < 1}">				
					<tr>
						<td colspan="3">등록된 로그인 기록이 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="log" items="${list}">				
					<tr>
						<td>${log.memberId}</td>
						<td><fmt:formatDate value="${log.regDate}" pattern="yyyy-MM-dd"/></td>
						<td>${log.result}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
		<a class="btn btn-sm btn-primary mb-2" href="/admin/index">처음으로</a>
		</div>
	</div>
</body>
</html>