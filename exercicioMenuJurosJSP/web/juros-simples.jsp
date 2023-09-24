<%-- 
    Document   : juros-simples
    Created on : 24 de set. de 2023, 15:45:22
    Author     : kevin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juros simples</title>
    </head>
    <body>
        <div>
            <%@include file="WEB-INF/jspf/menu.jspf" %>
        </div>
        <h1>Juros Simples</h1>
        
        <form action="" method="post">
            <label for="taxa">Taxa de Juros (%):</label>
            <input type="number" name="taxa" id="taxa" required><br><br>
            
            <label for="meses">Número de Meses:</label>
            <input type="number" name="meses" id="meses" required><br><br>
            
            <input type="submit" value="Calcular">
        </form>
        
        <%
            // Verifica o formulário 
            if (request.getMethod().equals("POST")) {
                // Recupera os valores dos campos
                double taxa = Double.parseDouble(request.getParameter("taxa"));
                int meses = Integer.parseInt(request.getParameter("meses"));
                
                // Calcula o valor futuro
                double valorPrincipal = 1000.0; // aqui é o valor que será usado
                double valorFuturo = valorPrincipal * (1 + (taxa / 100) * meses);
        %>
        
        <p>O valor futuro é: <%= valorFuturo %></p>
        
         <%
            }
        %>
    </body>
</html>
