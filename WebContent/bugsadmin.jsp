<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Welcome - BugTracker.com/Bugs List</title>
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
<table align="center" cellpadding="2" width="100%">
<tr bgcolor="#0054A8" class="whitetext" align="center" >
<td>Bug ID</td>
<td>Product</td>
<td>Env.</td>
<td>Type</td>
<td>Synopsis</td>
<td>Status</td>

</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bugtracker?" + "user=root&password=kingfisher");
	Statement stmt = con.createStatement();
	String query = "select * from bug order by bugid desc";
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
	out.println("</tr>");	
	out.print("<tr><td colspan=5>");
	%>
	<div class="smalltext">| 
	<a href="updatebug.jsp?bugid=<%=rs.getString("bugid")%>">Update Bug</a> | 
	<a href="del.jsp?bugid=<%=rs.getString("bugid")%>">Delete</a> | 
	<a href="bugdetail1.jsp?bugid=<%=rs.getString("bugid")%>">Detail</a> |</div>
	<%
	out.print("</td></tr>");
	}
	
	out.println("</table>");
	out.print("<div align=left> Total Bugs: "+(i-2)+"</div>");
}catch(Exception e){
	System.out.print(e);
}  
%>

<div align="center"><hr width="100" /><a href="admin.jsp">Back</a><hr width="100" /></div>
</td></tr>
<tr><td ><div align="center" class="greysmall"><hr />
All Rights are reserved with ABC Softwares Pvt. Ltd.</div></td></tr>
</table>
</body>
</html>
