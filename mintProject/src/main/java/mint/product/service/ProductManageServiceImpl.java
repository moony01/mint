package mint.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.product.bean.ProductDTO;
import mint.product.bean.StockAlarmDTO;
import mint.product.dao.ProductManageDAO;


@Service
public class ProductManageServiceImpl implements ProductManageService{
	@Autowired
	private ProductManageDAO productManageDAO;

	@Override
	public void productWrite(ProductDTO productDTO) {
		productManageDAO.productWrite(productDTO);
		
	}

	@Override
	public List<ProductDTO> getProductList(Map<String, String> map) {
		return productManageDAO.getProductList(map);
	}

	@Override
	public List<Map<String, String>> getSalesData() {
		return productManageDAO.getSalesData();
	}

	@Override
	public List<Map<String, String>> getProductData() {
		return productManageDAO.getProductData();
	}
	
	@Override
	public List<Map<String, String>> getCategoryData() {
		return productManageDAO.getCategoryData();
	}

	@Override
	public int getCntProductList(Map<String, String> map) {
		return productManageDAO.getCntProductList(map);
	}

	@Override
	public List<ProductDTO> getHeaderProductList(Map<String, String> map) {
		return productManageDAO.getHeaderProductList(map);
	}
	
	@Override
	public List<ProductDTO> productSearch(String sword) {
		return productManageDAO.productSearch(sword);
	}

	@Override
	public ProductDTO getProductInfo(Map<String, String> map) {
		return productManageDAO.getProductInfo(map);
	}

	@Override
	public List<ProductDTO> getSameSubcategoryProductList(Map<String, String> map) {
		return productManageDAO.getSameSubcategoryProductList(map);
	}

	@Override
	public List<ProductDTO> getProductAdminList(Map<String, String> map) {
		return productManageDAO.getProductAdminList(map);
	}

	@Override
	public int getCntProductAdminList(Map<String, String> map) {
		return productManageDAO.getCntProductAdminList(map);
	}

	@Override
	public int productUpdate(ProductDTO productDTO) {
		return productManageDAO.productUpdate(productDTO);
	}

	@Override
	public List<ProductDTO> getProductListMain(int number) {
		return productManageDAO.getProductListMain(number);
	}
	
	@Override
	public int getProductAlarmCnt(int productCode) {
		return productManageDAO.getProductAlarmCnt(productCode);
	}

	@Override
	public int getProductStockCnt(int productCode) {
		return productManageDAO.getProductStockCnt(productCode);
	}

	@Override
	public List<StockAlarmDTO> getProductAlarmList(int productCode) {
		return productManageDAO.getProductAlarmList(productCode);
	}

	@Override
	public int getSameAlarmCnt(Map<String, String> map) {
		return productManageDAO.getSameAlarmCnt(map);
	}

	@Override
	public void addStockAlarm(Map<String, String> map) {
		productManageDAO.addStockAlarm(map);
	}

	@Override
	public void StockAlarmDelete(int productCode) {
		productManageDAO.StockAlarmDelete(productCode);
		
	}
}
