<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title></title>

<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<style>
a{
text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1>회원정보</h1>
		
		<div class="mb-2">
			<form class="row">
				<div class="col-8"></div>
				<div class="col-auto">
					<select name="search" class="form-select">
						<option value="0">검색항목</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>id</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>name</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>phone</option>
					</select>
				</div>
				
				<div class="col-auto">
					<input type="text" name="keyword" value="${pager.keyword}" class="form-control">
				</div>
				
				<div class="col-auto">
					<button class="btn btn-dark">검색</button>
				</div>
			</form>
		</div>
		
		<table class="table">
			<thead class="table-dark">
				<tr>
					<td>id</td>
					<td>name</td>
					<td>phone</td>
					<td>로그인 기록</td>
				</tr>
			</thead>
			<tbody>
			
				<c:if test="${list.size() < 1}">				
					<tr>
						<td colspan="3">등록된 회원정보가 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="member" items="${list}">				
					<tr>
						<td>${member.id}</td>
						<td>${member.name}</td>
						<td>${member.phone}</td>
						<td><a href="log/${member.id }/">기록</a></td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr class="justify-content-center">
					<td colspan="5" class="pagination">
						<div class="page-item"><a href="?page=1" class="page-link">처음</a></div>
						<div class="page-item"><a href="?page=${pager.prev}" class="page-link">이전</a></div>
							<c:forEach var="page" items="${pager.list}">
								<div class="page-item ${page == pager.page ? 'active' : ''}"><a href="?page=${page}" class="page-link">${page}</a></div>
							</c:forEach>
						<div class="page-item"><a href="?page=${pager.next}" class="page-link">다음</a></div>
						<div class="page-item"><a href="?page=${pager.last}" class="page-link">마지막</a></div>
					</td>
				</tr>
			</tfoot>
		</table>
		<div>
		<a class="btn btn-sm btn-primary mb-2" href="index">처음으로</a>
		</div>
	</div>
</body>
</html>