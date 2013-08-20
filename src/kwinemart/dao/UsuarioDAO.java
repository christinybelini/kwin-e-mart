package kwinemart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kwinemart.beans.Usuario;
import kwinemart.database.ConexaoBanco;

public class UsuarioDAO {
	
	private static Connection connection = ConexaoBanco.getConexaoBanco();
	private static Statement s;
	private static ResultSet rs;
	
	public UsuarioDAO(){		
	}

	public static void inserir(Usuario usuario) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("insert into usuarios (nome, sobrenome, cpf, endereco, bairro, cep, cidade, estado, email, emailalternativo, login, senha) values ('" 
		+ usuario.getNome() + "','"	+ usuario.getSobrenome() + "','" + usuario.getCpf() + "','" + usuario.getEndereco() + "','"+ usuario.getBairro() + "','"
		+ usuario.getCep() + "','" + usuario.getCidade() + "','" + usuario.getEstado() + "','" + usuario.getEmail() + "','" + usuario.getEmailalternativo() + "','"
		+ usuario.getLogin() + "','" + usuario.getSenha() + "')");
	}
	
	public void alterar(Usuario usuario) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("update usuarios set id = " + usuario.getId());
	}
	
	public void excluir(Usuario usuario) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("delete from usuarios where id = " + usuario.getId());
	}
	
	public static Usuario verificaLogin(String login, String senha) throws SQLException{
		Usuario usuario = new Usuario();
		s = connection.createStatement();
		s.executeQuery("select * from usuarios where login = '"+ login + "' and senha = '" + senha + "'");
		rs = s.getResultSet();
		while (rs.next ()){
			usuario.setNome(rs.getString("nome"));
			usuario.setTipo(rs.getString("tipousuario"));
		}
		return usuario;
	}
}
