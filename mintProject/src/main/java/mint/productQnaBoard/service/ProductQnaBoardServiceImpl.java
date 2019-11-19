package mint.productQnaBoard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.productQnaBoard.bean.ProductQnaBoardDTO;
import mint.productQnaBoard.dao.ProductQnaBoardDAO;

@Service("productQnaBoardService")
public class ProductQnaBoardServiceImpl implements ProductQnaBoardService {
	@Autowired
	private ProductQnaBoardDAO productQnaBoardDAO;

	@Override
	public int getAllProductQnaBoardTotArticle() {
		return productQnaBoardDAO.getAllProductQnaBoardTotArticle();
	}

	@Override
	public List<Map<String, Object>> getAllProductQnaBoardList(Map<String, Object> map) {
		return productQnaBoardDAO.getAllProductQnaBoardList(map);
	}

	@Override
	public int getProductQnaBoardTotArticle(Map<String, Object> map) {
		return productQnaBoardDAO.getProductQnaBoardTotArticle(map);
	}

	@Override
	public List<Map<String, Object>> getProductQnaBoardList(Map<String, Object> map) {
		return productQnaBoardDAO.getProductQnaBoardList(map);
	}

	@Override
	public void reply(Map<String, String> map) {
		productQnaBoardDAO.reply(map);
		
	}

	@Override
	public void writeProductQna(Map<String, String> map) {
		productQnaBoardDAO.writeProductQna(map);
		
	}
}
