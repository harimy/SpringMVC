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
<title>PositionUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/menuStyle.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		
		// 직원 추가 버튼이 클릭되었을 때 수행해야 할 코드 처리
		$("#submitBtn").click(function()
		{
			var f = document.getElementById("positionForm");
			
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			
			if( $("#positionName").val()=="")
			{
				$("#err").html("필수 입력 항목이 누락되었습니다.");
				$("#err").css("display", "inline");
				return;		//-- submit 액션 처리 중단~!!!
			}
			
			$("#positionForm").submit();
		});
		
	});
	
</script>

</head>
<body>

<!------------------------------------------------------------------
  #56. PositionUpdateForm.jsp
  - 직위 데이터 수정 폼 페이지.
  - AJAX, jQuery 기능 포함.
------------------------------------------------------------------->

<div>
	<!-- 메뉴영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<div id="content">
		<h1>[ 직위 변경 ]</h1>
		<hr />
		
		<form action="positionupdate.action" method="post" id="positionForm">
			<table>
			<tr>
				<th>직위 번호</th>
				<td>
					<input type="text" id="positionId" name="positionId"
				 	value="${position.positionId }" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<th>직위 이름</th>
				<td>
					<input type="text" name="positionName" id="positionName"
					value="${position.positionName }" />	
				</td>
			</tr>
			<tr>
				<th>최소 기본급</th>
				<td>
					<input type="text" id="minBasicPay" name="minBasicPay"
					value="${position.minBasicPay}"/>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><br /><br />
				
               		<button type="button" style="width: 40%" class="btn" id="submitBtn">직위 변경</button>
               		<button type="button" style="width: 40%" class="btn" id="listBtn"
               		onclick="location.href='positionlist.action'">직위 리스트</button>
               		<br><br>
					
					<span id="err"
               		style="color: red; font-weight: bold; display: none;"></span>
				</td>	
			</tr>
			</table>
	
		</form>
		
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	
	</div>
	
</div>

</body>
</html>