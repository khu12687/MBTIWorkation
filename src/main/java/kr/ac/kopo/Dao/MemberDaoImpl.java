package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exception.DataNotFoundException;
import kr.ac.kopo.model.Member;
import kr.ac.kopo.util.Pager;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public void insert(Member member) {
		
		sql.insert("Member.insert", member);
	}

	@Override
	public Member loginCheck(Member member) throws DataNotFoundException{
		Member obj=sql.selectOne("Member.loginCheck", member);
		if(obj==null) {
			System.out.println("오류발생");
			throw new DataNotFoundException("로그인 정보가 올바르지 않습니다");
			
		}
		return obj;
	}

	@Override
	public int checkId(String id) {		
		return sql.selectOne("Member.check_id", id);
	}

	@Override
	public Member checkPhone(Member member) {
		
		return sql.selectOne("Member.checkPhone", member);
	}

	@Override
	public void changePw(Member member) {
		
		sql.update("Member.changePw", member);
		
	}

	@Override
	public Member checkPhonetoId(Member member) {
		return sql.selectOne("Member.checkPhonetoId",member);
	}

	@Override
	public List<Member> selectAll(Pager pager) {

		return sql.selectList("Member.selectAll",pager);
	}

}
