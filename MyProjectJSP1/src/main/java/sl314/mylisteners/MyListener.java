package sl314.mylisteners;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.io.*;
import java.util.*;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import sl314.mythreads.*;

import jakarta.servlet.*;
import java.sql.*;
import sl314.myclasses.*;

/**
 * Application Lifecycle Listener implementation class MyListener
 *
 */
@WebListener
public class MyListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
	private ScheduledExecutorService scheduler;
	Connection con;
    public MyListener() {
        // TODO Auto-generated constructor stub
    }
    public void contextInitialized(ServletContextEvent sce) 
    {
    	con=null;
		
		try
		{
		InitialContext ic=new InitialContext();
		DataSource ds=(DataSource)ic.lookup("java:/comp/env/jdbc/TestDB");
		con=ds.getConnection();
		
		
		}
		catch(NamingException ne)
		{
			ne.printStackTrace();
		}
		catch(SQLException se)
		{
			se.printStackTrace();
		}
		Data d=new Data(con);
		
	    d.reload();
	    sce.getServletContext().setAttribute("data",d);
		
		scheduler=Executors.newSingleThreadScheduledExecutor();
	    	
	    scheduler.scheduleAtFixedRate(new Reloader(d), 0, 1, TimeUnit.SECONDS);
	}
    
    public void contextDestroyed(ServletContextEvent event)
    {
    	try
    	{
    		con.close();
    	}
    	catch(SQLException se)
    	{
    		se.printStackTrace();
    	}
    	scheduler.shutdownNow();
    }
	
}
