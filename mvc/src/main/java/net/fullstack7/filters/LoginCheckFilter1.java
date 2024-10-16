package net.fullstack7.filters;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet Filter implementation class LoginCheckFilter1
 */
public class LoginCheckFilter1 extends HttpFilter implements Filter {
	
	private FilterConfig filterConfig;
	
	
	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public LoginCheckFilter1() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		filterConfig = fConfig;
		String filterName = fConfig.getFilterName();
		
		System.out.println("----------------------------------------------------------");
		System.out.println("LoginCheckFilter1 Start");
		System.out.println("초기화 시점에 한 번만 호출합니다. 초기화 시에 필요한 로직이 있으면 추가합니다.");
		System.out.println("LoginCheckFilter1 >> init() >> filterName : " + filterName);
		System.out.println("----------------------------------------------------------");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		String filterInitName = filterConfig.getInitParameter("FILTER_INIT_PARAM1");
		String methodName = req.getMethod();
		HttpSession session = req.getSession();
		
		System.out.println("----------------------------------------------------------");
		System.out.println("LoginCheckFilter1 >> doFilter() >> filterInitName : " + filterInitName);
		System.out.println("LoginCheckFilter1 >> doFilter() >> methodName : " + methodName);
		System.out.println("----------------------------------------------------------");
		
		/*
		 * get 이나 post 체크 로직 작성
		if(methodName.equals("GET")) {
			
		} else {
			
		}
		*/
		
		if (session.getAttribute("name") == null) {
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter wrt = res.getWriter();
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("alert('로그인 후 사용 가능합니다.');");
			sb.append("window.location.href='/mvc/member/login.do';");
			sb.append("</script>");
			
			System.out.println("LoginCheckFilter1 >> doFilter() >> script : " + sb.toString());
			
			wrt.print(sb.toString());
			wrt.close();
			return;
		} else {
			chain.doFilter(request, response);
		}
		
		chain.doFilter(request, response);
	}
	
	
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}
}
