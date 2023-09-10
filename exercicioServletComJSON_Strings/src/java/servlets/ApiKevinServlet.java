package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;
import java.util.ArrayList;


@WebServlet(name = "ApiKevinServlet", urlPatterns = {"/kevin.json"})
public class ApiKevinServlet extends HttpServlet {
    private ArrayList<String> list = new ArrayList<>();

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
       try (PrintWriter out = response.getWriter()) {
    String[] materias = {"Ética e Responsabilidade Profissional", 
        "Banco de Dados", 
        "Engenharia de Software III",
        "Programação Orientada a Objetos",
        "Linguagem de Programação IV - INTERNET",
        "Sistemas Operacionais II",
        "Inglês IV",
        "Metodologia da Pesquisa Científico-Tecnológica"
    };
    
    JSONObject kevin = new JSONObject();
    kevin.put("KevinFernandes", "RA: 1290482212047"); // Adicione o "RA" ao objeto JSON

    JSONArray materiasArray = new JSONArray();
    for (String materia : materias) {
        materiasArray.put(materia); // Adicione cada matéria ao array JSON
    }

    kevin.put("Materias", materiasArray); // Adicione o array de matérias ao objeto JSON

    out.print(kevin.toString());
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