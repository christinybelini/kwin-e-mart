package kwinemart.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoBanco {

	public static String status = "Não conectou ao banco de dados.";

	public ConexaoBanco() {

	}

	public static java.sql.Connection getConexaoBanco() {

		Connection connection = null;
		try {
			String driverName = "com.mysql.jdbc.Driver";                        
			Class.forName(driverName);
			String serverName = "localhost";
			String mydatabase ="kwin-e-mart";
			String url = "jdbc:mysql://" + serverName + "/" + mydatabase;
			String username = "root";      
			String password = "root";
			connection = DriverManager.getConnection(url, username, password);

			if (connection != null) {
				status = ("Conectado com sucesso!");
			} else {
				status = ("Não foi possivel realizar conexão.");
			}

			return connection;
		} catch (ClassNotFoundException e) {
			System.out.println("O driver expecificado nao foi encontrado.");
			return null;
		} catch (SQLException e) {
			System.out.println("Nao foi possivel conectar ao Banco de Dados.");
			return null;
		}
	}

	public static String statusConection() {
		return status;
	}

	public static boolean FecharConexao() {
		try {
			ConexaoBanco.getConexaoBanco().close();
			return true;
		} catch (SQLException e) {
			return false;
		}
	}

	public static java.sql.Connection ReiniciarConexao() {
		FecharConexao();
		return ConexaoBanco.getConexaoBanco();
	}
}
