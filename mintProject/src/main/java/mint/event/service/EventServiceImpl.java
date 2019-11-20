package mint.event.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.event.bean.EventDTO;
import mint.event.dao.EventDAO;

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
}
