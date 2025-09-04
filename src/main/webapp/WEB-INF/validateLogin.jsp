<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String uname = request.getParameter("username");
    String pass  = request.getParameter("password");

    // JDBC connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/Login?useSSL=false&serverTimezone=UTC";
    String dbUser  = "root";
    String dbPass  = "";

    boolean isValid = false;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, uname);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            isValid = true;
        }

        rs.close();
        ps.close();
        con.close();
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }

    if(isValid){
        // Save session
        session.setAttribute("username", uname);
        response.sendRedirect("quote.jsp");
    } else {
        out.println("<h3 style='color:red;'>Invalid Username or Password!</h3>");
        out.println("<a href='login.jsp'>Try again</a>");
    }
%>
