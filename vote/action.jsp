<%@page import="java.sql.*"%>
<%@page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		Connection conn = null;
		Statement stmt = null;
		PreparedStatement pstmt = null;
		
		String mode = request.getParameter("mode");
		String jumin = request.getParameter("jumin");
		String name = request.getParameter("name");
		String voteNum = request.getParameter("voteNum");
		String time = request.getParameter("time");
		String area = request.getParameter("area");
		String confirm = request.getParameter("confirm");


		try {
			conn = Util.getConnection();
			stmt = conn.createStatement();
			
			String sql = "";
			
			switch(mode) {
			case "insert" : 
				sql = "INSERT INTO tbl_vote_202005 VALUES(" 
						+ jumin + ","
						+ "'" + name + "'" + "," 
						+ "'" + voteNum + "'" + ","
						+ "'" + time + "'" + ","
						+ "'" + area + "'" + ","
						+ "'" + confirm + "'" 
				+")";
				stmt.executeUpdate(sql);				
			%>
			<jsp:forward page="voteList.jsp"/>
			<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>