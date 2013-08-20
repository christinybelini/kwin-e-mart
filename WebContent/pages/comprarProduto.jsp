<%@page import="kwinemart.dao.*"%>
<%@page import="kwinemart.beans.*"%>
<%@page language="java"
	import="java.io.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	    <%
	// verificando se tem um atributo login na sessao
	// se tiver vai continuar e mostrar o menu
	if (session.getAttribute("login") != null
			&& session.getAttribute("senha") != null) {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>Compra de Produtos</title>
</head>
<body>
	<%
		Produto produto = ProdutoDAO.buscaProduto(request
				.getParameter("id"));
	%>
	<div id="area">
		<div id="conteudo_esq">
			<img src="../imagens/sombra_esq.png" border="0">
		</div>
		<div id="conteudo">
		<div style="margin-left: 10px;">
				<p align="left">
					<%if("admin".equals(session.getAttribute("tipo"))){ %>
					<a href="../pages/index.jsp">Administrador</a> >> 
					<%} %>
					<a href="buscaProdutos.jsp">Buscar Produtos</a> >> Comprar Produto
				</p>
			</div>
			<div style="margin-right: 10px;">
				<p align="right">Bem vindo, <%=session.getAttribute("usuario") %>.
					<a href="../LoginServlet?acao=logout">Sair</a>
				</p>
			</div>
			<div id="menu">
				<h2>Comprar Produto</h2>
			</div>
			<form id="frmProduto" name="frmProduto" method="post"><br/><br/><br/>
				<table width=90% border="0" align="center" id="tabela">
					<tr>
						<td align="center" width="50%"><%
						byte[] blob = produto.getImagem();  
					     String nomeArquivo = produto.getNomeImagem();  
					    %><img title="<%=nomeArquivo%>" src="../imagens/upload/<%=nomeArquivo%>" width="70%"/> </td>
						<td>
							<table border="0" width="100%">
								<tr>
									<td><b>Categoria</b> <%=CategoriaDAO.buscaCategoria(produto.getIdCategoria()).getNome()%></td>
								</tr>
								<tr>
									<td><b>Produto</b> <%=produto.getNome()%></td>
								</tr>
								<tr>
									<td><b>Descricao</b> <%=produto.getDescricao()%></td>
								</tr>
								<tr>
									<td><b>Preço</b> R$ <%=produto.getPreco()%></td>
								</tr>
								<tr>
									<td align="center"><input type="submit" value="Comprar"></td>
								</tr>
							</table>
						</td>
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
<%
	// se não existir um login na sessao, 
		// vai enviar para a página de login novamente
	} else {
%>
<jsp:forward page="../login.jsp"></jsp:forward>
<%
}
%>