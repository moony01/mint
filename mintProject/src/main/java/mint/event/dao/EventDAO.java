package mint.event.dao;

import java.util.List;
import java.util.Map;

import mint.event.bean.EventDTO;

public interface EventDAO {

	public void eventWrite(Map<String, Object> map);

	public List<EventDTO> getEventList(Map<String, Integer> map);

	public int getTotalEvent();

	public void eventDelete(Map<String, String[]> map);

	public EventDTO getEvent(int seq);

	public void eventModify(Map<String, Object> map);

}
