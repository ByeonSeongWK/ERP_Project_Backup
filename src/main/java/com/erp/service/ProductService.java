package com.erp.service;

import java.util.List;

import com.erp.vo.Product;

// user 제품
public interface ProductService {
	
	public List<Product> getProductList() throws Exception;
	
	public List<Product> searchProduct(String pro_name) throws Exception;
	
	public void addProductAction(Product product) throws Exception;
	
	public String searchForDel(String pro_num) throws Exception;
	
	public void deleteProduct(List<String> pro_num) throws Exception;

}
