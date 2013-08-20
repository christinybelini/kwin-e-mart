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
<title>Busca Produtos</title>
</head>
<body>
<%
	String busca = "";
	List<Produto> listaProdutos = ProdutoDAO.buscaTodos();
	if (session.getAttribute("busca") != null){
		listaProdutos = ProdutoDAO.buscaPorNome(session.getAttribute("busca").toString());
		busca = session.getAttribute("busca").toString();
	}
%>
<div id="area">
		<div id="conteudo_esq">
			<img src="../imagens/sombra_esq.png" border="0">
		</div>
		<div id="conteudo">
			<%if("admin".equals(session.getAttribute("tipo"))){ %>
			<div style="margin-left: 10px;">
				<p align="left">
					<a href="../pages/index.jsp">Administrador</a> >> Buscar Produto
				</p>
			</div>
			<%} else{%>
			<div style="margin-left: 10px;">
				<p align="left">
					 <img src="../imagens/espaco.png" width="1.5%">
				</p>
			</div>
		<%} %>
			<div style="margin-right: 10px;">
				<p align="right">Bem vindo, <%=session.getAttribute("usuario") %>.
					<a href="../LoginServlet?acao=logout">Sair</a>
				</p>
			</div>
			<div id="menu">
				<h2>Buscar Produtos</h2>
			</div>
			<form id="frmProduto" name="frmProduto" method="post" action="../BuscaProdutosServlet">
				<table width=90% border="0" align="center" id="tabela">
					<tr><td style="text-align: right;"><input type="text" name="busca" value="<%=busca%>"><input type="submit" value="Buscar"></td></tr>
					<tr>
						<td>
						<table border="0" width="100%"><tr>
						
				<%
				int linhas = 1;
				for(int i=0;i<listaProdutos.size();i++){
					Produto prod = listaProdutos.get(i);
					%>	<td width="30%">				
						<a href="comprarProduto.jsp?id=<%=prod.getId()%>">
						<%
						byte[] blob = prod.getImagem();  
					     String nomeArquivo = prod.getNomeImagem();  
					    %><img title="<%=nomeArquivo%>" src="../imagens/upload/<%=nomeArquivo%>" width="50%"/> </a>
						</td>		
				<%
					if(linhas%3==0)
						%></tr><tr><%
					linhas++;
				}
				%>
				</tr>
				</table>
				</td></tr></table>
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