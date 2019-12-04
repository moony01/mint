package mint.event.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mint.event.bean.EventDTO;
import mint.event.bean.EventProductDTO;
import mint.product.bean.ProductDTO;

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
	public List<EventDTO> getEventList() {
		return sqlSession.selectList("eventSQL.getEventList");
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

	@Override
	public List<EventDTO> eventSearch(Map<String, Object> map) {
		return sqlSession.selectList("eventSQL.eventSearch", map);
	}

	@Override
	public List<ProductDTO> getEventProductList(Map<String, Object> map) {
		return sqlSession.selectList("eventSQL.getEventProductList", map);
	}

	@Override
	public void eventProductUpdate(Map<String, Object> map) {
		sqlSession.update("eventSQL.eventProductUpdate", map);
	}

	@Override
	public List<EventProductDTO> getEventProduct(int seq) {
		return sqlSession.selectList("eventSQL.getEventProduct", seq);
	}

	@Override
	public void eventEndProductUpdate(Map<String, Object> map) {
		sqlSession.update("eventSQL.eventEndProductUpdate", map);
	}

	@Override
	public List<ProductDTO> getProductList(Map<String, Object> map) {
		return sqlSession.selectList("eventSQL.getProductList", map);
	}

	@Override
	public int getTotalProduct(Map<String, Object> map) {
		return sqlSession.selectOne("eventSQL.getTotalProduct", map);
	}

	@Override
	public List<EventDTO> getEventListMain() {
		return sqlSession.selectList("eventSQL.getEventListMain");
	}

	@Override
	public List<ProductDTO> getEventProductListWithSort(Map<String, Object> map2) {
		return sqlSession.selectList("eventSQL.getEventProductListWithSort");
	}


}
