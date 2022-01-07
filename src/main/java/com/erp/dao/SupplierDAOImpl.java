package com.erp.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.erp.vo.Supplier;

// user 공급처
@Repository
public class SupplierDAOImpl implements SupplierDAO {

	@Inject
	SqlSession sqlSession;
	
	final String SESSION = "com.erp.mappers.erp";

	@Override
	public List<Supplier> getSupplierList() throws Exception {
		return sqlSession.selectList(SESSION + ".getSupplierList");
	}

	@Override
	public List<Supplier> searchSupplier(String supp_name) throws Exception {
		return sqlSession.selectList(SESSION + ".searchSupplier", supp_name);
	}
	
	@Override
	public void addSupplier(Supplier supplier) throws Exception {
		sqlSession.insert(SESSION + ".addSupplier", supplier);
	}

	@Override
	public List<Supplier> searchSupplier_Del(String supp_id) throws Exception {
		return sqlSession.selectList(SESSION + ".searchSupplier_Del",supp_id);
	}


}
