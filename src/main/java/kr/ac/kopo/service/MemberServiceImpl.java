package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.Dao.MemberDao;
import kr.ac.kopo.model.LogLogin;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.util.Pager;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	@Override
	public void insert(Member member) {
		memberDao.insert(member);
	}

	@Override
	public Member loginCheck(Member member) {
		
		return memberDao.loginCheck(member);
	}

	@Override
	public boolean checkId(String id) {
		if(memberDao.checkId(id) == 0)
			return true;
		else
			return false;
	}

	@Override
	public Member checkPhone(Member member) {

		return memberDao.checkPhone(member);
	}

	@Override
	public void changePw(Member member) {
		
		memberDao.changePw(member);
		
	}

	@Override
	public Member checkPhonetoId(Member member) {
		return memberDao.checkPhonetoId(member);
	}

	@Override
	public List<Member> selectAll(Pager pager) {

		return memberDao.selectAll(pager);
	}

	@Override
	public List<LogLogin> log(String memberId) {

		return memberDao.log(memberId);
	}







}
