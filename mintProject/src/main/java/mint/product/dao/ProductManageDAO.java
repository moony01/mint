package mint.product.dao;

import java.util.List;
import java.util.Map;

import mint.product.bean.ProductDTO;

public interface ProductManageDAO {

	public void productWrite(ProductDTO productDTO);

	public List<ProductDTO> getProductList(Map<String, String> map);

}
