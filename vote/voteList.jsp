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
		<h1 style="text-align: center;">�������� �ڰ� CBQ</h1>
		
		<form name="frm" method="post" style="display: flex; justify-content: center; align-items: center; text-align: center;">
			<table border="1">
				<tr>
					<td>����</td>
					<td>�������</td>
					<td>����</td>
					<td>����</td>
					<td>�ĺ���ȣ</td>
					<td>��ǥ�ð�</td>
					<td>������Ȯ��</td>
				</tr>
				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					try {
						
						conn = Util.getConnection();
						String sql = "select V_NAME, V_JUMIN, M_NO, V_TIME, V_AREA, V_CONFIRM "+
								"from TBL_VOTE_202005 "+
								"where V_AREA = '��1��ǥ��'";
						
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
									gender = "��";
									year = "19" + year;
								break;
								
								case "3":
									gender="��";
									year = "20" + year;
								break;
								
								case "2":
									gender = "��";
									year = "19" + year;
								break;
									
								case "4":
									gender = "��";
									year = "20" + year;
								break;
								
								default:
									gender = "����";
							}
							String confirm = rs.getString(6);
							switch(confirm) {
								case "Y": 
									confirm = "Ȯ��";
								break;
								case "N": 
									confirm = "��Ȯ��";
							}
							int age = 2022 - Integer.parseInt(year) - 2;
							%>
							<tr>
								<td><%=rs.getString(1) %></td>
								<td><%=year%>�� <%=month %>��<%=date %>��</td>
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