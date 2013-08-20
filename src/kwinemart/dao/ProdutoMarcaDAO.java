package kwinemart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kwinemart.beans.ProdutoMarca;
import kwinemart.database.ConexaoBanco;

public class ProdutoMarcaDAO {
	
	private static Connection connection = ConexaoBanco.getConexaoBanco();
	private static Statement s;
	private static ResultSet rs;
	
	public ProdutoMarcaDAO(){
	}

	public static void inserir(ProdutoMarca pm) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("insert into produtosmarcas (idProduto, idMarca) values (" + pm.getIdProduto() + "," + pm.getIdMarca() + ")");
	}
	
//	public void alterar(Marca marca) throws SQLException{
//		s = connection.createStatement();
//		s.executeUpdate("update marcas set nome = " + marca.getNome());
//	}
//	
//	public void excluir(Marca marca) throws SQLException{
//		s = connection.createStatement();
//		s.executeUpdate("delete from marcas where nome = " + marca.getNome());
//	}
//	
//	public static List<Marca> buscaTodas() throws SQLException{
//		List<Marca> retorno = new ArrayList<Marca>();
//		s = connection.createStatement();
//		s.executeQuery("select id, nome from marcas");
//		rs = s.getResultSet();
//		while (rs.next ()){
//			Marca marca = new Marca();
//			marca.setId(rs.getInt("id"));
//			marca.setNome(rs.getString("nome"));
//			retorno.add(marca);
//		}
//		rs.close ();
//		s.close ();
//		return retorno;
//	}
}
