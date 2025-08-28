<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; text-align:center; padding:50px; }
        form { background: #fff; padding:20px; border-radius:10px; display:inline-block; }
        input { margin:10px; padding:8px; width:200px; }
        button { padding:8px 15px; }
    </style>
</head>
<body>
    <h2>Register</h2>
    <form method="post">
        <input type="text" name="username" placeholder="Username" required /><br/>
        <input type="password" name="password" placeholder="Password" required /><br/>
        <button type="submit">Register</button>
    </form>
    <p>Already have an account? <a href="login.jsp">Login here</a></p>

<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    if(user != null && pass != null){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/Login?useSSL=false&serverTimezone=UTC",
                "root",
                ""
            );

            PreparedStatement check = con.prepareStatement("SELECT * FROM users WHERE username=?");
            check.setString(1, user);
            ResultSet rs = check.executeQuery();

            if(rs.next()){
                out.println("<p style='color:red;'>Username already exists!</p>");
            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO users(username, password) VALUES (?, ?)");
                ps.setString(1, user);
                ps.setString(2, pass);
                ps.executeUpdate();

                out.println("<p style='color:green;'>Registration successful! You can now <a href='login.jsp'>login</a>.</p>");
            }

            con.close();
        } catch(Exception e){
            out.println("<p style='color:red;'>Error: "+ e.getMessage() +"</p>");
        }
    }
%>
</body>
</html>
