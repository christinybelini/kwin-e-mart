package kwinemart.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kwinemart.beans.Produto;
import kwinemart.database.ConexaoBanco;

public class ProdutoDAO {
	
	private static Connection connection = ConexaoBanco.getConexaoBanco();
	private static Statement s;
	private static ResultSet rs;
	
	public ProdutoDAO(){		
	}

	public static int inserir(Produto produto) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("insert into produtos (nome, idCategoria, descricao, preco, imagem, nomeimagem) values ('" 
		+ produto.getNome() + "',"	+ produto.getIdCategoria() + ",'" + produto.getDescricao() + "','" 
		+ produto.getPreco() + "','" + produto.getImagem() + "','" + produto.getNomeImagem() + "')");
		return  buscaId(produto);
	}
	
	public void alterar(Produto produto) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("update produtos set id = " + produto.getId());
	}
	
	public void excluir(Produto produto) throws SQLException{
		s = connection.createStatement();
		s.executeUpdate("delete from produtos where id = " + produto.getId());
	}
	
	public static int buscaId(Produto produto) throws SQLException{
		int retorno = 0;
		s = connection.createStatement();
		s.executeQuery("select id from produtos where nome = '"+ produto.getNome() + "' and idCategoria = "
				+ produto.getIdCategoria() + " and descricao = '" + produto.getDescricao() + "' and preco = '"
				+ produto.getPreco() + "' and imagem = '" + produto.getImagem() + "'");
		rs = s.getResultSet();
		while (rs.next ()){
			retorno = rs.getInt("id");
		}
		return retorno;
	}
	
	public static List<Produto> buscaTodos() throws SQLException{
		List<Produto> retorno = new ArrayList<Produto>();
		s = connection.createStatement();
		s.executeQuery("select id, imagem, nomeimagem from produtos");
		rs = s.getResultSet();
		while (rs.next ()){
			Produto prod = new Produto();
			prod.setId(rs.getInt("id"));
			prod.setImagem(rs.getBytes("imagem"));
			prod.setNomeImagem(rs.getString("nomeimagem"));
			retorno.add(prod);
		}
		rs.close ();
		s.close ();
		return retorno;
	}
	
	public static List<Produto> buscaPorNome(String nome) throws SQLException{
		List<Produto> retorno = new ArrayList<Produto>();
		s = connection.createStatement();
		s.executeQuery("select * from produtos where nome like '%"+ nome + "%'");
		rs = s.getResultSet();
		while (rs.next ()){
			Produto prod = new Produto();
			prod.setId(rs.getInt("id"));
			prod.setNome(rs.getString("nome"));
			prod.setDescricao(rs.getString("descricao"));
			prod.setPreco(rs.getString("preco"));
			prod.setImagem(rs.getBytes("imagem"));
			prod.setNomeImagem(rs.getString("nomeimagem"));
			prod.setIdCategoria(rs.getInt("idCategoria"));
			retorno.add(prod);
		}
		return retorno;
	}
	
	public static Produto buscaProduto(String id) throws SQLException{
		Produto prod = new Produto();
		s = connection.createStatement();
		s.executeQuery("select * from produtos where id = '"+ id + "'");
		rs = s.getResultSet();
		while (rs.next ()){
			prod.setId(rs.getInt("id"));
			prod.setNome(rs.getString("nome"));
			prod.setDescricao(rs.getString("descricao"));
			prod.setPreco(rs.getString("preco"));
			prod.setImagem(rs.getBytes("imagem"));
			prod.setNomeImagem(rs.getString("nomeimagem"));
			prod.setIdCategoria(rs.getInt("idCategoria"));
		}
		return prod;
	}
}
