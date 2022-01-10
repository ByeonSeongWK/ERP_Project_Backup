package com.erp.dao;

import java.util.List;

import com.erp.vo.Supplier;

// user 공급처
public interface SupplierDAO {
	
	public List<Supplier> getSupplierList() throws Exception;
	
	public List<Supplier> searchSupplier(String supp_name) throws Exception;
	
	public void addSupplier(Supplier supplier) throws Exception;
	
	public String searchSupplier_id(String supp_id) throws Exception;
	
	public void deleteSupplier(String supp_id) throws Exception;
	
	public Supplier getSearchSupplier(String supp_id) throws Exception;
	
	public void updateSupplier(String supp_id) throws Exception;
}
