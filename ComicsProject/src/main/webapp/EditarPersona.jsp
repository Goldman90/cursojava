<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.comics.app.Model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="js/bootstrap.min.js"></script>
<title>Nueva/Editar Personas</title>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="Index.jsp">ComicsProject</a>
			</div>
			<div id="navbar" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="ComicServlet?action=listComic">Lista de
							Comics</a></li>
					<li><a href="PersonServlet?action=listPerson">Lista de
							Personas</a></li>
					<li><a href="LoanServlet?action=listLoan">Lista de
							Prestamos</a></li>
					<%
						Usuario UsLog = (Usuario) session.getAttribute("UsuarioLog");
						if (UsLog != null && UsLog.getRole().getNameRole().equals("ADMIN")) {
					%>
					<li><a href="RoleServlet?action=listRole">Lista de Roles</a></li>
					<%
						}
						if (UsLog != null && UsLog.getRole().getNameRole().equals("ADMIN")) {
					%>
					<li><a href="UsuarioServlet?action=listUsuario">Lista de
							Usuarios</a></li>
					<li></li>
					<li></li>
					<%
						}
						if (UsLog == null) {
					%>
					<li><a href="Login.jsp">Log In</a></li>
					<%
						} else {
					%>
					<li><a href="LoginServlet?action=salir">Salir</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<div class="container" style="padding-top:50px">
<h1>Nueva/Editar</h1>
<% Person PersonaEdit =(Person) request.getAttribute("person");
Integer PersonaId=0;
String NombrePersona="";
String Telefono="";
if(PersonaEdit!=null){
	PersonaId=PersonaEdit.getIdPerson();
	NombrePersona=PersonaEdit.getNamePerson();
	Telefono=PersonaEdit.getTelephonePerson();
}%>
<form method="POST" action="PersonServlet" name="frmAddPerson">
<input type="Hidden" name="PersonId" value="<%=PersonaId %>">
<div class="form-group">
<label for="NombrePersona">Nombre</label>
<input id="NombrePersona" class="form-control" required type="Text" maxlength="45" name="Nombre" value="<%=NombrePersona%>">
</div>
<div class="form-group">
<label for="TelefonoPersona">Telefono</label>
<input id="TelefonoPersona" class="form-control" type="Text" maxlength="45" name="Tel" value="<%=Telefono %>">
</div>
<input type="submit" class="btn btn-default" value="Submit">
<%String messages="";
if(request.getAttribute("messages")!=null){
messages=request.getAttribute("messages").toString();	
}
%>
<br><span><%=messages  %></span>
</form>
</div>
</body>
</html>