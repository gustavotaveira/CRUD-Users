package br.com.home.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.home.Usuario;

@WebServlet(urlPatterns = {"/excluirUsuario"})
public class ExcluirUsuarioServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String idUsuario = req.getParameter("idUsuario");
		HashMap<String,ArrayList<Usuario>> map = Usuario.map;
		ArrayList<Usuario> listaUsuarios = map.get("listaUsuarios");
		
		Usuario usuarioParaRemover = null;
		for(Usuario usuario : listaUsuarios) {
			if(usuario.getId().equals(idUsuario)) {
				usuarioParaRemover = usuario;
				break;
			}
		}
		listaUsuarios.remove(usuarioParaRemover);
		
		Usuario.map.put("listaUsuarios", listaUsuarios);
		resp.sendRedirect("trataform.jsp");
	}

}
