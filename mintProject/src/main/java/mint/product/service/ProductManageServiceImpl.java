package mint.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mint.orderAndSales.bean.OrderAndSalesDTO;
import mint.product.bean.ProductDTO;
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
	public int getCntProductList(Map<String, String> map) {
		return productManageDAO.getCntProductList(map);
	}

	@Override
	public List<ProductDTO> getHeaderProductList(Map<String, String> map) {
		return productManageDAO.getHeaderProductList(map);
	}

}
