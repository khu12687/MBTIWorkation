package kr.ac.kopo.aspects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.model.Member;


@Service
public class LogServiceImpl implements LogService{

	@Autowired
	LogDao dao;
	
	@Override
	public void logFalse(Member member, boolean result) {
		dao.logFalse(member, result);
		
	}

	@Override
	public Member loginCheck(Member member) {

		return dao.loginCheck(member);
	}

}
