package controllers;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ma.entites.Compte;
import ma.entites.Utilisateur;
import ma.metier.BanqueEJBImpl;
import ma.metier.BanqueLocal;
import ma.metier.UserLocal;

/**
 * Servlet implementation class CompteController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private UserLocal service;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("op") == null) {
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String telephone = request.getParameter("telephone");
			String email = request.getParameter("email");
			String dateNaissance = request.getParameter("dateNaissance").replace("-", "/");
			if (email != null) {



			service.create(new Utilisateur(nom, prenom, telephone, email, new Date(dateNaissance)));
			//response.sendRedirect("professeur.jsp");
			}
			System.out.println("Ajout");
			} else if (request.getParameter("op").equals("delete")) {
			String indice = request.getParameter("indice");
			service.delete(service.findById(Integer.parseInt(indice)));
			System.out.println("Suppression");
			} else if (request.getParameter("op").equals("update")) {
			String indice = request.getParameter("indice");
			String nom = request.getParameter("nom");
			String prenom = request.getParameter("prenom");
			String telephone = request.getParameter("telephone");
			String email = request.getParameter("email");
			String dateNaissance = request.getParameter("dateNaissance").replace("-", "/");



			service.update(new Utilisateur(Integer.parseInt(indice), nom, prenom, telephone, email, new Date(dateNaissance)));
			System.out.println("updaaaaaaaaate");
			}
			response.setContentType("application/json");
			List<Utilisateur> utilisateures = service.findAll();
			Gson json = new Gson();
			response.getWriter().write(json.toJson(utilisateures));




			}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
