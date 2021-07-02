<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   	request.setCharacterEncoding("UTF-8");
   	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberList.jsp</title>
<!-- 부트스트랩 css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 제이쿼리 script -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<!-- 부트스트랩 script -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(function()
	{
		$(".btnDelete").click(function()
		{
			if (confirm("현재 선택한 데이터를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "studentdelete.action?sid=" + $(this).val());
			}
			
		});
	});

</script>


</head>
<body>

<div>
	<h1>회원 정보</h1>
	<hr />
</div>

	<div class="panel panel-default">
		<div class="panel-heading">
			학생 정보 리스트
		</div>
		
		<div class="panel-body">
			<table class="table">
				<thead>
                  <tr>
                     <th>SID</th>
                     <th>NAME</th>
                     <th>SUB1</th>
                     <th>SUB2</th>
                     <th>SUB3</th>
                     <th>TOT</th>
                     <th>AVG</th>
                     <th>CH</th>
                     <th>삭제</th>
                  </tr>
               	</thead>
				<tbody>

					<c:forEach var="grade" items="${list }">
					<tr>
						<td>${grade.sid }</td>
						<td>${grade.name }</td>
						<td>${grade.sub1 }</td>
						<td>${grade.sub2 }</td>
						<td>${grade.sub3 }</td>
						<td>${grade.tot }</td>
						<td>${grade.avg }</td>
						<td>${grade.ch }</td>
						<td>
							<button type="button" class="btn btn-danger btn-xs btnDelete"
							value="${grade.sid }">삭제</button>
						</td>
					</tr>
					</c:forEach>
					
				</tbody>
			</table>
			<!-- 
			<button type="button" class="btn btn-default btn-sm">
            Count <span class="badge">2</span>
         	</button>
         	-->
         	<button type="button" class="btn btn-default btn-sm">
            Count <span class="badge">2</span>
         	</button>
         	
         	<button type="button" class="btn btn-success btn-sm"
			onclick="location.href='studentinsertform.action'">학생 추가</button>
		</div>
		
	</div>
	
</div>

</body>
</html>