package mint.event.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Repository("eventDAO")
public class EventDAOMybatis implements EventDAO{
	@Autowired
	private SqlSession sqlSession;
}
