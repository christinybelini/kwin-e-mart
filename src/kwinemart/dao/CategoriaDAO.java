package kwinemart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kwinemart.beans.Categoria;
import kwinemart.database.ConexaoBanco;

public class CategoriaDAO {
	
	private static Connection connection = ConexaoBanco.getConexaoBanco();
	private static Statement s;
	private static ResultSet rs;
	
	public CategoriaDAO(){
		
	}

	public static void inserir(Categoria categoria) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("insert into categorias (nome) values ('" + categoria.getNome() + "')");
	}
	
	public static void alterar(Categoria categoria) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("update categorias set nome = " + categoria.getNome());
	}
	
	public static void excluir(Categoria categoria) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("delete from categorias where nome = " + categoria.getNome());
	}
	
	public static List<Categoria> buscaTodas() throws SQLException{
		List<Categoria> retorno = new ArrayList<Categoria>();
		s = connection.createStatement();
		s.executeQuery("select id, nome from categorias");
		rs = s.getResultSet();
		while (rs.next ()){
			Categoria categoria = new Categoria();
			categoria.setId(rs.getInt("id"));
			categoria.setNome(rs.getString("nome"));
			retorno.add(categoria);
		}
		rs.close ();
		s.close ();
		return retorno;
	}
	
	public static Categoria buscaCategoria(int id) throws SQLException{
		Categoria cat = new Categoria();
		s = connection.createStatement();
		s.executeQuery("select * from categorias where id = "+ id);
		rs = s.getResultSet();
		while (rs.next ()){
			cat.setNome(rs.getString("nome"));
		}
		return cat;
	}
}
