<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../include/adminHeader.jsp"></jsp:include>
<link rel="stylesheet" href="/resources/css/admin.css" type="text/css">
<style>
a{
text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<h1>결제정보</h1>
		
		<div class="mb-2">
			<form class="row">
				<div class="col-8"></div>
				<div class="col-auto">
					<select name="search" class="form-select">
						<option value="0">검색항목</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>예약번호</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>회원 아이디</option>
						<option value="3" ${pager.search == 3 ? 'selected' : ''}>결제액</option>
						<option value="4" ${pager.search == 3 ? 'selected' : ''}>예약일</option>
						<option value="5" ${pager.search == 3 ? 'selected' : ''}>체크인</option>
						<option value="6" ${pager.search == 3 ? 'selected' : ''}>체크아웃</option>
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
					<td>예약번호</td>
					<td>회원아이디</td>
					<td>결제액</td>
					<td>예약일</td>
					<td>체크인</td>
					<td>체크아웃</td>
				</tr>
			</thead>
			<tbody>
			
				<c:if test="${list.size() < 1}">				
					<tr>
						<td colspan="3">등록된 회원정보가 없습니다.</td>
					</tr>
				</c:if>
				
				<c:forEach var="reserv" items="${list}">				
					<tr>
						<td>${reserv.reservationId}</td>
						<td>${reserv.member.id}</td>
						<td>${reserv.totalPay}</td>
						<td><fmt:formatDate value="${reserv.reserveDate}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${reserv.checkIn}" pattern="yyyy-MM-dd"/></td>
						<td><fmt:formatDate value="${reserv.checkOut}" pattern="yyyy-MM-dd"/></td>
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