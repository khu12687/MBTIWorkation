package kr.ac.kopo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.model.Admin;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Admin admin = (Admin) session.getAttribute("admin");		

		if(admin !=null)
			return true;
		else {
			String query = request.getQueryString();	
			session.setAttribute("target", request.getRequestURI() + (query != null ? "?" + query : ""));
			response.sendRedirect("/admin/login");
		}
		return false;
	}
}
