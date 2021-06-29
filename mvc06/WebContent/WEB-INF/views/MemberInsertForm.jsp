<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
</head>
<body>

<div>
	<h1>회원 등록</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.action" method="post" id="memberForm">
		<table>
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" id="id" name="id" placeholder="아이디"><br>
			</td>	
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" id="pw" name="pw" placeholder="비밀번호"><br>
			</td>
		</tr>
		<tr>	
			<th>이름</th>
			<td>
				<input type="text" id="name" name="name" placeholder="이름"><br>
			</td>
		</tr>
		<tr>	
			<th>전화번호</th>
			<td>
				<input type="text" id="tel" name="tel" placeholder="전화번호"><br>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="text" id="email" name="email" placeholder="이메일">
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<button type="submit" id="submitBtn" >등록</button>
				<button type="reset" id="resetBtn">취소</button>
				<button type="button" id="listBtn" onclick="location.href='memberlist.action'">목록으로</button>
			</td>
		</tr>
	</table>
	</form>
</div>

</body>
</html>