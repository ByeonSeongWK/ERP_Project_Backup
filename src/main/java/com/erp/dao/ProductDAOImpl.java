package com.erp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.erp.vo.Product;

// user 제품
@Repository
public class ProductDAOImpl implements ProductDAO {
	
	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.erp.mappers.erp";

	@Override
	public List<Product> getProductList() throws Exception {
		return sqlSession.selectList(SESSION + ".getProductList");
	}
	
	@Override
	public List<Product> searchProduct(String pro_name) throws Exception {
		return sqlSession.selectList(SESSION + ".searchProduct", pro_name);
	}

	@Override
	public void addProduct(Product product) throws Exception {
		sqlSession.insert(SESSION + ".addProduct", product);
		
	}

	@Override
	public String searchForDel(String pro_num) throws Exception {
		return sqlSession.selectOne(SESSION + ".searchForDel", pro_num);
	}
	
	@Override
	public void deleteProduct(String pro_num) throws Exception {
		sqlSession.delete(SESSION + ".deleteProduct", pro_num);
	}

	
	
	
}
