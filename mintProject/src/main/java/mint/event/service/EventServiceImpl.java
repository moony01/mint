package mint.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.event.dao.EventDAO;

@Service(value="eventService")
public class EventServiceImpl implements EventService {
	@Autowired
	private EventDAO eventDAO;
}
