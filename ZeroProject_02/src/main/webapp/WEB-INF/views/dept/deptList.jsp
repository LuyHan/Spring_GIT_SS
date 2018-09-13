<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Heading Row -->
<div class="row my-4">
	<div class="col-lg-12">
		<!-- dataTable -->
		<c:set var="deptlist" value="${requestScope.list}"></c:set>
		<div align=center>
			<hr color=green width=400>
			<h2>Dept List</h2>
			<hr color=green width=400>
			<br> <br>

			<table id="myTable" class="compact">
				<thead>
					<tr>
						<th class="deptno">Deptno</th>
						<th class="dname">Dname</th>
						<th class="loc">Loc</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="n">
						<tr>
							<td class="deptno">${n.deptno}</td>
							<td class="dname">${n.dname}</td>
							<td class="loc">${n.loc}</td>
							<td><button onclick="deptDel(${n.deptno})">삭제</button>&nbsp;
								<button onclick="deptUpdate(${n.deptno})">수정</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<br>
	</div>
	<!-- /.col-lg-12 -->

</div>
<!-- /.row -->

<div class="card text-white bg-secondary my-4 text-center">
	<div class="card-body">
		<p class="text-white m-0 ">
			<button class="deptInsert">DeptList 추가</button>
		</p>
		<hr>
		<!-- 리스트 추가 -->
		<form action="deptInsert.htm" method="post"
			class="insertForm deptVisible">
			<div align="center">
				<table width="600" border="0" cellpadding="10">
					<tr align="center" bgcolor="#dddddd" height="50">
						<td colspan="2"><font size="4" color="#082249" face="arial">
								<b> Department 정보 추가 </b>
						</font></td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 번호</b></td>
						<td><input type="text" size="40" name="deptno" maxlength="10"
							class="insertDeptno" required><button onclick="checkDeptno()">중복검사</button>
							&nbsp;&nbsp;<span id="deptnoChkSpan"></span>
						</td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 이름</b></td>
						<td><input type="text" size="40" name="dname" maxlength="60" class="insertDname" required>
						</td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 위치</b></td>
						<td><input type='text' class="insertLoc" size="40" cols="50" class="box2"
							name="loc" required></td>
					</tr>
					<tr bgcolor="#dddddd">
						<td colspan="2" align="center" class="c2"><input
							type="button" value="추가" id="btnsumbit" onclick="insertbtn()"> 
							<input type="button" value="취소" onClick="insertCancel()"></td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
		<!-- 리스트 수정 -->
		<form action="deptUpdate.htm" method="post" 
			class="updateForm deptVisible">
			<div align="center">
				<table width="600" border="0" cellpadding="10">
					<tr align="center" bgcolor="#dddddd" height="50">
						<td colspan="2"><font size="4" color="#082249" face="arial">
								<b> Department 정보 수정 </b>
						</font></td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 번호</b></td>
						<td><input type="text" size="40" name="deptno" maxlength="10"
							class="updateDeptno" value="" required></td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 이름</b></td>
						<td><input type="text" size="40" name="dname" maxlength="60"
							class="updateDname" required>
						</td>
					</tr>
					<tr>
						<td width="25%" align="center"><b>부서 위치</b></td>
						<td><input type='text' size="40" cols="50" class="box2 updateLoc"
							name="loc" required></td>
					</tr>
					<tr bgcolor="#dddddd">
						<td colspan="2" align="center" class="c2"><input
							type="submit" value="수정" id="btnsumbit"> <input
							type="button" value="취소" onClick="updateCancel()">

						</td>
					</tr>

				</table>
			</div>
			<hr>

		</form>
	</div>
</div>

<!-- Content Row -->
<div class="row">
	<div class="col-md-4 mb-4">
		<div class="card h-100">
			<div class="card-body">
				<h2 class="card-title">Card One</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Rem magni quas ex numquam, maxime minus quam
					molestias corporis quod, ea minima accusamus.</p>
			</div>
			<div class="card-footer">
				<a href="#" class="btn btn-primary">More Info</a>
			</div>
		</div>
	</div>
	<!-- /.col-md-4 -->
	<div class="col-md-4 mb-4">
		<div class="card h-100">
			<div class="card-body">
				<h2 class="card-title">Card Two</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Quod tenetur ex natus at dolorem enim! Nesciunt
					pariatur voluptatem sunt quam eaque, vel, non in id dolore
					voluptates quos eligendi labore.</p>
			</div>
			<div class="card-footer">
				<a href="#" class="btn btn-primary">More Info</a>
			</div>
		</div>
	</div>
	<!-- /.col-md-4 -->
	<div class="col-md-4 mb-4">
		<div class="card h-100">
			<div class="card-body">
				<h2 class="card-title">Card Three</h2>
				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Rem magni quas ex numquam, maxime minus quam
					molestias corporis quod, ea minima accusamus.</p>
			</div>
			<div class="card-footer">
				<a href="#" class="btn btn-primary">More Info</a>
			</div>
		</div>
	</div>
	<!-- /.col-md-4 -->

</div>
<!-- /.row -->