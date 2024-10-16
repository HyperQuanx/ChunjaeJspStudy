package net.fullstack7.listeners;

import jakarta.servlet.annotation.WebListener;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

/**
 * Application Lifecycle Listener implementation class SessionListener
 *
 */
public class SessionListener implements HttpSessionListener {
	private int sessionCnt;

    /**
     * Default constructor. 
     */
    public SessionListener() {
    	
    }

	/**
     * @see HttpSessionListener#sessionCreated(HttpSessionEvent)
     */
    // 동접자나 어느 메뉴에서 어떤 동작을 하는지 추적할 때 많이 사용
    public void sessionCreated(HttpSessionEvent se)  {
    	sessionCnt++;
    	System.out.println("----------------------------------------");
    	System.out.println("SessionListener Create");
    	// 이걸로 언제 접속했는지, 언제 로그아웃 했는지 추적 가능
    	System.out.println("[리스너] 세션 생성 : " + se.getSession().getId());
    	System.out.println("[리스너] 세션 접속 인원 수 카운트 : " + this.sessionCnt);
    	System.out.println("SessionListener Create");
    }

	/**
     * @see HttpSessionListener#sessionDestroyed(HttpSessionEvent)
     */
    public void sessionDestroyed(HttpSessionEvent se)  {
    	sessionCnt--;
    	System.out.println("[리스너] 세션 소멸 : " + se.getSession().getId());
    	System.out.println("[리스너] 세션 접속 인원 수 카운트 : " + this.sessionCnt);
    	System.out.println("SessionListener Destroyed");
    	System.out.println("----------------------------------------");
    }
	
}
