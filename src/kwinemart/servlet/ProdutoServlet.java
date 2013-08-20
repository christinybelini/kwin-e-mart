package kwinemart.servlet;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kwinemart.beans.Produto;
import kwinemart.beans.ProdutoMarca;
import kwinemart.dao.ProdutoDAO;
import kwinemart.dao.ProdutoMarcaDAO;
import kwinemart.database.ConexaoBanco;

/**
 * Servlet implementation class CategoriaServlet
 */
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProdutoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");  
        
		MultipartRequest multipartRequest = new MultipartRequest(request, getServletContext().getRealPath("/imagens/upload/"), /* 150MB */ 153600 * 153600, new DefaultFileRenamePolicy());
		
		Produto produto = new Produto();
		produto.setIdCategoria(Integer.parseInt(multipartRequest.getParameter("categoria")));
		produto.setNome(multipartRequest.getParameter("nome"));
		produto.setDescricao(multipartRequest.getParameter("descricao"));
		produto.setPreco(multipartRequest.getParameter("preco"));

		int idProduto = 0;
		try {
			idProduto = ProdutoDAO.inserir(produto);  
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (idProduto != 0){
			ProdutoMarca prodMarca = new ProdutoMarca();
			prodMarca.setIdMarca(Integer.parseInt(multipartRequest.getParameter("marca")));
			prodMarca.setIdProduto(idProduto);
			try {
				ProdutoMarcaDAO.inserir(prodMarca);
				upload(request, response, multipartRequest, idProduto);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		HttpSession sessao = request.getSession();
//		sessao.setAttribute("login", multipartRequest.getParameter("login"));
//		sessao.setAttribute("senha", multipartRequest.getParameter("senha"));
		sessao.setAttribute("busca", multipartRequest.getParameter("nome"));
		response.sendRedirect("pages/buscaProdutos.jsp"); 
	}

	private void upload(HttpServletRequest request, HttpServletResponse response, MultipartRequest multipartRequest, int idProduto) throws IOException, SQLException {      
		File file = multipartRequest.getFile("imagem"); 
		  
        if(file.exists()){
			BufferedImage img = ImageIO.read( file );
			ByteArrayOutputStream b = new ByteArrayOutputStream();      
			ImageIO.write( img, "jpg", b );
			byte[] imgArray = b.toByteArray();

			String sql = "update produtos set imagem =  ? , nomeimagem = ? where id = ?";      
			PreparedStatement stm = ConexaoBanco.getConexaoBanco().prepareStatement(sql);      
			stm.setBytes( 1, imgArray );  
			stm.setString(2, file.getName());
			stm.setInt(3, idProduto);
			stm.executeUpdate();      
			stm.close();
        }
	}
}
