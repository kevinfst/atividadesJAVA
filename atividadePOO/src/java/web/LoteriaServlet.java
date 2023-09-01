package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "LoteriaServlet", urlPatterns = {"/loteria.html"})
public class LoteriaServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int n = 6;

        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Loteria Servlet</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("<form>");
            // se quiser usar outra quantia out.println("<input type='number' name='n' value='6'/>");
            out.println("<input type='submit' name='random' value='Gerar'/>");
            out.println("</form>");

            out.println("<table border='1'>");
            out.println("<tr>");
            out.println("<th>Index</th><th>Number</th>");
            out.println("</tr>");

            HashSet<Integer> numerosUtilizados = new HashSet<>();

            for (int i = 1; i <= n; i++) {
                out.println("<tr>");
                out.println("<th>" + i + "</th>");

                int r;

                do {
                    r = 1 + ((int) (60 * Math.random()));
                } while (numerosUtilizados.contains(r));

                numerosUtilizados.add(r);
                out.println("<td>" + r + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
