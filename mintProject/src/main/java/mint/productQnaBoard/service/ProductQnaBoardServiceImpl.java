package mint.productQnaBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.productQnaBoard.dao.ProductQnaBoardDAO;

@Service("productQnaBoardService")
public class ProductQnaBoardServiceImpl implements ProductQnaBoardService {
	@Autowired
	private ProductQnaBoardDAO productQnaBoardDAO;
}
