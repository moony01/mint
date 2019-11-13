package mint.member.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.member.bean.MemberDTO;

@Transactional
@Repository("memberDAO")
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeMember(MemberDTO memberDTO) {
		sqlSession.insert("memberSQL.writeMember", memberDTO);
		
	}

	@Override
	public MemberDTO getUserBy(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getUserBy", map);
	}

	@Override
	public void insertAttendance(String id) {
		String attDates = sqlSession.selectOne("memberSQL.isAttExist",id);
		if(attDates == null) {
			sqlSession.update("memberSQL.insertAttendance", id);			
		} else {
			sqlSession.update("memberSQL.updateAttendance", id);		
		}
	}

	@Override
	public String getAttDates(String id) {
		String attDate = sqlSession.selectOne("memberSQL.getAttDates", id);
		if(attDate==null) {
			attDate = "!";
		}
		return attDate;
	}
	
	@Override
	public String findUserBy(Map<Object, Object> map) {
		return sqlSession.selectOne("memberSQL.findUserBy", map);
	}

	@Override
	public void updateInfo(Map<String, String> map) {
		sqlSession.update("memberSQL.updateInfo", map);
	}

	@Override
	public void modifyMember(MemberDTO memberDTO) {
		sqlSession.update("memberSQL.modifyMember", memberDTO);
		
	}

	@Override
	public void deleteMember(String id) {
		sqlSession.delete("memberSQL.deleteMember",id);
		
	}
}
