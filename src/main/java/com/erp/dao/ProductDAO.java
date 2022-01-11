package com.erp.dao;

import java.util.List;

import com.erp.vo.Product;

// user 제품
public interface ProductDAO {

	//제품리스트 불러오기
	public List<Product> getProductList() throws Exception;
	
	//제품 검색하기
	public List<Product> searchProduct(String pro_name) throws Exception;
	
	//제품 등록하기
	public void addProduct(Product product) throws Exception;
	
	// 삭제하기 위한 검색
	public String searchForDel(String pro_num) throws Exception;
	
	// 제품 삭제하기
	public void deleteProduct(String pro_num) throws Exception;
}
