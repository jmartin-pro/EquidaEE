<%-- 
    Document   : categorieVenteAjouter
    Created on : 12 oct. 2018, 08:50:00
    Author     : paul_collet
--%>
<%@page import="formulaires.CategorieForm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/vues/include/header.jsp" />

<h2 class="center-align">Ajouter une catégorie de vente</h2>


<%
	CategorieForm form = (CategorieForm) request.getAttribute("form");
%>

<div class="row">
	<form action="categorieVenteAjouter" method="POST" class="col s10 push-s1 l6 push-l3 center-align">
		<div class="row">
			<div class="input-field col s12">
				<input id="code" type="text" name="code" size="4" maxlength="4" class="validate">
				<label for="code">Code : </label>
			</div>
		</div>
		
		<div class="row">
			<div class="input-field col s12">
				<input id="libelle" type="text" name="libelle" size="15" maxlength="30" class="validate">
				<label for="libelle">Libelle : </label>
			</div>
		</div>
		
		<input type="submit" name="valider" id="valider" value="Valider"/>
	</form>
</div>

<jsp:include page="/vues/include/footer.jsp" />