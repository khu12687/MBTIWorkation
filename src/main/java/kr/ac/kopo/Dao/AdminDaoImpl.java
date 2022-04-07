package kr.ac.kopo.Dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.exception.DataNotFoundException;
import kr.ac.kopo.model.Admin;
import kr.ac.kopo.model.RoomOption;

@Repository
public class AdminDaoImpl implements AdminDao{

	@Autowired
	SqlSession sql;
	
	@Override
	public Admin loginCheck(Admin admin) {
		Admin obj=sql.selectOne("Admin.loginCheck", admin);
		if(obj==null) {
			System.out.println("오류발생");
			throw new DataNotFoundException("로그인 정보가 올바르지 않습니다");
			
		}
		return obj;
		
	}

	@Override
	public void roomOptionRegist(RoomOption roomOption) {
		sql.insert("Admin.roomOptionRegist",roomOption);
	}

	@Override
	public List<RoomOption> roomOptionList() {

		return sql.selectList("Admin.roomOptionList");
	}

	@Override
	public void delete(int roomOptionId) {
		sql.selectOne("Admin.delete",roomOptionId);
	}

	@Override
	public void edit(RoomOption roomOption) {
		sql.selectOne("Admin.edit", roomOption);
	}

}
