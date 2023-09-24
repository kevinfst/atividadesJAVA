<%-- 
    Document   : juros-compostos
    Created on : 24 de set. de 2023, 15:45:22
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Juros Compostos</title>
</head>
<body>
    <div>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
    </div>
    <h1>Juros Compostos</h1>
    
    <form action="" method="post">
        <label for="taxa">Taxa de Juros (%):</label>
        <input type="number" name="taxa" id="taxa" required><br><br>

        <label for="meses">Número de Meses:</label>
        <input type="number" name="meses" id="meses" required><br><br>

        <input type="submit" value="Calcular">
    </form>

    <%
        // Verifica o form
        if (request.getMethod().equals("POST")) {
            // Recupera os valores dos campos
            double taxa = Double.parseDouble(request.getParameter("taxa"));
            int meses = Integer.parseInt(request.getParameter("meses"));
            double valorPrincipal = 1000.0; // aqui é o valor que será usado
            
            // Cabeçalho da tabela
    %>
    <table border="1">
        <tr>
            <th>Mês</th>
            <th>Valor Futuro</th>
        </tr>
    <%
            // Loop p/ calcular os valores futuros acumulados por período
            for (int i = 1; i <= meses; i++) {
                valorPrincipal *= (1 + taxa / 100);
    %>
        <tr>
            <td><%= i %></td>
            <td><%= valorPrincipal %></td>
        </tr>
    <%
            }
    %>
    </table>
    <%
        }
    %>
</body>
</html>
