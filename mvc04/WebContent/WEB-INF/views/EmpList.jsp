<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$(".updateBtn").click(function()
		{
			// 테스트
			//alert("수정 버튼 클릭");
			//employeeupdateform.action 페이지 요청하면서 employeeId 전송
			
			$(location).attr("href", "employeeupdateform.action?employeeId=" + $(this).val());
			
			
		});
		
		$(".deleteBtn").click(function()
		{
			// 테스트
			//alert("삭제 버튼 클릭");
			
			if(confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "employeedelete.action?employeeId=" + $(this).val());
			}
		});
		
	});;

</script>

</head>
<body>

<!------------------------------------------------------------------
  #31. EmpList.jsp
  - 직원 리스트 출력 페이지.
  - 일반직원이 접근하는 직원 데이터 출력 페이지
  - 입력 / 수정 / 삭제 기능 없음.
------------------------------------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmpMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		<h1>[ 직원 리스트(일반직원 전용) ]</h1>
		<hr />
		
		<!-- EMPLOYEEID NAME DEPARTMENTNAME POSITIONNAME REGIONNAME GRADE  -->
		
		<table id="customers" class="table">
			<tr>
			 	<!-- 항목 6EA -->
				<th>번호</th>
				<th>이름</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>등급</th>
			</tr>
			<!-- 
			<tr>
				<td>1</td>
				<td>박나현</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>관리자</td>
			</tr>
			-->
			<c:forEach var="employee" items="${employeeList}">
				<tr>
					<td>${employee.employeeId }</td>
					<td>${employee.name }</td>
					<td>${employee.regionName }</td>
					<td>${employee.departmentName }</td>
					<td>${employee.positionName }</td>
					<td>${employee.grade==0? "관리자" : "일반직원" }</td>
				</tr>
			</c:forEach>
			<!-- 이미 뷰페이지에 가져올 때 주민번호, 급여, 휴대폰번호 등을 다 가지고 온 상태
				 모든 정보 가져와서 아이디, 이름, 지역, 부서, 직위, 등급 등만 보여주는 상태.
				 (즉, 짜장면 배달오면서 양장피랑 짬뽕이랑 탕수육 다 가져와서 짜장면만 내어주는 상태)
			     나쁜 마음을 먹으면 충분히 정보를 빼갈 수 있는 상황. (양장피, 짬뽕, 탕수육 탈취 당할 수 있음)
			     실무에 나가서는 이렇게 처리하지 않도록 한다. -->
		</table>
	
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>

</body>
</html>