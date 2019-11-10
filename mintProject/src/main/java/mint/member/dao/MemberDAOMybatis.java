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


}
