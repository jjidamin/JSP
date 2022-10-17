<%@page import="DBPKG.Util" %>
<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<section style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray;">
<h2 style="text-align: center">고등학교 성적 조회프로그램</h2>
<form style="display: flex; text-align: center; align-items: center; justify-content: center">
<table border="1">
<tr>
	<td>학년</td>
	<td>반</td>
	<td>번호</td>
	<td>성명</td>
	<td>국어</td>
	<td>영어</td>
	<td>수학</td>
	<td>역사</td>
	<td>총점</td>
	<td>평균</td>
</tr>

<%
request.setCharacterEncoding("UTF-8");

Connection conn=Util.getConnection();
String sql="select * from examtbl order by sNo";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs= ps.executeQuery();
int korsum = 0;
int koravg=0;
int engsum=0;
int engavg=0;
int mathsum=0;
int mathavg=0;
int histsum=0;
int histavg=0;
int i=0;
int sumsum=0;
int avgsum=0;
double avgavg=0;
double sumavg=0;
while(rs.next()){
	String h=rs.getString(1);
	String grade=h.substring(0,1);
	String b=rs.getString(1);
	String ban=b.substring(1,3);
	String n=rs.getString(1);
	String num=n.substring(3,5);
	
	int sum=rs.getInt(3)+rs.getInt(4)+rs.getInt(5)+rs.getInt(6);
	double avg=sum/4;
	
	korsum+=rs.getInt(3);
	engsum+=rs.getInt(4);
	mathsum+=rs.getInt(5);
	histsum+=rs.getInt(6);
	sumsum+=sum;
	avgsum+=avg;c
	i++;
	koravg = korsum/i;
	engavg = engsum/i;
	mathavg = mathsum/i;
	histavg = histsum/i;
	avgavg=avgsum/i;
	sumavg=sumsum/i;
%>
<tr>
<td><%= grade %></td>
<td><%= ban %></td>
<td><%= num %></td>
<td><%= rs.getString(2) %></td>
<td><%= rs.getString(3) %></td>
<td><%= rs.getString(4) %></td>
<td><%= rs.getString(5) %></td>
<td><%= rs.getString(6) %></td>
<td><%= sum %></td>
<td><%= avg %></td>
</tr>
	<% 
}

%>
<tr>
<td>총점</td>
<td></td>
<td></td>
<td></td>
<td><%= korsum %></td>
<td><%= engsum %></td>
<td><%= mathsum %></td>
<td><%= histsum %></td>
<td><%=sumsum %></td>
<td><%=avgsum %></td>
</tr>
<tr>
<td>총평균</td>
<td></td>
<td></td>
<td></td>
<td><%= koravg%></td>
<td><%= engavg%></td>
<td><%= mathavg%></td>
<td><%= histavg%></td>
<td><%= sumavg%></td>
<td><%= avgavg%></td>
</tr>
</table>
</form>

</section>

<%@include file="footer.jsp" %>