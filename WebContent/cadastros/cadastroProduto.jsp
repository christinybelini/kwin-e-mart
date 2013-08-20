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
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"
	type="text/javascript"></script>
<script src="../js/jquery.maskMoney.js" type="text/javascript"></script>
<script src="../js/ajax.js" type="text/javascript"></script>
<title>Cadastro de Produtos</title>
</head>
<script type="text/javascript">
    $(function(){
        $("#preco").maskMoney();
    });
    
    function validaCampos(form)
    {
    	if (form.categoria.selectedIndex==0) {
            alert("Selecione a categoria.");
         	return false;  }
        else if (form.marca.selectedIndex==0) {
            alert("Selecione a marca.");
         	return false;  }
        else if (form.nome.value=="") {
             alert("Informe o nome.");
         	return false;  }
         else if (form.preco.value=="") {
             alert("Informe o preço.");
          	return false;  }
    }
    
</script>
<body>
	<%
	List<Categoria> listaCategorias = CategoriaDAO.buscaTodas();
	List<Marca> listaMarcas = MarcaDAO.buscaTodas();	

%>
	<div id="area">
		<div id="conteudo_esq">
			<img src="../imagens/sombra_esq.png" border="0">
		</div>
		<div id="conteudo">
		<div style="margin-left: 10px;">
				<p align="left">
					<a href="../pages/index.jsp">Administrador</a> >> Cadastrar Produto
				</p>
			</div>
			<div style="margin-right: 10px;">
				<p align="right">
					Bem vindo,
					<%=session.getAttribute("usuario")%>. <a
						href="../LoginServlet?acao=logout">Sair</a>
				</p>
			</div>
			<div id="menu">
				<h2>Cadastrar Produtos</h2>
			</div>
			<form id="frmProduto" name="frmProduto" method="post"
				action="../ProdutoServlet" enctype="multipart/form-data" onsubmit="return validaCampos(this);">
				<table width="300" border="0" align="center" id="tabela">
					<tr>
						<td>Categoria</td>
						<td><select name="categoria" id="categoria">
								<option>Selecione uma categoria</option>
								<%
							for(int i=0;i<listaCategorias.size();i++){
								Categoria categoria = listaCategorias.get(i);
								%>
								<option value="<%=categoria.getId()%>"><%=categoria.getNome()%></option>
								<%
							}
							%>
						</select> <a id="exibirCat"><img title="Cadastrar Categoria"
								src="../imagens/icon_addlink.gif" /></a></td>
					</tr>
					<tr>
						<td>Marca</td>
						<td><select name="marca" id="marca">
								<option>Selecione uma marca</option>
								<%
							for(int i=0;i<listaMarcas.size();i++){
								Marca marca = listaMarcas.get(i);
								%>
								<option value="<%=marca.getId()%>"><%=marca.getNome()%></option>
								<%
							}
							%>
						</select><a id="exibirMarca"><img title="Cadastrar Marca"
								src="../imagens/icon_addlink.gif" /></a></td>
					</tr>
					<tr>
						<td>Nome</td>
						<td><input type="text" name="nome" id="nome"></td>
					</tr>
					<tr>
						<td>Descrição</td>
						<td><textarea rows="5" cols="20" name="descricao" id="descricao"></textarea></td>
					</tr>
					<tr>
						<td>Preço R$</td>
						<td><input type="text" name="preco" id="preco"
							onKeyPress="return(MascaraMoeda(this,'.',',',event))"></td>
					</tr>
					<tr>
						<td>Imagem</td>
						<td><input type="file" name="imagem" id="imagem"></td>
					</tr>
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
		<div id="conteudoCat">
			<table border="0" width="100%">
				<tr>
					<td><h2>Cadastrar Categorias</h2></td>
					<td align="right" valign="top"><a id="ocultarCat"><img alt=""
							src="../imagens/botao_fechar.png"></a></td>
				</tr>
			</table>
			<form id="frmCategoria" name="frmCategoria" method="post" action="../CategoriaServlet" onsubmit="return validaCampos(this);">
				<table width="50%" border="0" align="center" id="tabela">
					<tr>
						<td><label>Nome</label></td>
						<td><input type="text" name="nome" id="nome"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Salvar"></td>
					</tr>
				</table>
			</form>
		</div>
		<div id="conteudoMarca">
			<table border="0" width="100%">
				<tr>
					<td><h2>Cadastrar Marcas</h2></td>
					<td align="right" valign="top"><a id="ocultarMarca"><img alt=""
							src="../imagens/botao_fechar.png"></a></td>
				</tr>
			</table>
			<form id="frmMarca" name="frmMarca" method="post" action="../MarcaServlet" onsubmit="return validaCampos(this);">
				<table width="50%" border="0" align="center" id="tabela">
					<tr>
						<td><label>Nome</label></td>
						<td><input type="text" name="nome" id="nome"></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit"
							value="Salvar"></td>
					</tr>
				</table>
			</form>
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