package mint.cart.service;

import java.util.List;
import java.util.Map;

import mint.cart.bean.CartDTO;

public interface CartService {
	
	public List<CartDTO> getCartList(Map<String, String> map);

}
