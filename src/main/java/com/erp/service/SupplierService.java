package com.erp.service;

import java.util.List;

import com.erp.vo.Supplier;

// user 공급처
public interface SupplierService {
	
	public List<Supplier> getSupplierList() throws Exception;
	
	public List<Supplier> searchSupplier(String supp_name) throws Exception;
	
	public void addSupplierAction(Supplier supplier) throws Exception;
	
	public String searchSupplier_id(String supp_id) throws Exception;
	
	public void deleteSupplier(List<String> supp_id) throws Exception;
	
	public Supplier getSearchSupplier(String supp_id) throws Exception;
	
	public void updateSupplier(String supp_id) throws Exception; 

}
