package kwinemart.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kwinemart.beans.Usuario;
import kwinemart.dao.UsuarioDAO;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagina = "";
		HttpSession sessao = request.getSession();
		if(request.getParameter("acao").equals("logout")) {
			// no logout invalido a sessao
			sessao.invalidate();
			pagina = "login.jsp";
		}
		((HttpServletResponse) response).sendRedirect(pagina);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pagina = "";
		HttpSession sessao = request.getSession();
		if(request.getParameter("acao").equals("login")) {
			try {
				Usuario usuario = UsuarioDAO.verificaLogin(request.getParameter("login"), request.getParameter("senha"));
				if(usuario.getNome() != null && !"".equals(usuario.getNome())){
					response.setContentType("text/html");

						sessao.setAttribute("login", request.getParameter("login"));
						sessao.setAttribute("senha", request.getParameter("senha"));
						sessao.setAttribute("usuario", usuario.getNome());
						sessao.setAttribute("tipouser", usuario.getTipo());
						sessao.setAttribute("fail", "0");
						if("admin".equals(usuario.getTipo()))
							pagina = "pages/index.jsp";
						else
							pagina = "pages/buscaProdutos.jsp";
				} else{
					sessao.setAttribute("fail", "1");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				sessao.setAttribute("fail", "1");
			}
		} else if(request.getParameter("acao").equals("logout")) {
			// no logout invalido a sessao
			sessao.invalidate();
			pagina = "login.jsp";
		}
		((HttpServletResponse) response).sendRedirect(pagina);
	}
}
