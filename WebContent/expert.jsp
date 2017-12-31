<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Welcome - BugTracker.com/Expert</title>
<link href="mystyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<table align="center" width="700" bgcolor="#FFFFFF">
<tr><td height="70">&nbsp;</td></tr>
<tr><td height="70"><jsp:include page="header.jsp"/></td></tr>
<tr><td>
<jsp:include page="menu.jsp"/>
</td></tr>
<tr><td height="300" valign="top">
<ul>
<li>This is List of all Reported Bugs assigned to you. 
<li>Find out the possibel causes, try to fix it and provide satisfactory comments.</ul>
<table align="center" cellpadding="2" width="100%">
<tr bgcolor="#0054A8" class="whitetext" align="center" >
<td>Bug ID</td>
<td>Product</td>
<td>Env.</td>
<td>Type</td>
<td>Synopsis</td>
<td>Status</td>
<td>&nbsp;</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bugtracker?" + "user=root&password=kingfisher");
	Statement stmt = con.createStatement();
	String query = "select * from bug where assign_to='"+(String)session.getAttribute("loginid")+"'";
	ResultSet rs = stmt.executeQuery(query);
	int i=2;
	while(rs.next()){
	if(i%2==0)
	out.println("<tr bgcolor=#CEE7FF>");
	else
	out.println("<tr bgcolor=#E8F3FF >");
	i++;
	out.print("<td class=smalltext>"+rs.getString("bugid")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("prodname")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("env")+"</td>");
	out.print("<td class=smalltext>"+rs.getString("type")+"</td>");
	out.print("<td class=smalltext>");
	String des=rs.getString("description");
	if(des.length()>40)
	des=des.substring(0,40)+". . .";
	out.println(des);
	out.print("</td>");
	out.print("<td class=smalltext>"+rs.getString("status")+"</td>");
	out.print("<td class=smalltext><a href='bugcomment.jsp?bugid="+rs.getString("bugid")+"'>Comment</a></td>");	
	out.println("</tr>");		
	}
	out.println("</table>");
	out.print("<div align=left> Total Bugs: "+(i-2)+"</div>");
}catch(Exception e){
	System.out.print(e);
}  
%>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
