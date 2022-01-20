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
import ma.entites.Position;
import ma.entites.SmartPhone;
import ma.entites.Utilisateur;
import ma.metier.BanqueEJBImpl;
import ma.metier.BanqueLocal;
import ma.metier.PositionLocal;
import ma.metier.SmartPhoneLocal;

/**
 * Servlet implementation class CompteController
 */
@WebServlet("/PositionController")
public class PositionController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@EJB
	private PositionLocal service;
	@EJB
	private SmartPhoneLocal ps;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PositionController() {
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
			String latitude = request.getParameter("latitude");
			String langitude = request.getParameter("langitude");
			String date = request.getParameter("date").replace("-", "/");
			int idsmartphone = Integer.parseInt(request.getParameter("smartphone"));
            SmartPhone smartphone = ps.findById(idsmartphone);
			service.create(new Position(latitude, langitude, new Date(date),smartphone));
		}
		response.setContentType("application/json");
		List<Position> positions = service.findAll();
		Gson json = new Gson();
		response.getWriter().write(json.toJson(positions));

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
