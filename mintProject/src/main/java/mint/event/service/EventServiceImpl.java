package mint.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.event.bean.EventDTO;
import mint.event.bean.EventProductDTO;
import mint.event.dao.EventDAO;
import mint.product.bean.ProductDTO;

@Service(value="eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;

	@Override
	public void eventWrite(Map<String, Object> map) {
		eventDAO.eventWrite(map);
	}

	@Override
	public List<EventDTO> getEventList(Map<String, Integer> map) {
		return eventDAO.getEventList(map);
	}

	@Override
	public int getTotalEvent() {
		return eventDAO.getTotalEvent();
	}
	
	@Override
	public void eventDelete(Map<String, String[]> map) {
		eventDAO.eventDelete(map);
	}

	@Override
	public EventDTO getEvent(int seq) {
		return eventDAO.getEvent(seq);
	}

	@Override
	public void eventModify(Map<String, Object> map) {
		eventDAO.eventModify(map);
	}

	@Override
	public List<EventDTO> eventSearch(Map<String, Object> map) {
		return eventDAO.eventSearch(map);
	}

	@Override
	public int getSearchTotalEvent(Map<String, Object> map) {
		return eventDAO.getSearchTotalEvent(map);
	}

	@Override
	public List<ProductDTO> getEventProductList(Map<String, Object> map) {
		return eventDAO.getEventProductList(map);
	}

	@Override
	public void eventProductUpdate(List<Map<String, Object>> list) {
		for(int i=0; i<list.size(); i++) {
			eventDAO.eventProductUpdate(list.get(i));
		}
	}

	@Override
	public List<EventProductDTO> getEventProduct(int seq) {
		return eventDAO.getEventProduct(seq);
	}

	@Override
	public void eventEndProductUpdate(List<Map<String, Object>> list) {
		for(int i=0; i<list.size(); i++) {
			eventDAO.eventEndProductUpdate(list.get(i));
		}
	}

	@Override
	public List<ProductDTO> getProductList(Map<String, Object> map) {
		return eventDAO.getProductList(map);
	}

	@Override
	public int getTotalProduct(Map<String, Object> map) {
		return eventDAO.getTotalProduct(map);
	}

}
