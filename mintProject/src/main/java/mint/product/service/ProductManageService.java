package mint.product.service;

import java.util.List;
import java.util.Map;

import mint.product.bean.ProductDTO;
import mint.product.bean.StockAlarmDTO;

public interface ProductManageService {

	public void productWrite(ProductDTO productDTO);

	public List<ProductDTO> getProductList(Map<String, String> map);

	public List<Map<String, String>> getSalesData();

	public List<Map<String, String>> getProductData();

	public List<Map<String, String>> getCategoryData();
	
	public int getCntProductList(Map<String, String> map);

	public List<ProductDTO> getHeaderProductList(Map<String, String> map);
	
	public List<ProductDTO> productSearch(String sword);

	public ProductDTO getProductInfo(Map<String, String> map);

	public List<ProductDTO> getSameSubcategoryProductList(Map<String, String> map);

	public List<ProductDTO> getProductAdminList(Map<String, String> map);

	public int getCntProductAdminList(Map<String, String> map);

	public int productUpdate(ProductDTO productDTO);

	public List<ProductDTO> getProductListMain(int i);
	
	public int getProductAlarmCnt(int productCode);

	public int getProductStockCnt(int productCode);

	public List<StockAlarmDTO> getProductAlarmList(int productCode);

	public int getSameAlarmCnt(Map<String, String> map);

	public void addStockAlarm(Map<String, String> map);

	public void StockAlarmDelete(int productCode);


}
