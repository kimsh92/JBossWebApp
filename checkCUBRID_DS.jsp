<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<html>
<head>
<title>JDBC Test with Datasource</title>
</head>
<body>
<h1> JDBC Connection TEST </h2>
<%

try {
	InitialContext ctx = new InitialContext();
	DataSource ds = (DataSource) ctx.lookup("java:/cubridDS");
	Connection conn = ds.getConnection();
     	String sql = "select name, players from event where rownum < 10";

        Statement  st=null;
        ResultSet  rs=null;
        st=conn.createStatement();
        rs=st.executeQuery(sql);
        out.println("Connection Success <br>");
        out.println(rs.getType());

        while(rs.next())
        {
                out.println("name : "+rs.getString("name")+"<br>");
                out.println("players :" + rs.getString("players")+"<br>");
        }


	conn.close();
} catch (SQLException sqlE) {

        sqlE.printStackTrace();
        /*if(sqlE.getMessage().contains("password") || sqlE.getMessage().contains("username")){
                out.println("Connection Success <br>");
                out.println(" username/password incorrect");
        }else{
                out.println("Connection Fail <br>");
                out.println(sqlE.getMessage());
        }*/

} catch (Exception e) {
    e.printStackTrace();
    out.println("Connection Fail <br>");
        out.println(e.getMessage());
}

%>
</body>
</html>
