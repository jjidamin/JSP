<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"></jsp:include>

<section style="position:fixed;top:60px;left:0px;width:100%;height:100%;background-color:lightgray;">
<h2 style="text-align:center">좌석예약조회</h2>
<form method="post" action="l_action.jsp" name="frm2" style="display:flex;align-items:center;justify-content:center; text-align:center">
<table border="1">

<tr>
<td>사원번호를 입력하시오.</td>
<td><input type="text" name="empno"></td>
</tr>

<tr style="text-align:center">
<td colspan="2">
<input type="button" value="좌석예약조회" onclick="search()">
<input type="button" value="홈으로" onclick="home()">
</td>
</tr>

</table>
</form>
</section>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>