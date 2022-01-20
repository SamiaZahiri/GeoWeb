package controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ma.entites.Chart;
import ma.entites.Position;
import ma.entites.SmartPhone;
import ma.metier.PositionLocal;
import ma.metier.SmartPhoneLocal;


/**
 * Servlet implementation class PositionServlet
 */
@WebServlet("/PositionController1")
public class PositionController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
    private PositionLocal metier;
	@EJB
	private SmartPhoneLocal smartphone;
    
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	    	
		 if("add".equals(request.getParameter("action"))) {
			 Date date=(request.getParameter("date")!="")? new Date(request.getParameter("date").replace("-", "/")):new Date();
			 metier.create(new Position(request.getParameter("lat"), request.getParameter("lng"), date, smartphone.findById(Integer.parseInt(request.getParameter("id")))));
			 response.setContentType("application/json");
	            List<Position> postions = new ArrayList<>();
	            for (Position p : metier.findAll()) {
	                postions.add(new Position(p.getId(),p.getLatitude(),p.getLongitude(),p.getDate()));
	                
	               // System.out.println(postions);
	            Gson json = new Gson();
	            response.getWriter().write(json.toJson(postions));
	          }
		 }else if("chartByPositionAndDate".equals(request.getParameter("action"))) {
			 
			 List<Chart> dataTheChart2 = new ArrayList<Chart>();
			 List<Position> postions = new ArrayList<>();
	           // System.out.println("test "+metier.findAll());
	            for (Position p : metier.findAll()) {
	            	System.out.println(p.getId()+" vas y");
	            	
	                postions.add(new Position(p.getId(),p.getLatitude(),p.getLongitude(),p.getDate(),p.getSmartphone()));
	            }
	            Map<SmartPhone, Map<Date, Long>> multipleFieldsMap1= postions.stream().collect(
	                    Collectors.groupingBy(Position::getSmartphone,
	                    		Collectors.groupingBy(Position::getDate,
	                    				Collectors.counting())));
	            for (Map.Entry<SmartPhone, Map<Date, Long>> entry: multipleFieldsMap1.entrySet()) {
	                System.out.println(entry.getKey().getImei() +" - "+ entry.getValue());
	                	for(Map.Entry<Date, Long> entry1:entry.getValue().entrySet()) {
		                	System.out.println(entry.getKey().getImei() +" - "+ entry1.getKey()+" - "+entry1.getValue());
		                	dataTheChart2.add(new Chart(entry.getKey().getImei()+" - "+entry1.getKey(), entry1.getValue()));
		                }
	            }
	            response.setContentType("application/json");
	            Gson json = new Gson();
	            response.getWriter().write(json.toJson(dataTheChart2));
		 }
		 
		 else {
	        	response.setContentType("application/json");
	            List<Position> postions = new ArrayList<>();
	           // System.out.println("test "+metier.findAll());
	            for (Position p : metier.findAll()) {
	            	System.out.println(p.getId()+" vas y");
	            	
	                postions.add(new Position(p.getId(),p.getLatitude(),p.getLongitude(),p.getDate(),p.getSmartphone()));
	            }
	            Map<SmartPhone, Long> counting = postions.stream().collect(
	                    Collectors.groupingBy(Position::getSmartphone, Collectors.counting()));

	            //System.out.println(counting);
	            List<Chart> dataTheChart = new ArrayList<Chart>();
	            for (Map.Entry<SmartPhone, Long> entry: counting.entrySet()) {
	                System.out.println(entry.getKey().getImei() +" - "+ entry.getValue());
	                dataTheChart.add(new Chart(entry.getKey().getImei(), entry.getValue()));
	            }
	            
	                //System.out.println("after loops "+postions);
	            Gson json = new Gson();
	            response.getWriter().write(json.toJson(dataTheChart));
	          
	            
	        }
	    }
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

}
