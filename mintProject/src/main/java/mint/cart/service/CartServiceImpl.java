package mint.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.cart.dao.CartDAO;
import mint.product.bean.ProductDTO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<Map<String,String>> getCartList(Map<String, String> map) {
		return cartDAO.getCartList(map);
	}

	@Override
	public int cartListDelete(Map<String, String> map) {
		return cartDAO.cartListDelete(map);
	}

	@Override
	public int getSameCart(Map<String, String> map) {
		return cartDAO.getSameCart(map);
	}

	@Override
	public int addCartProduct(Map<String, String> map) {
		return cartDAO.addCartProduct(map);
	}

	@Override
	public int cartSoldOutDelete(Map<String, Object> map) {
		return cartDAO.cartSoldOutDelete(map);
	}

}
