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
	public List<ProductDTO> getCartList(Map<String, String> map) {
		return cartDAO.getCartList(map);
	}

	@Override
	public void cartListDelete(Map<String, String> map) {
		cartDAO.cartListDelete(map);
	}

}
