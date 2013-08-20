<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<title>Kwin-e-Mart</title>
<script language="Javascript">
function Validate(){
	var login=document.frm.login;
	var senha=document.frm.senha;
	if ((login.value==null)||(login.value=='')){
		alert('Entre com o usuário');
		login.focus();
		return false;
	}
	if ((senha.value==null)||(senha.value=='')){
		alert('Entre com a senha');
		senha.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div id="area">
		<div id="conteudo_esq">
			<img src="imagens/sombra_esq.png" border="0">
		</div>
		<div id="conteudo">
			<form id="frm" name="frm" method="post" action="LoginServlet" onSubmit="return Validate()" ><br/><br/><br/><br/>
					<table width="200" border="0" align="center" id="tabela">
						<%if("1".equals(session.getAttribute("fail"))){%>
						<tr>
						<td colspan="2" align="center"><font color="red">Login ou senha inválidos</font></td>
						</tr>
						<%}%>
						<tr>
							<td>Login:</td>
							<td><input type="text" name="login" id="login" /></td>
						</tr>
						<tr>
							<td>Senha:</td>
							<td><input type="password" name="senha" id="senha" /></td>
						</tr>
						<tr>
							<td>
							<td><input type="submit" name="button" id="button"
								value="Logar" /> <input type="reset" name="button" id="button"
								value="Limpar" />
								<input type="hidden" name="acao" value="login" />
						</tr>
						<tr>
							<td colspan="2" align="center"><a href="cadastros/cadastroUsuario.jsp"><font color="red" size="2">Cadastra-se</font></a></td>
						</tr>
					</table>
				</form>
		</div>
		<div id="conteudo_dir">
			<img src="imagens/sombra_dir.png" border="0">
		</div>
	</div>
</body>
</html>