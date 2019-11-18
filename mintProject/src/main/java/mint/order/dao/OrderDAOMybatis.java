package mint.order.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mint.member.bean.MemberDTO;


@Repository
public class OrderDAOMybatis implements OrderDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO getUserData(Map<String, String> map) {
		return sqlSession.selectOne("orderSQL.getUserData", map);
	}
}
