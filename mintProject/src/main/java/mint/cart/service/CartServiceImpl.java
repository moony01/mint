package mint.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.cart.bean.CartDTO;
import mint.cart.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public List<CartDTO> getCartList(Map<String, String> map) {
		return cartDAO.getCartList(map);
	}

}
