<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%
String rand = (String)session.getAttribute("rand");
String input = request.getParameter("random_code");
//boolean validate_r=false;
if(rand.equals(input)){
	//validate_r=true;
	out.print("validate_t");
} else{
	out.print("validate_f");
}
System.out.println("-------------------");
%> 