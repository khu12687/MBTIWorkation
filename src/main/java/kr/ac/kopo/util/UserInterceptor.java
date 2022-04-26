package kr.ac.kopo.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.Member;

public class UserInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		
		Member member = (Member) session.getAttribute("member");		

		if(member !=null)
			return true;
		else {
			String query = request.getQueryString();	
			session.setAttribute("target", request.getRequestURI() + (query != null ? "?" + query : ""));
			response.sendRedirect("/member/login");
		}
		return false;
	}
}
