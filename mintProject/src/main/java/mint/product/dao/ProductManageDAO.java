package mint.product.dao;

import java.util.List;
import java.util.Map;

import mint.orderAndSales.bean.OrderAndSalesDTO;
import mint.product.bean.ProductDTO;

public interface ProductManageDAO {

	public void productWrite(ProductDTO productDTO);

	public List<ProductDTO> getProductList(Map<String, String> map);

	public List<Map<String, String>> getSalesData();

	public List<Map<String, String>> getProductData();

	public int getCntProductList(Map<String, String> map);

	public List<ProductDTO> getHeaderProductList(Map<String, String> map);
	
	public List<ProductDTO> productSearch(String sword);

}
