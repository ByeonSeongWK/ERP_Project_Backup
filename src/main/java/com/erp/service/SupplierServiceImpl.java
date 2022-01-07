package com.erp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.erp.dao.SupplierDAO;
import com.erp.vo.Supplier;

// user 공급처
@Service
public class SupplierServiceImpl implements SupplierService {

	@Inject
	SupplierDAO dao;
	
	@Override
	public List<Supplier> getSupplierList() throws Exception {

		return dao.getSupplierList();
	}
	
	@Override
	public List<Supplier> searchSupplier(String supp_name) throws Exception {
		
		supp_name = "%" + supp_name + "%";
		
		return dao.searchSupplier(supp_name);
	}
	
	@Override
	public void addSupplierAction(Supplier supplier) throws Exception {
		
		dao.addSupplier(supplier);
	}

	@Override
	public List<Supplier> searchSupplier_Del(String supp_id) throws Exception {
		
		return dao.searchSupplier_Del(supp_id);
	}
	//


}