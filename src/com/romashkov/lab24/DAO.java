package com.romashkov.lab24;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class DAO {
	private static SessionFactory factory;
	
	private static void setupFactory() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			;//this is silliness!
		}
	    
		 Configuration configuration = new Configuration();

		 // Pass hibernate configuration file
		 configuration.configure("hibernate.cfg.xml");
		 
		 // pass in setup file for Product class
		 configuration.addResource("user.hbm.xml");
		 
		 // Since version 4.x, service registry is being used
		 ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().
		 applySettings(configuration.getProperties()).build(); 

		 // Create session factory instance
		 factory = configuration.buildSessionFactory(serviceRegistry);

	}
	
	public static int addUser(User u) {
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();

		 //save this specific record
		 int i = (Integer)hibernateSession.save(u);  
		
		 // Commit transaction
		 hibernateSession.getTransaction().commit();
		 
		 hibernateSession.close();  
				    
		 return i;  
	}
	
	public static List<User> getAllUsers(){
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();
		 
		 //deprecated method & unsafe cast
         List<User> users = hibernateSession.createQuery("FROM User").list(); 
		 
         // Commit transaction
         hibernateSession.getTransaction().commit();
      		 
      	 hibernateSession.close();  
      				    
		return users;
	}

	public static List<User> getUserByUsername(String uName){
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();
		 
		 //deprecated method & unsafe cast
         List<User> user = hibernateSession.createQuery("FROM User where username='"+ uName +"'").list(); 
         
         // Commit transaction
         hibernateSession.getTransaction().commit();
      		 
      	 hibernateSession.close();  
      				    
		return user;
	}
	
	public static void deleteUser(int i){
		if (factory == null)
			setupFactory();
		 // Get current session
		 Session hibernateSession = factory.openSession();

		 // Begin transaction
		 hibernateSession.getTransaction().begin();
		 
		 //deprecated method & unsafe cast
         hibernateSession.createQuery("DELETE FROM User where id=" + i).executeUpdate(); 
		 
         // Commit transaction
         hibernateSession.getTransaction().commit();
      		 
      	 hibernateSession.close();  
      				   
	}
}
