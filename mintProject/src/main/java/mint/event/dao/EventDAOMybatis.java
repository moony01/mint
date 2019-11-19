package mint.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.event.bean.EventDTO;

@Transactional
@Repository("eventDAO")
public class EventDAOMybatis implements EventDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void eventWrite(Map<String, Object> map) {
		sqlSession.insert("eventSQL.eventWrite", map);
	}

	@Override
	public List<EventDTO> getEventList(Map<String, Integer> map) {
		return sqlSession.selectList("eventSQL.getEventList", map);
	}

	@Override
	public int getTotalEvent() {
		return sqlSession.selectOne("eventSQL.getTotalEvent");
	}

	@Override
	public void eventDelete(Map<String, String[]> map) {
		sqlSession.delete("eventSQL.eventDelete", map);
	}

	@Override
	public EventDTO getEvent(int seq) {
		return sqlSession.selectOne("eventSQL.getEvent", seq);
	}

	@Override
	public void eventModify(Map<String, Object> map) {
		sqlSession.update("eventSQL.eventModify", map);
	}
}
