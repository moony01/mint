package mint.event.service;

import java.util.List;
import java.util.Map;

import mint.event.bean.EventDTO;
import mint.product.bean.ProductDTO;

public interface EventService {

	public void eventWrite(Map<String, Object> map);

	public List<EventDTO> getEventList(Map<String, Integer> map);

	public int getTotalEvent();

	public void eventModify(Map<String, Object> map);

	public void eventDelete(Map<String, String[]> map);

	public EventDTO getEvent(int parseInt);

	public List<EventDTO> eventSearch(Map<String, Object> map);

	public int getSearchTotalEvent(Map<String, Object> map);

	public List<ProductDTO> getProductList(Map<String, Object> map);

	public void eventProductModify(Map<String, String[]> map2);

}
