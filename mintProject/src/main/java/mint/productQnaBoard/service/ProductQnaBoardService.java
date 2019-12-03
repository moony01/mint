package mint.productQnaBoard.service;

import java.util.List;
import java.util.Map;

import mint.productQnaBoard.bean.ProductQnaBoardDTO;

public interface ProductQnaBoardService {

	public int getAllProductQnaBoardTotArticle();

	public List<Map<String, Object>> getAllProductQnaBoardList(Map<String, Object> map);

	public int getProductQnaBoardTotArticle(Map<String, Object> map);

	public List<Map<String, Object>> getProductQnaBoardList(Map<String, Object> map);

	public void reply(Map<String, String> map);

	public void writeProductQna(Map<String, String> map);

	public void deleteProductQna(Map<String, String> map);

}
