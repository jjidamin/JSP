<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");

String resvno=request.getParameter("resvno");
String empno=request.getParameter("empno");
String resvdate=request.getParameter("resvdate");
String seatno=request.getParameter("seatno");

try{
	Connection conn=Util.getConnection();
	String sql="insert into tbl_resv values(?,?,?,?)";
	PreparedStatement pstmt=conn.prepareStatement(sql);
	
	pstmt.setString(1,resvno);
	pstmt.setString(2,empno);
	pstmt.setString(3,resvdate);
	pstmt.setString(4,seatno);
	
	pstmt.executeUpdate();
%>
<jsp:forward page="insert.jsp"></jsp:forward>
<%	
}
 

catch(Exception e){
	e.printStackTrace();
}

%>