package mint.product.service;

import java.util.List;
import java.util.Map;

import mint.product.bean.ProductDTO;

public interface ProductManageService {

	public void productWrite(ProductDTO productDTO);

	public List<ProductDTO> getProductList(Map<String, String> map);

}
