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
	public String searchSupplier_id(String supp_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".searchSupplier_id", supp_id);
	}

	@Override
	public void deleteSupplier(String supp_id) throws Exception {
		sqlSession.delete(SESSION + ".deleteSupplier", supp_id);
	}

	@Override
	public Supplier getSearchSupplier(String supp_id) throws Exception {
		return sqlSession.selectOne(SESSION + ".getSearchSupplier", supp_id);
	}

	@Override
	public void updateSupplier(String supp_id) throws Exception {
		sqlSession.update(SESSION + ".updateSupplier", supp_id);
	}

	

}
