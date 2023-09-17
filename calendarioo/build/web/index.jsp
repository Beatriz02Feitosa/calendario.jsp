<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Calendario</title>
    </head>
    <body>
        <h1>Tarefa - Calendário</h1>
        
        <form method="get">
            <h3>Digite mês e o ano: </h3>
            <input type="number" name="mes"/>
            <input type="number" name="ano"/>
            <input type="submit" value="Concluído"/>
        </form>
        
        <%
        int mes = 0, ano = 0;

        if (request.getParameter("mes") != null && request.getParameter("ano") != null) {
            mes = Integer.parseInt(request.getParameter("mes"));
            ano = Integer.parseInt(request.getParameter("ano"));
            }
        if (mes < 1 || mes > 12 || ano < 0) {// Verifica se o mês e o ano são válidos 
            out.println("mês ou ano inválido");
        } else {
            Calendar calendario = Calendar.getInstance();
            calendario.set(ano, mes - 1,1 ); 
            int diasNoMes = calendario.getActualMaximum(Calendar.DAY_OF_MONTH);
            int primeiroDiaDaSemana = calendario.get(Calendar.DAY_OF_WEEK);
        %>

        <h3>Calendário do mês <%= mes %> do ano de <%= ano %></h3>

        <table border="1">
            <thead>
                <tr>
                    <th>DOM</th>
                    <th>SEG</th>
                    <th>TER</th>
                    <th>QUA</th>
                    <th>QUI</th>
                    <th>SEX</th>
                    <th>SAB</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%
                        // Preenche as células vazias antes do primeiro dia do mês
                        for (int i = 1; i < primeiroDiaDaSemana; i++) {
                    %>
                    <td></td>
                    <%
                        }
                        // Preenche com os dias do mês
                        for (int dia = 1; dia <= diasNoMes; dia++) {
                    %>
                    <td><%= dia %></td>
                    <%
                        // Verifica se sábado é 7, para criar uma nova linha
                        if (calendario.get(Calendar.DAY_OF_WEEK) == Calendar.SATURDAY) {
                    %>
                    </tr><tr>
                    <%
                        }
                        calendario.add(Calendar.DAY_OF_MONTH, 1);
                        }
                    %>
                </tr>
            </tbody>
        </table>
        <%
            }
        %>
    </body>
</html>
