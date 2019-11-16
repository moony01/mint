package mint.cart.dao;

import java.util.List;
import java.util.Map;

import mint.product.bean.ProductDTO;

public interface CartDAO {

	public List<ProductDTO> getCartList(Map<String, String> map);

	public void cartListDelete(Map<String, String> map);
}
