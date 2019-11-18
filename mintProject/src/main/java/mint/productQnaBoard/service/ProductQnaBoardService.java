package mint.productQnaBoard.service;

import java.util.List;
import java.util.Map;

import mint.productQnaBoard.bean.ProductQnaBoardDTO;

public interface ProductQnaBoardService {

	public int getAllProductQnaBoardTotArticle();

	public List<ProductQnaBoardDTO> getAllProductQnaBoardList(Map<String, Object> map);

	public int getProductQnaBoardTotArticle(Map<String, Object> map);

	public List<ProductQnaBoardDTO> getProductQnaBoardList(Map<String, Object> map);

	public void reply(Map<String, String> map);

}
