package mint.event.dao;

import java.util.List;
import java.util.Map;

import mint.event.bean.EventDTO;
import mint.event.bean.EventProductDTO;
import mint.product.bean.ProductDTO;

public interface EventDAO {

	public void eventWrite(Map<String, Object> map);

	public List<EventDTO> getEventList();

	public void eventDelete(Map<String, String[]> map);

	public EventDTO getEvent(int seq);

	public void eventModify(Map<String, Object> map);

	public List<EventDTO> eventSearch(Map<String, Object> map);

	public List<ProductDTO> getEventProductList(Map<String, Object> map);

	public void eventProductUpdate(Map<String, Object> map);

	public List<EventProductDTO> getEventProduct(int seq);

	public void eventEndProductUpdate(Map<String, Object> map);

	public List<ProductDTO> getProductList(Map<String, Object> map);

	public int getTotalProduct(Map<String, Object> map);

	public List<EventDTO> getEventListMain();

}
