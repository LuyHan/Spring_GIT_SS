<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Small Business - Start Bootstrap Template</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/css/small-business.css" rel="stylesheet">

<!-- DataTables 관련 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">

<script>
	/* 추가버튼 토글 */
	$(function() {
		$('.deptInsert').click(function(){
			$('.insertForm').toggleClass("deptVisible");
			$('.insertDeptno').focus();
		});
	})
	/* 삭제 경고문 */
	function deptDel(number) {
		if(confirm(number + "번 부서를 정말 삭제하시겠습니까?")==true) {
		location.href="deptDelete.htm?deptno="+number;
		} else {
			return;
		}
	}
	/* 수정 폼 열기 */
	function deptUpdate(deptno) {
		$('.updateForm').toggleClass("deptVisible");
		$('.updateDeptno').attr("value", deptno);
		/* $('.updateDname').attr("value", dname);
		$('.updateLoc').attr("value", loc); */
		$('.updateDname').focus();
		
	}
	/* 추가, 수정 취소버튼 */
	function insertCancel() {
		$('.insertForm').toggleClass("deptVisible");
	}
	function updateCancel() {
		$('.updateForm').toggleClass("deptVisible");
	}
	/* 중복검사 */
	function checkDeptno(){
		var deptno = $('.insertDeptno').val();
		$.ajax({
			type:'GET',
			url:"checkDeptno.htm",
			data:"deptno="+deptno,
			success:function(data){
				var deptlist;
				$.each(data.list, function(index,value){
					deptlist = index;
				})
				if(deptlist!=null){
					/* alert("부서번호가 존재합니다."); */
					$('#deptnoChkSpan').empty();
					$('#deptnoChkSpan').append("부서번호가 존재합니다.");
					$('.insertDeptno').focus();
				} else{
					/* alert("사용 가능한 번호입니다."); */
					$('#deptnoChkSpan').empty();
					$('#deptnoChkSpan').append("사용가능한 번호입니다.");	
				}
			},
			error:function(xml){
				alert("에러다.");
			}
		});
		return false;
	}
	/* 추가 비동기 */
	function insertbtn() {
		 var _param = {deptno:$(".insertDeptno").val(), dname:$(".insertDname").val() , loc:$(".insertLoc").val()};
		 _data = JSON.stringify(_param); //jsonString으로 변환
		$.ajax(
			{
				type:"POST",
				url:"deptInsert.htm",
				dataType:"json",
				data:_data,
				processData: false,
				contentType: "application/json; charset=utf-8",
				success: function(data, status) {
					location.href="deptList.htm";
				},
				error: function(request, status, error){
	   			      console.log("code : " +  request.statusText  + "\r\nmessage : " + request.responseText);
	   			}
			}		
		);
	}
</script>
<style>
.deptVisible {
	display:none;
}
</style>
</head>

<body>

	<!-- Navigation -->
	<tiles:insertAttribute name="header" />

	<!-- Page Content -->

	<div class="container">

		<tiles:insertAttribute name="content" />

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<tiles:insertAttribute name="footer" />

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/vendor/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- 테이블 관련  -->

	<script>
		$(document).ready(function() {
			$('#myTable').DataTable(
			/*  buttons: [
			        { extend: 'create', editor: myEditor },
			        { extend: 'edit',   editor: myEditor },
			        { extend: 'remove', editor: myEditor }
			    ]		 */
			);
		});
	</script>

	<script type="text/javascript" charset="utf8"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<!-- 테이블 관련 end -->
</body>

</html>
