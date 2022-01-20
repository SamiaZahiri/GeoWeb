package controllers;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
import ma.entites.SmartPhone;
import ma.entites.Utilisateur;
import ma.metier.BanqueEJBImpl;
import ma.metier.BanqueLocal;
import ma.metier.SmartPhoneLocal;
import ma.metier.UserLocal;

/**
 * Servlet implementation class CompteController
 */
@WebServlet("/SmartPhoneController")
public class SmartPhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private SmartPhoneLocal service;
	@EJB
	private UserLocal us;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SmartPhoneController() {
		
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
            String imei = request.getParameter("imei");
            
                int idUtilisateur = Integer.parseInt(request.getParameter("utilisateur"));
                Utilisateur utilisateur = us.findById(idUtilisateur);
                service.create(new SmartPhone(imei, utilisateur));
                
            
            
        } else if (request.getParameter("op").equals("delete")) {
            String indice = request.getParameter("indice");
            service.delete(service.findById(Integer.parseInt(indice)));
            
        } else if (request.getParameter("op").equals("update")) {
            String indice = request.getParameter("indice");
            String imei = request.getParameter("imei");
    
            int idUtilisateur = Integer.parseInt(request.getParameter("utilisateur"));
            Utilisateur utilisateur = us.findById(idUtilisateur);
           
            service.update(new SmartPhone(Integer.parseInt(indice),imei, utilisateur));
           
        }
        response.setContentType("application/json");
        List<Utilisateur> users = us.findAll();
        Gson json = new Gson();
        response.getWriter().write(json.toJson(users));
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
