<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Todos</title>
    </head>
    <body>
        <%
            try {
                Properties props = new Properties();
                InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
                props.load(input);

                String url = props.getProperty("db.url");
                String user = props.getProperty("db.user");
                String password = props.getProperty("db.password");
                // Conexão com o BD
                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conecta = DriverManager.getConnection(url, user, password);

                // Excluindo todos os dados
                PreparedStatement st = conecta.prepareStatement("DELETE FROM fruta");

                // Executa o comando DELETE
                int resultado = st.executeUpdate();

                // Verifica se alguma fruta foi removida
                if (resultado > 0) {
                    out.print("<p style='color:#212529;font-size:15px'>Todos os dados foram removidos com sucesso</p>");
                } else {
                    out.print("<p style='color:#212529;font-size:15px'>Nenhum dado encontrado para remoção</p>");
                }

            } catch (Exception erro) {
                out.print("<p style='color:#212529;font-size:15px'>O seguinte erro foi apresentado:" + erro.getMessage() + " Entre em contato com o suporte</p>");
            }
        %>
    </body>
</html>
