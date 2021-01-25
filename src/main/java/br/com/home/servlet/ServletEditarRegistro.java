package br.com.home.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.home.Usuario;

public class ServletEditarRegistro extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("idUsuario");
		String nome = req.getParameter("nome");
		String email = req.getParameter("email");
		String dataNascimento = req.getParameter("dataNascimento");
		String sexo = req.getParameter("sexo");
		
		HashMap<String,ArrayList<Usuario>> map = Usuario.map;
		ArrayList<Usuario> listaUsuarios = map.get("listaUsuarios");
		
		for(Usuario usuario : listaUsuarios) {
			if(usuario.getId().equals(id)) {
				usuario.setNome(nome);
				usuario.setEmail(email);
				usuario.setDataNascimento(dataNascimento);
				usuario.setSexo(sexo);
				break;
			}
		}
		
		Usuario.map.put("listaUsuarios", listaUsuarios);
		resp.sendRedirect("trataform.jsp");
	}
}
