package controllers;
import java.io.IOException;



import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.google.gson.Gson;

import ma.metier.UserLocal;






/**
* Servlet implementation class LoadUser
*/
@WebServlet("/LoadUser")
public class LoadUser extends HttpServlet {
private static final long serialVersionUID = 1L;

@EJB
private UserLocal service;

/**
* @see HttpServlet#HttpServlet()
*/
public LoadUser() {
super();
// TODO Auto-generated constructor stub
}



/**
* @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
*/
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
String id = request.getParameter("id");



response.setContentType("application/json");
Gson g = new Gson();
g.toJson(service.findById(Integer.parseInt(id)), response.getWriter());

}



/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
// TODO Auto-generated method stub
doGet(request, response);
}



}
