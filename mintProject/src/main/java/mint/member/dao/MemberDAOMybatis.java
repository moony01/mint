package mint.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.member.bean.MemberDTO;
import mint.member.bean.SupplierDTO;

@Transactional
@Repository("memberDAO")
public class MemberDAOMybatis implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void writeMember(Object object) {
		if(object instanceof MemberDTO) { // 받아온 객체의 클래스타입이 MemberDTO => 회원가입
			sqlSession.insert("memberSQL.writeMember", object);	
		} else if(object instanceof SupplierDTO) { // 받아온 객체의 클래스타입이 SupplierDTO => 판매자 등록
			sqlSession.insert("memberSQL.writeSupplier", object);			
		}		
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

	@Override
	public SupplierDTO getSupplierBy(Map<String, String> map) {
		return sqlSession.selectOne("memberSQL.getSupplierBy", map);	
	}

	@Override
	public List<Map<String, String>> getList(Map<String, String> map) {
		if(map.containsKey("searchOption")) {
			return sqlSession.selectList("memberSQL.getListBysearchOption", map);
			
		} else if(map.get("orderbyValue").equals("isAgreedSMS")) {
			return sqlSession.selectList("memberSQL.getListBySMS", map);
		}
		return sqlSession.selectList("memberSQL.getList", map);
	}


}
