<!DOCTYPE html>
<html lang="en">
<head>
	<title>Cadastro de usuários</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
</head>
<body>
<%@ include file="cabecalho.jsp"%>
	<div class="container-sm pt-3 my-3 border">
	<h3>Cadastro de usuários</h3>
	<form action="trataform.jsp" method="post">
		<div class="form-group" style="margin-bottom: 0">
		<label for="nome_id">Nome:</label>
		<input id="nome_id" class="form-control" type="text" name="nome"><br>
		</div>
		<div class="form-group" style="margin-bottom: 0">
		<label for="email_id">E-mail:</label>
		<input id="email_id" class="form-control" type="email" name="email"><br>
		</div>
		<div class="form-group" style="margin-bottom: 0">
			<label for="data_nascimento_id">Data de nascimento:</label>
		<input id="data_nascimento_id"  class="form-control" type="date" name="data_nascimento" value="Enviar"><br>
		</div>
		<input type="submit" class="btn btn-primary"  value="Enviar">
		<a href="trataform.jsp"><button class="btn btn-default" type="button">Listagem de usuários</button></a>
	</form>
	<%@ include file="rodape.jsp"%>
	</div>
</body>
</html>
<%@ page pageEncoding="UTF-8" errorPage="errors/errorPage.jsp" import="java.util.Date, java.text.SimpleDateFormat"%>