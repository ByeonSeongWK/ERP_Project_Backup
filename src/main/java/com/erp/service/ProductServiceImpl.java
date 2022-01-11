package com.erp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.erp.dao.ProductDAO;
import com.erp.vo.Product;

// user 제품
@Service
public class ProductServiceImpl implements ProductService {

	@Inject
	ProductDAO dao;
	
	@Override
	public List<Product> getProductList() throws Exception {

		return dao.getProductList();
	}

	@Override
	public List<Product> searchProduct(String pro_name) throws Exception {
		
		pro_name = "%" + pro_name + "%";
		
		return dao.searchProduct(pro_name);
	}

	@Override
	public void addProductAction(Product product) throws Exception {

		dao.addProduct(product);
		
	}
	
	@Override
	public String searchForDel(String pro_num) throws Exception {
		
		return dao.searchForDel(pro_num);
	}


	@Override
	public void deleteProduct(List<String> pro_num) throws Exception {
		
		for(String item : pro_num)
		dao.deleteProduct(item);
		
	}


}
