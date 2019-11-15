package mint.productQnaBoard.dao;

import java.util.List;
import java.util.Map;

import mint.productQnaBoard.bean.ProductQnaBoardDTO;

public interface ProductQnaBoardDAO {

	public int getAllProductQnaBoardTotArticle();

	public List<ProductQnaBoardDTO> getAllProductQnaBoardList(Map<String, Object> map);

	public int getProductQnaBoardTotArticle(Map<String, Object> map);

	public List<ProductQnaBoardDTO> getProductQnaBoardList(Map<String, Object> map);

}
