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

@WebServlet(urlPatterns = {"/iniciarEditarUsuario"})
public class IniciarEditarUsuarioServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = (String) req.getAttribute("idUsuario");
		
		HashMap<String,ArrayList<Usuario>> map = Usuario.map;
		ArrayList<Usuario> listaUsuarios = map.get("listaUsuarios");
		
		for(Usuario usuario : listaUsuarios) {
			if(usuario.getId().equals(id)) {
				req.setAttribute("nome", usuario.getNome());
				req.setAttribute("email", usuario.getEmail());
				req.setAttribute("dataNascimento", usuario.getDataNascimento());
				req.setAttribute("sexo", usuario.getSexo());
				break;
			}
		}
	}
	
}
