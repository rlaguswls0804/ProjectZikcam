//package zikcam.product.product;
//
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//
//@Controller
//@RequestMapping("/prod")
//public class ProductController {
//	
//	@Resource(name="productService")
//	private ProductService productService;
//	
//	Logger log = Logger.getLogger(this.getClass());
//	
//	//purchase
//	@RequestMapping(value="/main", method = RequestMethod.GET)
//	public String main(Model model) {
//		return "/main";
//	}
//	
//	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
//	public String productDetail(Model model) {
//		return "/productDetail";
//	}
//	
//}
//
//
package zikcam.product.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/prod")
public class ProductController {
	
	@Resource(name="productService")
	private ProductService productService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//purchase
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String main(Model model, HttpServletRequest request) {
		Map<String, Object> params = new HashMap<>();
		HttpSession session = request.getSession();
		
		params.put("category", "");
		session.setAttribute("purchaseCategory", params.get("category"));
		
		session.removeAttribute("start_date");
		session.removeAttribute("purchaseCategory");
		return "/main";
	}
	
	// 구매상품 상세보기
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public ModelAndView productDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/productDetail");
		
		System.out.println("prod detail : " + commandMap.getMap());
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		 
		Map<String,Object> map = productService.selectProductDetail(commandMap.getMap());

		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		mv.addObject("map", map.get("map"));

		
		/*
		 * Map<String, Object> list = productService.selectProductInform(test);
		 * List<Map<String, Object>> list2 = productService.selectProductReview(test);
		 * List<Map<String, Object>> list3 = productService.selectProductQuestion(test);
		 */
		
		System.out.println("prod detail : " + commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value="/productDetail2", method = RequestMethod.GET)
	public ModelAndView productDetail2(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/productDetail2");
		
		System.out.println("prod detail : " + commandMap.getMap());
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		 
		Map<String,Object> map = productService.selectProductDetail2(commandMap.getMap());

		 
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		mv.addObject("map", map.get("map"));

		
		/*
		 * Map<String, Object> list = productService.selectProductInform(test);
		 * List<Map<String, Object>> list2 = productService.selectProductReview(test);
		 * List<Map<String, Object>> list3 = productService.selectProductQuestion(test);
		 */
		
		System.out.println("prod detail : " + commandMap.getMap());
		
		return mv;
	}
	
	
	 
	@RequestMapping(value="/prodQR", method = RequestMethod.GET)
	public ModelAndView QRList(CommandMap commandMap, 
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		request.setAttribute("sortType", sortType);
		System.out.println("sortType : " + sortType + "commandMap : " + commandMap.getMap());
		List<Map<String, Object>> list;
		
		if(sortType.equals("PQ") || sortType.equals("pq")) {
			list = productService.selectProductQuestion(commandMap.getMap());
		}else {
			list = productService.selectProductReview(commandMap.getMap());
		}	
		mv.addObject("list", list);
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		}
		
		
		
