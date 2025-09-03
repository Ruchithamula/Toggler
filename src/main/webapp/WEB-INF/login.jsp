<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; text-align:center; padding:50px; }
        form { background: #fff; padding:20px; border-radius:10px; display:inline-block; }
        input { margin:10px; padding:8px; width:200px; }
        button { padding:8px 15px; }
    </style>
</head>
<body>
    <h2>Login</h2>
    <form action="login.jsp" method="post">
        <input type="text" name="username" placeholder="Username" required /><br/>
        <input type="password" name="password" placeholder="Password" required /><br/>
        <button type="submit">Login</button>
    </form>
    <p>New user? <a href="register.jsp">Register here</a></p>

<%
String user = request.getParameter("username");
String pass = request.getParameter("password");

if(user != null && pass != null){
    try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/Login?useSSL=false&serverTimezone=UTC",
            "root",
            "Bhargaviii_82"
        );

        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE username=? AND password=?");
        ps.setString(1, user);
        ps.setString(2, pass);
        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            session.setAttribute("username", user); // store username in session
            response.sendRedirect("quote.jsp"); // redirect to quote page
        } else {
            out.println("<p style='color:red;'>Invalid username or password!</p>");
        }

        con.close();
    } catch(Exception e){
        out.println("<p style='color:red;'>Error: "+ e.getMessage() +"</p>");
    }
}
%>
</body>
</html>
