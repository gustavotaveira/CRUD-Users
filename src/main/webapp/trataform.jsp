<!DOCTYPE html>
<html lang="en">
<head>
<title>Formulário Enviado</title>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> 
	
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
	<script>
		function onClickEditarUsuario(element){
			console.log(element);
			var id =  element.getAttribute("data-id");
			var nome = element.getAttribute("data-nome");
			var email = element.getAttribute("data-email");
			var nascimento = element.getAttribute("data-nascimento");
			var sexo = element.getAttribute("data-sexo");
			
			document.getElementById("edit_id").value= id;
			document.getElementById("edit_nome").value= nome;
			document.getElementById("edit_email").value= email;
			document.getElementById("edit_data_nascimento").value= nascimento;
			document.getElementById("edit_sexo").value= sexo;	
		}
	</script>
	</head>
<body>
<%@ include file="cabecalho.jsp" %>
<div class="container">
<h2>Usuário cadastrados</h2>
<%
HashMap<String, ArrayList<Usuario>> map = Usuario.map;
map = map == null ? new HashMap<String, ArrayList<Usuario>>() : map;

ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) map.get("listaUsuarios"); 
listaUsuarios = listaUsuarios == null ? new ArrayList<Usuario>() : listaUsuarios;

Usuario novoUsuario = new Usuario();
novoUsuario.setNome(request.getParameter("nome"));
novoUsuario.setEmail(request.getParameter("email"));
novoUsuario.setDataNascimento(request.getParameter("data_nascimento"));
novoUsuario.setSexo("Masculino");

boolean containsNome = novoUsuario.getNome() != null && !novoUsuario.getNome().isEmpty();
boolean containsEmail = novoUsuario.getEmail() != null && !novoUsuario.getEmail().isEmpty();
boolean containsDataNascimento = novoUsuario.getDataNascimento() != null && !novoUsuario.getDataNascimento().isEmpty();

if(containsNome && containsEmail && containsDataNascimento){
	listaUsuarios.add(novoUsuario);
}

map.put("listaUsuarios", listaUsuarios);

%>

<table class="table">
<thead>
<tr class="success">
	<th>Nome</th>
	<th>E-mail</th>
	<th>Data de nascimento</th>
	<th>Sexo</th>
	<th>Opções</th>
</tr>
</thead>
<% for (Usuario usuario : listaUsuarios) {%>
	<tr>
		<td><%=usuario.getNome()%></td>
		<td><%=usuario.getEmail()%></td>
		<td><%=usuario.getDataNascimento()%></td>
		<td><%=usuario.getSexo()%></td>
		<td>
			<div id="div_opcoes" class="row">
				<div class="col-3">
					<button type="button" title="Editar usuário" onclick="onClickEditarUsuario(this);" data-toggle="modal" data-target="#myModal" data-id="<%=usuario.getId()%>" data-nome="<%=usuario.getNome()%>" data-email="<%=usuario.getEmail()%>"
					data-nascimento="<%=usuario.getDataNascimento() %>" data-sexo="<%=usuario.getSexo() %>" class="btn btn-link"><i class="fas fa-edit"></i></button>
				</div>
				<div class="col-3">
					<form action="excluirUsuario">
						<input name="idUsuario" type="hidden" value="<%=usuario.getId()%>">
						<button type="submit" title="Excluir usuário" class="btn btn-link"><i class="fas fa-times"></i></button>
					</form>
				</div>
			</div>
		</td>
	</tr>
<%}%>
</table>
<form action="index.jsp">
	<button type="submit" class="btn btn-primary">Voltar</button>
</form>
 <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">Editar Usuário</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form action="editarUsuario" method="post">
          	<input type="hidden" id="edit_id" name="idUsuario">
          	<div class="form-group">
          			<label for="edit_nome">Nome:</label>
          			<input id="edit_nome" class="form-control" name="nome">
          	</div>
          	 	<div class="form-group">
          	<label for="edit_email">E-mail:</label>
          			<input id="edit_email" type="email" class="form-control" name="email">
          			 	</div>
          	 	<div class="form-group">
          			<label for="edit_data_nascimento">Data de nascimento</label>
          			<input id="edit_data_nascimento" type="date" class="form-control" name="dataNascimento">
          			 	</div>
          	 	<div class="form-group">
          			<label for="edit_sexo">Sexo:</label>
          			<input id="edit_sexo" class="form-control" name="sexo">
          		</div>
          		<input type="submit" class="btn btn-primary" value="Salvar">
          		<button type="reset" class="btn btn-danger" data-dismiss="modal">Cancelar</button>	
          </form>
        </div>        
      </div>
    </div>
  </div>

<%@ include file="rodape.jsp"%>
</div>
</body>
</html>
<%@ page pageEncoding="UTF-8" errorPage="errors/errorPage.jsp"%>
<%@ page import="br.com.home.Usuario, java.util.List, java.util.ArrayList, java.util.HashMap"%>