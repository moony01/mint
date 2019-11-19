package mint.event.service;

import java.util.List;
import java.util.Map;

import mint.event.bean.EventDTO;

public interface EventService {

	public void eventWrite(Map<String, Object> map);

	public List<EventDTO> getEventList(Map<String, Integer> map);

	public int getTotalEvent();

	public void eventDelete(Map<String, String[]> map);

}
