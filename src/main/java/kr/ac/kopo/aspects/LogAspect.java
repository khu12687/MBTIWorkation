package kr.ac.kopo.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import kr.ac.kopo.model.Member;

@Aspect
@Component
public class LogAspect {
	
	@Autowired
	LogService service;
		
	@Before("execution(* kr..MemberServiceImpl.loginCheck(..)) && args(member)")
	public void LogArticleAdd(Member member) {
		System.out.println("새로운 로그인 시도: "+ member.getId());
		service.login(member, false);
	}
	
}
