/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import database.CategVenteDAO;
import database.ChevalDAO;
import database.ClientDAO;
import database.LotDAO;
import database.PaysDAO;
import database.TypeChevalDAO;
import formulaires.ChevalForm;
import formulaires.ClientForm;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modele.CategVente;
import modele.Cheval;
import modele.Client;
import modele.Lot;
import modele.Pays;
import modele.TypeCheval;

/**
 *
 * @author slam
 */
@WebServlet(name = "ServletCheval", urlPatterns = {"/ServletCheval"})
public class ServletCheval extends HttpServlet {

    Connection connection ;
      
        
    @Override
    public void init()
    {     
        ServletContext servletContext=getServletContext();
        connection=(Connection)servletContext.getAttribute("connection");
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletCheval</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletCheval at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
         String url = request.getRequestURI();
       
       if(url.equals("/EquidaWebG2/ServletCheval/ajouterCheval"))
        {                   
            /*ArrayList<Lot> lesLots = LotDAO.getLesLots(connection);
            request.setAttribute("pLesLots", lesLots);*/
            
            ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeCheval(connection);
            request.setAttribute("pLesTypeCheval", lesTypeCheval);
            this.getServletContext().getRequestDispatcher("/vues/chevalAjouter.jsp" ).forward( request, response );
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                   
         /* Préparation de l'objet formulaire */
        ChevalForm form = new ChevalForm();
		
        /* Appel au traitement et à la validation de la requête, et récupération du bean en résultant */
        Cheval unCheval = form.getCheval(request, connection);
        
        /* Stockage du formulaire et de l'objet dans l'objet request */
        request.setAttribute( "form", form );
        request.setAttribute( "pCheval", unCheval );
		
        if (form.getErreurs().isEmpty()){
            // Il n'y a pas eu d'erreurs de saisie, donc on renvoie la vue affichant les infos du client 
            ChevalDAO.ajouterCheval(connection, unCheval);
            this.getServletContext().getRequestDispatcher("/vues/chevalConsulter.jsp" ).forward( request, response );
        }
        else
        { 
		// il y a des erreurs. On réaffiche le formulaire avec des messages d'erreurs
            ArrayList<TypeCheval> lesTypeCheval = TypeChevalDAO.getLesTypeCheval(connection);
            request.setAttribute("pLesTypeCheval", lesTypeCheval);
            
            /*ArrayList<Lot> lesLots = LotDAO.getLesLots(connection);
            request.setAttribute("pLesLots", lesLots);*/
           this.getServletContext().getRequestDispatcher("/vues/chevalAjouter.jsp" ).forward( request, response );
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
