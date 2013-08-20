package kwinemart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kwinemart.beans.Marca;
import kwinemart.database.ConexaoBanco;

public class MarcaDAO {
	
	private static Connection connection = ConexaoBanco.getConexaoBanco();
	private static Statement s;
	private static ResultSet rs;
	
	public MarcaDAO(){
	}

	public static void inserir(Marca marca) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("insert into marcas (nome) values ('" + marca.getNome() + "')");
	}
	
	public void alterar(Marca marca) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("update marcas set nome = " + marca.getNome());
	}
	
	public void excluir(Marca marca) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("delete from marcas where nome = " + marca.getNome());
	}
	
	public static List<Marca> buscaTodas() throws SQLException{
		List<Marca> retorno = new ArrayList<Marca>();
		s = connection.createStatement();
		s.executeQuery("select id, nome from marcas");
		rs = s.getResultSet();
		while (rs.next ()){
			Marca marca = new Marca();
			marca.setId(rs.getInt("id"));
			marca.setNome(rs.getString("nome"));
			retorno.add(marca);
		}
		rs.close ();
		s.close ();
		return retorno;
	}
}
