<%-- 
    Document   : chevalAjouter
    Created on : 12 oct. 2018, 09:03:08
    Author     : slam
--%>

<%@page import="modele.Cheval"%>
<%@page import="modele.Lot"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modele.TypeCheval"%>
<%@page import="formulaires.ChevalForm"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/vues/include/header.jsp" />

<%
	//On doit afficher les information du cheval dans les inputs si il est différent de null.
	//On doit également changer l'action selon que le cheval soit null ou non
	//De manière général, si le cheval est null alors on en ajoute un. Sinon on le modifie
	ChevalForm form = (ChevalForm) request.getAttribute("form");
	ArrayList<TypeCheval> lesTypeCheval = (ArrayList) request.getAttribute("pLesTypeCheval");
	Cheval unCheval = (Cheval) request.getAttribute("pCheval");
%>

<h2 class="center-align"><%= (unCheval == null) ? "Nouveau" : "Modifier un"%> cheval</h2>

<div class="row">
	<form class="col s10 push-s1 l8 push-l2 center-align" action="<%= (unCheval == null) ? "ajouterCheval" : "chevalModifier"%>" method="POST">
		
		<input type="hidden" name="id" value="<%= (unCheval != null) ? unCheval.getId() : ""%>">

		<div class="row">
			<div class="input-field col l6 s12">
				<input id="nom" type="text" name="nom" size="30" maxlength="30" value="<%= (unCheval != null) ? unCheval.getNom() : ""%>" class="validate">
				<label for="nom">Nom : </label>
			</div>

			<div class="input-field col l6 s12">
				<select id="sexe" name="sexe">
					<option value="0" <%
						if (unCheval != null) {
							if (!unCheval.getMale()) {
								out.print("selected");
							}
						}
							%>>Femelle</option>
					<option value="1" <%
						if (unCheval != null) {
							if (unCheval.getMale()) {
								out.print("selected");
							}
						}
							%>>Male</option>
				</select>
				<label for="sexe">Sexe : </label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col s12">
				<input id="sire" type="text" name="sire" size="30" maxlength="50" value="<%= (unCheval != null) ? unCheval.getSire() : ""%>" class="validate">
				<label for="sire">SIRE : </label>
			</div>
		</div>

		<%-- Champ Liste des typeCheval --%>
		<div class="row">
			<div class="input-field col s12">
				<select name="typeCheval">

					<%
						for (int i = 0; i < lesTypeCheval.size(); i++) {
							TypeCheval tc = lesTypeCheval.get(i);
					%>
					<option value="<%=tc.getId()%>" <%
						if (unCheval != null) {
							if (tc.getId() == unCheval.getTypeCheval().getId()) {
								System.out.println("className.methodName()"+unCheval.getTypeCheval().getId());
								out.print("selected");
							}
						}%>><%=tc.getLibelle()%></option>
					<%
						}
					%>
				</select>
				<label for="typeCheval">Race: </label>
			</div>
		</div>

		<div class="row">
			<div class="input-field col l6 s12">
				<input id="mere" type="text" name="mere" size="30" maxlength="50" value="<%=(unCheval != null && unCheval.getMere() != null) ? unCheval.getMere().getSire() : ""%>" class="validate">
				<label for="mere">Mère : </label>
			</div>
				
			<div class="input-field col l6 s12">
				<input id="pere" type="text" name="pere" size="30" maxlength="50" value="<%=(unCheval != null && unCheval.getPere() != null) ? unCheval.getPere().getSire() : ""%>" class="validate">
				<label for="pere">Père : </label>
			</div>
		</div>

		<input type="submit" name="valider" id="valider" value="Valider"/>
	</form>
</div>

<jsp:include page="/vues/include/footer.jsp" />