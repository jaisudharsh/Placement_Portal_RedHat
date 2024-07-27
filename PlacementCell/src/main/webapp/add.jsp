<%@page import="java.sql.*" %>
<%
String brand=request.getParameter("Company");
String model=request.getParameter("Role");
String processor=request.getParameter("Domain");
int ram=Integer.parseInt(request.getParameter("ctc"));
String storage=request.getParameter("location");
double displaysize=Double.parseDouble(request.getParameter("cgpa"));


double pricce=Double.parseDouble(request.getParameter("certficates"));
try
{
    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver");
      System.out.println("Driver Class Loaded");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "1234");
      System.out.println("Connection Established"); 
      
      PreparedStatement pstmt = con.prepareStatement("insert into jobs(Company,Role,Domain,ctc,location,cgpa,certficates) values(?,?,?,?,?,?,?)");
      pstmt.setString(1, Company);
      pstmt.setString(2, Role);
      pstmt.setString(3, Domain);
      pstmt.setInt(4, ctc);
      pstmt.setString(5, location);
      pstmt.setDouble(6, cgpa);
      pstmt.setDouble(7, certficates);
      pstmt.executeUpdate();
      
      response.sendRedirect("addsuccess.html"); //response is implicit object
}
catch(Exception e)
{
  out.println(e);
}
%>