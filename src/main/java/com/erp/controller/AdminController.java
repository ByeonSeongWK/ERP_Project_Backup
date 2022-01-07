package com.erp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.erp.service.AdminService;
import com.erp.vo.Department;
import com.erp.vo.Users;

// (admin) 관리자 컨트롤러
@Controller
@RequestMapping(value="/admin/*")
public class AdminController {
	
	@Inject
	AdminService service;

	// -- admin page
	// adminMain(관리자 메인)
	@RequestMapping(value ="/adminMain", method = RequestMethod.GET)
	public String main(Model model) {
		return "admin/adminMain";
	}
	
	
	// add_employee(사원추가)
	@RequestMapping(value ="/add_employee", method = RequestMethod.GET)
	public String add_employee(Model model) throws Exception {
		
		List<Department> dept_list = service.getDeptList();
		model.addAttribute("dept_list", dept_list);
		
		return "admin/add_employee";
	}

	
	// department(부서 관리)
	@RequestMapping(value ="/department", method = RequestMethod.GET)
	public String department(Model model) throws Exception {
		
		List<Department> dept_list = service.getDeptList();
		model.addAttribute("dept_list", dept_list);
		
		return "admin/department";
	}
	
	
	// correct_auth(부서 	권한부여)
	@RequestMapping(value ="/correct_auth", method = RequestMethod.GET)
	public String correct_auth(Model model) throws Exception {
		
		List<Department> dept_list = service.getDeptList();
		model.addAttribute("dept_list", dept_list);
		
		return "admin/correct_auth";
	}
	
	
	// 사원등록할때 사원번호, 부서 정보 불러오기
	@RequestMapping(value = "/getUserNumCnt", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> getUserNumCnt(String dept_num) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		
		Department department = service.getDepartment(dept_num);
		String user_num = service.makeUser_num(dept_num);
	
		map.put("user_num", user_num);
		map.put("dept_num", department.getDept_num());
		map.put("dept_name", department.getDept_name());
		
		return map;
	}
	
	// employee(사원관리)
	@RequestMapping(value ="/employee", method = RequestMethod.GET)
	public String employee(Model model) throws Exception {
		
		List<Users> user_list = service.getUsersList();
		model.addAttribute("user_list", user_list);
		
		return "admin/employee";
	}

	
	// searchName(사원검색)
	@RequestMapping(value ="/searchName", method = RequestMethod.GET)
	@ResponseBody						//뷰에서 받아 오는 값
	// 리스폰스 바디를 추가해주면 결과물을 페이지에서 바로 	보여줌 
	public List<Users> searchName(String user_name) throws Exception {
		
		List<Users> list = service.searchName(user_name);
		
		return list;
	}
	

	// url -- joinAction 일 경우
	@RequestMapping(value = "/joinAction", method = RequestMethod.POST)
	public String joinAction(Users users, String addr1, String addr2, String addr3) throws Exception {
		
		users.setUser_addr(addr1 + " " + addr2 + " " + addr3);
		
		service.joinAction(users);
		
		
		
		return "redirect:/admin/employee";
	}

	
	// department
	@RequestMapping(value = "/getDepartment", method = RequestMethod.POST)
	@ResponseBody
	// 리스트 전체를 다 긁어와야지 동시간대 동시작업에 문제가 안생긴다.	
	public Department getDepartment(String dept_num) throws Exception {
		
		return service.getDepartment(dept_num);
		
	}
	
	@RequestMapping(value = "/addDeptAction", method = RequestMethod.POST)
	@ResponseBody
	public List<Department> addDeptAction(Department department) throws Exception {
		
		service.addDeptAction(department);
		
		return service.getDeptList();
	}
	
	@RequestMapping(value = "/updateDeptAction", method = RequestMethod.POST)
	@ResponseBody
	public List<Department> updateDeptAction(Department department) throws Exception {
		
		service.UpdateDeptAction(department);
		
		return service.getDeptList();
	}
	
	@RequestMapping(value = "/deleteDeptAction", method = RequestMethod.POST) 
	@ResponseBody
	public List<Department> deleteDeptAction(Department department) throws Exception {
		
		service.DeleteDeptAction(department);
		
		return service.getDeptList();
	}
	
	@RequestMapping(value = "/searchDeptAction", method = RequestMethod.POST)
	@ResponseBody
	public List<Department> searchDeptAction(String dept_name) throws Exception {
		
		List<Department> list = service.searchDeptAction(dept_name);
		
		return list;  
	}
	
	
	
	@RequestMapping(value = "/searchAuthTable", method = RequestMethod.POST)
	public List<Department> searchAuthTable(Model model) throws Exception {
		
		List<Department> dept_list = service.getDeptList();
		model.addAttribute("dept_list", dept_list);
		
		return dept_list;
	}
	
	
	@RequestMapping(value = "/auth_update", method = RequestMethod.POST)
	@ResponseBody
	public String auth_update(Department department) {
		
		// 0 : 성공
		String result = "0";
		
		try {
			
			service.auth_updateAction(department);
			
		} catch(Exception e) {
			e.printStackTrace();
			// 1 : 실패
			result = "1";
			
		}
		
		return result;
	}
}
