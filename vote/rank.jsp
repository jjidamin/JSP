<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="width: 100vw; height: 100%; position: fixed; top: 80px; left: 0; background-color: #f3f3f3;">
		<h1 style="text-align: center;">후보자등수</h1>
		<form style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<table border="1">
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>총두표건수</td>
				</tr>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					
					try {
						conn = Util.getConnection();
						String sql = "select TV.M_NO, TM.M_NAME, count(*) vote "+
								"from TBL_VOTE_202005 TV, TBL_MEMBER_202005 TM " +
								"where TV.M_NO = TM.M_NO AND TV.V_CONFIRM = 'Y' " +
								"group by TV.M_NO, TM.M_NAME " +
								"order by vote DESC";
						
						pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()) {
							%>
							
							<tr>
							 	<td><%=rs.getString(1) %></td>
							 	<td><%=rs.getString(2) %></td>
							 	<td><%=rs.getString(3) %></td>
							</tr>
							<% 
						}
					}
					
					catch(Exception e) {
						e.printStackTrace();
					}
					
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>