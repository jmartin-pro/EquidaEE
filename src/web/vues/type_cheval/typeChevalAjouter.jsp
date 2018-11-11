<%-- 
    Document   : typeChevalAjouter
    Created on : 16 oct. 2018, 16:15:46
    Author     : slam
--%>

<%@page import="formulaires.TypeChevalForm"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/vues/include/header.jsp" />
<h1 class="center-align">Ajouter un type de cheval</h1>

<%

	TypeChevalForm form = (TypeChevalForm) request.getAttribute("form");
%>

<div class="row">

	<form class="col s10 push-s1 l8 push-l2 center-align" action="typeChevalAjouter" method="POST">
		<div class="row">
			<div class="input-field col s12">
				<input id="libelle" type="text" name="libelle"  size="15" maxlength="50" class="validate">
				<label for="libelle">Libelle : </label>
			</div>
		</div>
		<div class="row">
			<div class="input-field col s12">
				<input id="description"  type="text"  name="description" size="30" maxlength="100" class="validate">      
				<label for="description">Description : </label>

			</div>
		</div>

		<input type="submit" name="valider" id="valider" value="Valider"/>
	</form>
</div>
<jsp:include page="/vues/include/footer.jsp" />