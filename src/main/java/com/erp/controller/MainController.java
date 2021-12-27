package com.erp.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.erp.service.AdminService;
import com.erp.service.ProductService;
import com.erp.vo.Product;
import com.erp.vo.Users;

// 연결해주는 메인 컨트롤러
@Controller
public class MainController {
	
	@Inject
	AdminService service;
	@Inject
	ProductService proservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	// 시작 화면(로그인)
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "login";
	}
	
	// main
	@RequestMapping(value ="/main", method = RequestMethod.GET)
	public String main(Model model) {
		return "userMain";
	}
	// 페이지 이동관리(테스트)
	
	// -- user page
	// myPage(마이페이지)
	@RequestMapping(value="/myPage", method = RequestMethod.GET)
	public String userMain(Model model) {
		return "user/myPage";

	}
	// product(제품관리)
	@RequestMapping(value="/product", method = RequestMethod.GET) 
	public String product(Model model) throws Exception{
		
		List<Product> product_List = proservice.getProductList();
		model.addAttribute("product_List",product_List);
		
		return "user/product";
	}
	
	// 제품 이름을 받아와 검색
	@RequestMapping(value="/searchProduct", method = RequestMethod.GET)
	@ResponseBody
	public List<Product> searchProduct(String pro_name) throws Exception{
		
		List<Product> pro_list = proservice.searchProduct(pro_name);
		
		return pro_list;
	}
	
	// clients(고객관리)
	@RequestMapping(value ="/clients", method = RequestMethod.GET)
	public String clients(Model model) {
		return "user/clients";
	}
	// orders(발주관리)
	@RequestMapping(value ="/orders", method = RequestMethod.GET)
	public String orders(Model model) {
		return "user/orders";
	}
	
	// salesList(영업관리)
	@RequestMapping(value ="/salesList", method = RequestMethod.GET)
	public String salesList(Model model) {
		return "user/salesList";
	}
	// supplier (공급처)	
	@RequestMapping(value ="/supplier", method = RequestMethod.GET)
	public String supplier(Model model) {
		return "user/supplier";
	}
	// accounting (회계)	
	@RequestMapping(value ="/accounting", method = RequestMethod.GET)
	public String accounting(Model model) {
		return "user/accounting";
	}
	
	// -- 액션시 기능들
	// url -- loginAction일 경우
	@RequestMapping(value = "/loginAction", method = RequestMethod.POST)
	public String loginAction(Users users, HttpSession session, RedirectAttributes ra) throws Exception {
		
		Users result = service.loginAction(users);
		String url = null;
		
		// user 값이 null 이면 로그인 안됌
		if(result == null) {

			ra.addFlashAttribute("msg", "로그인 정보가 일치하지 않습니다. ");
			url = "redirect:/";
			
		}
		
		// user user_num이 admin(관리자계정)	 이면 관리자 페이지로 로그인 후 이동
		else if(result.getUser_num().equals("admin")) {
			session.setAttribute("user", users);
			url = "redirect:/admin/department";
		}
		
		// user 의 dept_num에 부서코드가 있으면 로그인 후 유저 페이지르 이동
		else {
			session.setAttribute("user", users);
			url = "redirect:/clients";
		}
		
		return url;
	}
	
	// url -- logout일 경우
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		
		// 세션 지우기
		session.invalidate();
		
		return "redirect:/";
	}

}