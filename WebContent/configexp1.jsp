<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<%
String prodid=(String)request.getParameter("prodid");
String expertid=(String)request.getParameter("expertid");

try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bugtracker?" + "user=root&password=kingfisher");
	Statement stmt = con.createStatement();
	//String query = "insert into experts values('"+expertid+"','"+prodid+"')";
	String query = "insert into experts (expertid,prodid)values('"+expertid+"','"+prodid+"')";
	stmt.executeUpdate(query);
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=success");
		rd.forward(request, response);
	}catch(Exception e){
		RequestDispatcher rd=request.getRequestDispatcher("configexp.jsp?msg=error");
		rd.forward(request, response);
	}	
%>