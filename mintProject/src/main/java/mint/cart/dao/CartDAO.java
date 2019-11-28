package mint.cart.dao;

import java.util.List;
import java.util.Map;

import mint.product.bean.ProductDTO;

public interface CartDAO {

	public List<Map<String,String>> getCartList(Map<String, String> map);

	public int cartListDelete(Map<String, String> map);

	public int getSameCart(Map<String, String> map);

	public void addCartProduct(Map<String, String> map);

	public int getCartCount(String id);

	public int cartSoldOutDelete(Map<String, Object> map);
}
