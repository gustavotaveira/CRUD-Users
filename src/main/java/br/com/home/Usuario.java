package br.com.home;

import java.util.UUID;

public class Usuario{
	
	public static java.util.HashMap<String, java.util.ArrayList<br.com.home.Usuario>> map = new java.util.HashMap<String, java.util.ArrayList<br.com.home.Usuario>>();
	
	private String id;
	private String nome;
	private String email;
	private String dataNascimento;
	private String sexo;

	public Usuario(){
		id = UUID.randomUUID().toString();
	}
	
	public String getNome(){
		return this.nome;	
	}

	public void setNome(String nome){
		this.nome = nome;	
	}

	public String getEmail(){
		return this.email;	
	}

	public void setEmail(String email){
		this.email= email;	
	}

	public String getDataNascimento(){
		return this.dataNascimento;	
	}

	public void setDataNascimento(String dataNascimento){
		this.dataNascimento = dataNascimento;	
	}

	public String getSexo(){
		return this.sexo;	
	}

	public void setSexo(String sexo){
		this.sexo= sexo;	
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

}