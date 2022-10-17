<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>count</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section style="position:fixed;top:60px;left:0px;width:100%;height:100%;background-color:lightgray;">
<h2 style="text-align:center">근무일수집계</h2>
<form style="display:flex;align-items:center;justify-content:center; text-align:center">
<table border="1">
<tr>
<td>사원번호</td>
<td>이름</td>
<td>부서명</td>
<td>근무일수</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

try{
Connection conn=Util.getConnection();
String sql="select em.empno,empname,deptcode,count(resvno) " + 
			"from tbl_emp em, tbl_resv re " + 
			"where em.empno=re.empno group by em.empno,empname,deptcode order by deptcode";
PreparedStatement pstmt=conn.prepareStatement(sql);
ResultSet rs=pstmt.executeQuery();
while(rs.next()){
	String deptcode=rs.getString(3);
	if(deptcode.equals("10"))
		deptcode="영업팀";
	else if(deptcode.equals("20"))
		deptcode="총무팀";
	else if(deptcode.equals("30"))
		deptcode="구매팀";
%>
	<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=deptcode %></td>
	<td><%=rs.getString(4) %></td>
	</tr>
<%
	
}
}
catch(Exception e){
	e.printStackTrace();
}
%>

</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>