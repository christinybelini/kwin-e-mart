<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null
			&& session.getAttribute("senha") != null) {
		session.setAttribute("tipo", "admin");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>Kwin-e-Mart</title>
</head>
<body>
	<div id="area">
		<div id="conteudo_esq">
				<img src="../imagens/sombra_esq.png" border="0">
			</div>
		<div id="conteudo">
		<div style="margin-left: 10px;">
				<p align="left">
					 <img src="../imagens/espaco.png" width="1.5%">
				</p>
			</div>
			<div id="menu">
				<h2>Administrador</h2>
			</div>
			<div style="margin-right: 10px;">
				<p align="right">
					Bem vindo,
					<%=session.getAttribute("usuario")%>. <a
						href="../LoginServlet?acao=logout">Sair</a>
				</p>
			</div><br/><br/><br/>
			<table width="90%" border="0" align="center" id="tabela">
				<tr align="center">
					<td><a href="../cadastros/cadastroUsuario.jsp"><img title="Cadastrar Usuários"
						src="../imagens/usuario.gif"></a></td>
					<td><a href="../cadastros/cadastroProduto.jsp"><img title="Cadastrar Produtos"
						src="../imagens/produto.gif"></a></td>
					<td><a href="../pages/buscaProdutos.jsp"><img title="Buscar Produtos" src="../imagens/busca.gif"></a></td>
				</tr>
			</table>
		</div>
		<div id="conteudo_dir">
			<img src="../imagens/sombra_dir.png" border="0">
		</div>
	</div>
</body>
</html>
<%
	// se não existir um login na sessao, 
		// vai enviar para a página de login novamente
	} else {
%>
<jsp:forward page="../login.jsp"></jsp:forward>
<%
	}
%>