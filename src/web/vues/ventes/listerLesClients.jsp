<%-- 
    Document   : listerLesClients
    Created on : 22 juin 2017, 10:23:05
    Author     : Zakina
--%>

<%@page import="modele.Client"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/vues/include/header.jsp" />
<h1>LISTE DES CLIENTS POUR UNE CATEGORIE DE VENTE</h1>
 <%
ArrayList<Client> lesClients = (ArrayList)request.getAttribute("pLesClients");
%>
<table  class="table table-bordered table-striped table-condensed">  
    <thead>
        <tr>             
            <th>id</th>
            <th>nom</th>
            <th>prenomt</th>
            <th>pays</th>  
            <th>Rue</th>
            <th>Ville</th>
            <th>Code Postal</th>
            <th>Mail</th>
    <br>
    <br>
        </tr>
    </thead>
    <tbody>
        <tr>
            <%
            for(int i = 0; i < lesClients.size();i++)
            {

                Client unClient = lesClients.get(i);
                out.println("<tr><td>");
                out.println(unClient.getId());
                out.println("</a></td>");

                out.println("<td>");
                out.println(unClient.getNom());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getPrenom());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getPays().getNom());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getRue());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getVille());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getCopos());
                out.println("</td>");

                out.println("<td>");
                out.println(unClient.getMail());
                out.println("</td>");
            }
            %>
        </tr>
    </tbody>
</table>
<jsp:include page="/vues/include/footer.jsp" />