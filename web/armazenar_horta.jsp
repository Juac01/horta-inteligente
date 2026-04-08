<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.InputStream"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //receber dados
            String tipo;
            String data_; //mudar para string se der erro
            String status_fruta;

            tipo = request.getParameter("Tipo");

            //aplicar este código após mudar para String
            data_ = request.getParameter("Data"); // Recupere a data do formulário
            SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
            Date data_registro = formato.parse(data_);

            status_fruta = request.getParameter("Status");

            try {
                Properties props = new Properties();
                InputStream input = application.getResourceAsStream("/WEB-INF/db.properties");
                props.load(input);

                String url = props.getProperty("db.url");
                String user = props.getProperty("db.user");
                String password = props.getProperty("db.password");

                //conexão com o BD
                PreparedStatement st;
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conecta = DriverManager.getConnection(url, user, password);
                //inserindo os dados
                st = conecta.prepareStatement("INSERT INTO fruta VALUES(?,?,?)");
                st.setString(1, tipo);
                st.setDate(2, new java.sql.Date(data_registro.getTime()));
                st.setString(3, status_fruta);

                //executa o comando INSERT
                st.executeUpdate();
                out.print("<p style='color:#212529;font-size:15px'>Fruta cadastrada com sucesso</p>");
            } catch (Exception x) {
                String erro = x.getMessage();
                if (erro.contains("Duplicate entry")) {
                    out.print("<p style='color:#212529;font-size:15px'>Esta fruta já está cadastrado</p>");
                } else {
                    out.print("<p style='color:#212529;font-size:15px'>Mensagem de erro:" + erro + "</p>");
                }
            }
        %>   
    </body>
</html>
