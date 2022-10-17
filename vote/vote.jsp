<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>index</title>
</head>
<body>
	<script src="check.js"></script>
	<jsp:include page="header.jsp"/>
	<section style="width: 100vw; height: 100%; position: fixed; top: 80px; left: 0; background-color: #f3f3f3;">
		<h1 style="text-align: center;">투표하기</h1>
		
		<form name="frm" action="action.jsp" method="post" style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<input type="hidden" name="mode" value="insert"/>
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input name="jumin" type="text"/></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input name="name"type="text"/></td>
				</tr>
				<tr>
					<td>후보번호</td>
					<td>
						<select name="voteNum">
							<option value="">선택</option>
							<option value="1">1. 김후보</option>
							<option value="2">2. 이후보</option>
							<option value="3">3. 박후보</option>
							<option value="4">4. 조후보</option>
							<option value="5">5. 최후보</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text"name="time"/></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text"name="area"/></td>
				</tr>
				<tr>
					<td>유권자 확인</td>
					<td>
						<input type="radio" name="confirm" id="confirm" value="Y"/>
						<label for="confirm">확인</label>
						<input type="radio" name="confirm" id="nonconfirm" value="N"/>
						<label for="nonconfirm">미확인</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="등록" onclick="return TryVote()"/> 
						<input type="button" onclick="return TryReset()" value="다시하기">
					</td>
				</tr>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>	

</body>
</html>