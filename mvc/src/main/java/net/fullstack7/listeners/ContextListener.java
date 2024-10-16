package net.fullstack7.listeners;

import java.util.Enumeration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ContextListener
 *
 */
public class ContextListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ContextListener() {
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  {
    	System.out.println("----------------------------------------");
    	System.out.println("ContextListener Start");
    	System.out.println("ContextListener >> contextInitialized");
    	System.out.println("컨텍스트 객체 리스너 동작 확인");
    	Enumeration<String> apps = sce.getServletContext().getInitParameterNames();
    	while(apps.hasMoreElements()) {
    		System.out.println("컨텍스트 객체 매개변수 확인 : " + apps.nextElement());
    	}
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  {
    	Enumeration<String> apps = sce.getServletContext().getInitParameterNames();
    	while(apps.hasMoreElements()) {
    		System.out.println("컨텍스트 객체 매개변수 소멸 확인 : " + apps.nextElement());
    	}
    	System.out.println("ContextListener End");
    	System.out.println("----------------------------------------");
    }
	
}
