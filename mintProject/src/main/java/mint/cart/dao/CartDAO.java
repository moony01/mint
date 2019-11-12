package mint.cart.dao;

import java.util.List;
import java.util.Map;

import mint.cart.bean.CartDTO;

public interface CartDAO {

	List<CartDTO> getCartList(Map<String, String> map);
}
