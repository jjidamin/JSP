<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>voteList</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<section style="width: 100vw; height: 100%; position: fixed; top: 80px; left: 0; background-color: #f3f3f3;">
		<h1 style="text-align: center;">과정평가형 자격 CBQ</h1>
		
		<form name="frm" method="post" style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<table border="1">
				<tr>
					<td>성명</td>
					<td>생년월일</td>
					<td>나이</td>
					<td>성별</td>
					<td>후보번호</td>
					<td>투표시간</td>
					<td>유권자확인</td>
				</tr>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					try {
						
						conn = Util.getConnection();
						String sql = "select V_NAME, V_JUMIN, M_NO, V_TIME, V_AREA, V_CONFIRM "+
								"from TBL_VOTE_202005 "+
								"where V_AREA = '제1투표장'";
						
						pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						// 051109 4623210
						while(rs.next()) {
							String year = rs.getString(2).substring(0, 2);
							String month =  rs.getString(2).substring(2, 4);
							String date = rs.getString(2).substring(4, 6);
							
							
							String hours = rs.getString(4).substring(0, 2);
							String minutes = rs.getString(4).substring(2, 4);
							
							String gender = rs.getString(2).substring(6, 7);
							switch(gender) {
								case "1": 
									gender = "남";
									year = "19" + year;
								break;
								
								case "3":
									gender="남";
									year = "20" + year;
								break;
								
								case "2":
									gender = "여";
									year = "19" + year;
								break;
									
								case "4":
									gender = "여";
									year = "20" + year;
								break;
								
								default:
									gender = "오류";
							}
							String confirm = rs.getString(6);
							switch(confirm) {
								case "Y": 
									confirm = "확인";
								break;
								case "N": 
									confirm = "미확인";
							}
							int age = 2022 - Integer.parseInt(year) - 2;
							%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=year%>년 <%=month %>월<%=date %>일</td>
								<td><%=age %></td>
								<td><%=gender %></td>
								<td><%=rs.getString(3) %></td>
								<td><%=hours %>:<%=minutes %></td>
								<td><%=confirm %></td>
							</tr>
							
							<%
						}
					} catch(Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</form>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>