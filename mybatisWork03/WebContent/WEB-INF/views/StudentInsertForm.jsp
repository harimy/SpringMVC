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

<div class="container">
	<div class="panel-group">
		<div class="panel-default">
			
			<div class="panel-heading" id="title">
				학생 정보 입력
			</div>
			
			<div class="panel-body">
				<form action="studentinsert.action" role="form" method="post">
					<div class="form-group">
						<label for="name">
							NAME : 
						</label>
						<input type="text" name="name" class="form-control" id="name" />
					</div>
					
					<div class="form-group">
						<label for="tel">
							TELEPHONE : 
						</label>
						<input type="text" name="tel" class="form-control" id="tel" />
					</div>
					
					<button type="submit" class="btn btn-success btn-sm">SUBMIT</button>
					<button type="reset" class="btn btn-success btn-sm btnCalcel">CANCEL</button>
	
				</form>
			</div>
			
		</div>
	</div><!-- close .panel-default -->
	
</div>

</body>
</html>