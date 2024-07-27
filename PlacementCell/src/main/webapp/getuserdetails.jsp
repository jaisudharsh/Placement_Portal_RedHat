<%@page import="java.sql.*" %>
<%

String name =request.getParameter("name");
String dob =request.getParameter("dob");
int  id =Integer.parseInt(request.getParameter("id_number"));
String uname =request.getParameter("university_name");
int  cgpa =Integer.parseInt(request.getParameter("cgpa"));
String email = request.getParameter("email");
String pwd = request.getParameter("password");

%>

<%
try
{
  Connection con = null;
  System.out.println("Driver class loaded");
  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1234");
  System.out.println("connection Established");
  String sql = "INSERT INTO users (name,dob,id_number,university_name,cgpa,email,password) VALUES (?,?,?,?,?,?,?)";
  PreparedStatement pstmt = con.prepareStatement(sql);
  
  pstmt.setString(1,name);
  pstmt.setString(2,dob);
  pstmt.setInt(3,id);
  pstmt.setString(4,uname);
  pstmt.setInt(5,cgpa);
  pstmt.setString(6,email);
  pstmt.setString(7,pwd);
  
  
  pstmt.executeUpdate();
  
  response.sendRedirect("userlogin.html");//response is implicite object
  
}
catch(Exception e)
{
  //out is implicit object
  out.println(e);
}

%>