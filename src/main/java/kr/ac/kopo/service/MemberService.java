package kr.ac.kopo.service;

import java.util.List;

import kr.ac.kopo.model.LogLogin;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.util.Pager;

public interface MemberService {

	void insert(Member member);

	Member loginCheck(Member member);

	boolean checkId(String id);

	Member checkPhone(Member member);

	void changePw(Member member);

	Member checkPhonetoId(Member member);

	List<Member> selectAll(Pager pager);

	List<LogLogin> log(String memberId);

	

	

}
