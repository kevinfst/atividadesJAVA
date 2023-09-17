
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.util.Calendar, java.text.SimpleDateFormat, java.util.Locale"%>
<%
    
    int ano = 0;
    int mes = 0;

   
    if (request.getParameter("ano") != null && request.getParameter("mes") != null) {
        ano = Integer.parseInt(request.getParameter("ano"));
        mes = Integer.parseInt(request.getParameter("mes"));
    }

    
    Calendar calendario = Calendar.getInstance();
    calendario.set(ano, mes - 1, 1); 

  
    SimpleDateFormat formatoMes = new SimpleDateFormat("MMMM yyyy", Locale.getDefault());

   
    String[] diasDaSemana = {"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"};
%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Calendário</title>
    <style>
        table {
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            text-align: center;
            padding: 5px;
        }
    </style>
</head>
<body>
    <h1>Calendário</h1>
    <form method="get">
        <label for="ano">Ano:</label>
        <input type="text" id="ano" name="ano" value="<%= ano %>">
        <label for="mes">Mês:</label>
        <input type="text" id="mes" name="mes" value="<%= mes %>">
        <input type="submit" value="Mostrar Calendário">
    </form>
    
    <h2><%= formatoMes.format(calendario.getTime()) %></h2>
    
    <table>
        <tr>
            <% for (String diaDaSemana : diasDaSemana) { %>
                <th><%= diaDaSemana %></th>
            <% } %>
        </tr>
        <%
            int maxDia = calendario.getActualMaximum(Calendar.DAY_OF_MONTH);

            
            int diaDaSemana = calendario.get(Calendar.DAY_OF_WEEK);
            boolean novaLinha = true;
            int diaAtual = 1;

            while (diaAtual <= maxDia) {
                if (novaLinha) {
                    out.println("<tr>");
                    novaLinha = false;

                    
                    for (int i = 1; i < diaDaSemana; i++) {
                        out.println("<td></td>");
                    }
                }

                out.println("<td>" + diaAtual + "</td>");

                if (diaDaSemana == Calendar.SATURDAY) {
                    out.println("</tr>");
                    novaLinha = true;
                }

                calendario.add(Calendar.DAY_OF_MONTH, 1);
                diaDaSemana = calendario.get(Calendar.DAY_OF_WEEK);
                diaAtual++;
            }
        %>
    </table>
</body>
</html>