		mv.addObject("list", list);
		
		
		return mv;
	}
	
	@RequestMapping(value="/writeProdQR", method = RequestMethod.GET)
	public ModelAndView writeProdQR(CommandMap commandMap,
			@RequestParam(value="sortType", defaultValue="") String sortType,
			@RequestParam(value="PROD_NUM", defaultValue="") String PROD_NUM,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/writeProdQR");
		
		HttpSession session = request.getSession();
		request.setAttribute("sortType", sortType);
		request.setAttribute("PROD_NUM", PROD_NUM);
		request.setAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		return mv;
	}
	  
	@RequestMapping(value="/insertQR")
	public ModelAndView insertQR(CommandMap commandMap,
			@RequestParam(value="sortType", defaultValue="") String sortType,
			HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/prod/productDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		System.out.println(commandMap.getMap());
		request.setAttribute("sortType", sortType);
		
		if(sortType.equals("PQ")) {
			productService.insertProductQuestion(commandMap.getMap());
		}else {
			productService.insertReview(commandMap.getMap());
		}
		
		
		
		return mv;
	}
	
	
	@RequestMapping(value="/insertCart", method = RequestMethod.GET)
	public ModelAndView insertCart(CommandMap commandMap, Model model, 
			@RequestParam(value="PROD_NUM", defaultValue="") String PROD_NUM,
			@RequestParam(value="PROD_COUNT", defaultValue="") String PROD_COUNT, 
			@RequestParam(value="CART_RENTAL", defaultValue="") String CART_RENTAL,
			@RequestParam(value="start_date", defaultValue="") String start_date,
			@RequestParam(value="end_date", defaultValue="") String end_date,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/myPage/myCartList");
		
		Map<String, Object> map = productService.selectCart(commandMap.getMap());
		 
		HttpSession session = request.getSession();
		if(session.getAttribute("start_date") == null) {
			session.setAttribute("start_date", start_date);
			session.setAttribute("end_date", end_date);
		}
		
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("PROD_NUM", PROD_NUM);
		commandMap.put("PROD_COUNT", PROD_COUNT);
		commandMap.put("CART_RENTAL", CART_RENTAL);
		commandMap.put("start_date", session.getAttribute("start_date"));
		commandMap.put("end_date", session.getAttribute("end_date")); 
		
		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		mv.addObject("PROD_COUNT", commandMap.get("PROD_COUNT"));
		mv.addObject("CART_RENTAL", commandMap.get("CART_RENTAL"));
		mv.addObject("start_date", start_date);
		mv.addObject("end_date", end_date);
		
		if (map == null) {
			productService.insertCart(commandMap.getMap());
		}
		else {
			productService.updateCart(commandMap.getMap());
		}
		
		System.out.println(commandMap.getMap());
		System.out.println(mv);
		
		return mv;
	} 
	
	@RequestMapping(value="/purchaseTent", method = RequestMethod.GET)
	public String purchaseTent(
			@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			Model model, CommandMap commandMap, HttpServletRequest request) {
		Map<String, Object> params = new HashMap<>();
		
		HttpSession session = request.getSession();
		session.removeAttribute("purchaseCategory");
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		 
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		
		
//		System.out.println("sort : " + sort);
		
		params.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		params.put("category", "텐트/타프");
		params.put("sort", sort);
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		List<Map<String, Object>> mainProductList = productService.mainProductList(params);
		model.addAttribute("mainProductList", mainProductList);
		List<Map<String, Object>> allProductList = productService.allProductList(params, keyword, searchType);
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String, Object>> oneProductList = productService.oneProductList(params);
		model.addAttribute("oneProductList", oneProductList);
		 
		
		session.setAttribute("purchaseCategory", params.get("category"));
		
		System.out.println(session.getAttribute("purchaseCategory"));
		System.out.println(commandMap.getMap());
		System.out.println(params);
		
		return "/purchaseTent";
	}
	
	@RequestMapping(value="/purchaseMatt", method = RequestMethod.GET)
	public String purchaseMatt(@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			Model model, CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("purchaseCategory");
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		Map<String, Object> params = new HashMap<>();
		params.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		params.put("category", "매트/침낭");
		params.put("sort", sort);
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		List<Map<String, Object>> mainProductList = productService.mainProductList(params);
		model.addAttribute("mainProductList", mainProductList);
		List<Map<String, Object>> allProductList = productService.allProductList(params, keyword, searchType);
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String, Object>> oneProductList = productService.oneProductList(params);
		model.addAttribute("oneProductList", oneProductList);
		
		 
		
		session.setAttribute("purchaseCategory", params.get("category"));
		
		System.out.println(session.getAttribute("purchaseCategory"));
		System.out.println(commandMap.getMap());
		System.out.println(params);
		
		return "/purchaseMatt";
	}
	
	@RequestMapping(value="/purchaseTable", method = RequestMethod.GET)
	public String purchaseTable(@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			Model model, CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("purchaseCategory");
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		Map<String, Object> params = new HashMap<>();
		params.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		params.put("category", "테이블/체어");
		params.put("sort", sort);
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		List<Map<String, Object>> mainProductList = productService.mainProductList(params);
		model.addAttribute("mainProductList", mainProductList);
		List<Map<String, Object>> allProductList = productService.allProductList(params, keyword, searchType);
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String, Object>> oneProductList = productService.oneProductList(params);
		model.addAttribute("oneProductList", oneProductList);
		
		
		
		session.setAttribute("purchaseCategory", params.get("category"));
		
		System.out.println(session.getAttribute("purchaseCategory"));
		System.out.println(commandMap.getMap());
		System.out.println(params);
		
		return "/purchaseTable";
	} 
	
	@RequestMapping(value="/purchaseEtc", method = RequestMethod.GET)
	public String purchaseEtc(@RequestParam(value="sort", required=false) String sort,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			Model model, CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.removeAttribute("purchaseCategory");
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		
		Map<String, Object> params = new HashMap<>();
		params.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		params.put("category", "기타");
		params.put("sort", sort);
		params.put("searchType", searchType);
		params.put("keyword", keyword);
		
		List<Map<String, Object>> mainProductList = productService.mainProductList(params);
		model.addAttribute("mainProductList", mainProductList);
		List<Map<String, Object>> allProductList = productService.allProductList(params, keyword, searchType);
		model.addAttribute("allProductList", allProductList);
		model.addAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		List<Map<String, Object>> oneProductList = productService.oneProductList(params);
		model.addAttribute("oneProductList", oneProductList);
		
		
		session.setAttribute("purchaseCategory", params.get("category"));
		
		System.out.println(session.getAttribute("purchaseCategory"));
		System.out.println(commandMap.getMap());
		System.out.println(params);
		
		return "/purchaseEtc";
	}
	
	@RequestMapping(value="/insertWish2", method = RequestMethod.GET)
	public ModelAndView insertWish2(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/prod/productDetail2");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		productService.insertWish2(commandMap.getMap(), request);
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		return mv;
	}
	
	
	@RequestMapping(value="/deleteWish2", method = RequestMethod.GET)
	public ModelAndView deleteWish2(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/prod/productDetail2");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		productService.deleteWish2(commandMap.getMap());
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		return mv;
	} 
}