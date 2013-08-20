<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<script type="text/javascript" src="../js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript"
	src="../js/jquery.maskedinput-1.1.4.pack.js" /></script>
<title>Cadastro de Usu�rio</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#cep").mask("99.999-999");
		$("#cpf").mask("999.999.999-99");
	});
	
	function validaCampos(form)
    {
    	if (form.nome.value=="") {
             alert("Informe o nome.");
         	return false;  }
         else if (form.sobrenome.value=="") {
             alert("Informe o sobrenome.");
          	return false;  }
         else if (form.cpf.value=="") {
             alert("Informe o cpf.");
          	return false;  }
         else if (form.bairro.value=="") {
             alert("Informe o bairro.");
          	return false;  }
         else if (form.cidade.value=="") {
             alert("Informe o cidade.");
          	return false;  }
         else if (form.cep.value=="") {
             alert("Informe o cep.");
          	return false;  }
         else if (form.endereco.value=="") {
             alert("Informe o endere�o.");
          	return false;  }
         else if (form.email.value=="") {
             alert("Informe o email.");
          	return false;  }
         else if (form.senha.value=="") {
             alert("Informe o senha.");
          	return false;  }
         else if (form.login.value=="") {
             alert("Informe o login.");
          	return false;  }
         else if (form.estado.selectedIndex==0) {
             alert("Selecione a estado.");
          	return false;  }
    }
</script>
</head>
<body>
	<div id="area">
		<div id="conteudo_esq">
			<img src="../imagens/sombra_esq.png" border="0">
		</div>
		<div id="conteudo">
		<%if("admin".equals(session.getAttribute("tipo"))){ %>
			<div style="margin-left: 10px;">
				<p align="left">
					<a href="../pages/index.jsp">Administrador</a> >> Cadastrar Usu�rio
				</p>
			</div>
			<div style="margin-right: 10px;">
				<p align="right">
					Bem vindo,
					<%=session.getAttribute("usuario")%>. <a
						href="../LoginServlet?acao=logout">Sair</a>
				</p>
			</div>
			<%} else{ %>
			<div style="margin-left: 10px;">
				<p align="left">
					 <img src="../imagens/espaco.png" width="1.5%">
				</p>
			</div>
			<div style="margin-right: 10px;">
				<p align="right">
					<a href="../login.jsp">Voltar</a>
				</p>
			</div>
			<%} %>
			<div id="menu">
				<h2>Cadastrar Usu�rio</h2>
			</div>
			<form id="frmUsuario" name="frmUsuario" method="post"
				action="../UsuarioServlet" onsubmit="return validaCampos(this);">
				<table width="90%" border="0" align="center" id="tabela">
					<tr>
						<td>Nome</td>
						<td><input type="text" name="nome" id="nome"></td>
					</tr>
					<tr>
						<td>Sobrenome</td>
						<td><input type="text" name="sobrenome" id="sobrenome"></td>
					</tr>
					<tr>
						<td>CPF</td>
						<td><input type="text" name="cpf" id="cpf"></td>
					</tr>
					<tr>
						<td>Endere�o</td>
						<td><input type="text" name="endereco" id="endereco"></td>
					</tr>
					<tr>
						<td>Bairro</td>
						<td><input type="text" name="bairro" id="bairro"></td>
					</tr>
					<tr>
						<td>CEP</td>
						<td><input type="text" name="cep" id="cep"
							onKeyPress="return(MascaraMoeda(this,'.',',',event))"></td>
					</tr>
					<tr>
						<td>Cidade</td>
						<td><input type="text" name="cidade" id="cidade"></td>
					</tr>
					<tr>
						<td>Estado</td>
						<td><select name="estado">
								<option value="estado">Selecione o Estado</option>
								<option value="ac">Acre</option>
								<option value="al">Alagoas</option>
								<option value="am">Amazonas</option>
								<option value="ap">Amap�</option>
								<option value="ba">Bahia</option>
								<option value="ce">Cear�</option>
								<option value="df">Distrito Federal</option>
								<option value="es">Esp�rito Santo</option>
								<option value="go">Goi�s</option>
								<option value="ma">Maranh�o</option>
								<option value="mt">Mato Grosso</option>
								<option value="ms">Mato Grosso do Sul</option>
								<option value="mg">Minas Gerais</option>
								<option value="pa">Par�</option>
								<option value="pb">Para�ba</option>
								<option value="pr">Paran�</option>
								<option value="pe">Pernambuco</option>
								<option value="pi">Piau�</option>
								<option value="rj">Rio de Janeiro</option>
								<option value="rn">Rio Grande do Norte</option>
								<option value="ro">Rond�nia</option>
								<option value="rs">Rio Grande do Sul</option>
								<option value="rr">Roraima</option>
								<option value="sc">Santa Catarina</option>
								<option value="se">Sergipe</option>
								<option value="sp">S�o Paulo</option>
								<option value="to">Tocantins</option>
						</select></td>
					</tr>
					<tr>
						<td>Email</td>
						<td><input type="text" name="email" id="email"></td>
					</tr>
					<tr>
						<td>Email Alternativo</td>
						<td><input type="text" name="emailalternativo"
							id="emailalternativo"></td>
					</tr>
					<tr>
						<td>Login</td>
						<td><input type="text" name="login" id="login"></td>
					</tr>
					<tr>
						<td>Senha</td>
						<td><input type="password" name="senha" id="senha"></td>
					</tr>
					<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null
			&& session.getAttribute("senha") != null) {
%><tr>
						<td>Tipo Usuario</td>
						<td><input type="radio" name="tipousuario" id="tipousuario">Administrador<input type="radio" name="tipousuario" id="tipousuario">Usu�rio</td>
					</tr>
<%} %>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Salvar"><input type="reset" value="Limpar"></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="conteudo_dir">
			<img src="../imagens/sombra_dir.png" border="0">
		</div>
	</div>
</body>
</html>