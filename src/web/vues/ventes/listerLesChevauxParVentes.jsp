<%@page import="modele.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/vues/include/header.jsp" />
<h1>LISTE LES CHEVAUX POUR UNE VENTE</h1>
<%
ArrayList<Lot> lesLots = (ArrayList)request.getAttribute("pLesLots");
%>
<table  class="table table-bordered table-striped table-condensed">  
    <thead>
        <tr>          
            <th>Id Lot</th>
            <th>Prix départ</th>
            <th>Id cheval</th>                    
            <th>Nom cheval</th>
            <th>Sexe cheval</th>
            <th>Sire cheval</th>
            <th>Libelle type cheval</th>
            <th>Description type cheval</th>
        </tr>
    </thead>
    <tbody>

        <%
        for(int i = 0; i < lesLots.size();i++)
        {
            Lot lot = lesLots.get(i);
            out.println("<tr>");

            out.println("<td>");
            out.println(lot.getId());
            out.println("</td>");

            out.println("<td>");
            out.println(lot.getPrixDepart());
            out.println("</td>");

            out.println("<td>");
            out.println(lot.getCheval().getId());
            out.println("</td>");

            out.println("<td>");
            out.println(lot.getCheval().getNom());
            out.println("</td>");

            out.println("<td>");
            out.println((lot.getCheval().getMale()) ? "Male" : "Femelle");
            out.println("</td>");

            out.println("<td>");
            out.println(lot.getCheval().getSire());
            out.println("</td>");                        

            out.println("<td>");
            out.println(lot.getCheval().getTypeCheval().getLibelle());
            out.println("</td>");                 

            out.println("<td>");
            out.println(lot.getCheval().getTypeCheval().getDesc());
            out.println("</td>");

            out.println("</tr>");
        }
        %>
    </tbody>
</table>
<jsp:include page="/vues/include/footer.jsp" />