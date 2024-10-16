package net.fullstack7.listeners;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;

/**
 * Application Lifecycle Listener implementation class SessionAttributesListener
 *
 */
public class SessionAttributesListener implements HttpSessionAttributeListener {

    /**
     * Default constructor. 
     */
    public SessionAttributesListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see HttpSessionAttributeListener#attributeReplaced(HttpSessionBindingEvent)
     */
    public void attributeReplaced(HttpSessionBindingEvent se)  { 
    	System.out.println("----------------------------------------");
    	System.out.println("SessionAttributesListener attributeReplaced");
    	System.out.println("[리스너] 세션 속성명 변경 : " + se.getName() + " = " + se.getValue());
    	System.out.println("----------------------------------------");
    }

	/**
     * @see HttpSessionAttributeListener#attributeRemoved(HttpSessionBindingEvent)
     */
    public void attributeRemoved(HttpSessionBindingEvent se)  {
    	System.out.println("----------------------------------------");
    	System.out.println("SessionAttributesListener attributeRemoved");
    	System.out.println("[리스너] 세션 속성명 제거 : " + se.getName() + " = " + se.getValue());
    	System.out.println("----------------------------------------");
    }

	/**
     * @see HttpSessionAttributeListener#attributeAdded(HttpSessionBindingEvent)
     */
    public void attributeAdded(HttpSessionBindingEvent se)  { 
    	System.out.println("----------------------------------------");
    	System.out.println("SessionAttributesListener attributeAdded");
    	System.out.println("[리스너] 세션 속성명 추가 : " + se.getName() + " = " + se.getValue());
    	System.out.println("----------------------------------------");
    }
	
}
