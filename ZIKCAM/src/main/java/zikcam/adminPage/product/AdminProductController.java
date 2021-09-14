package zikcam.adminPage.product;

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

import zikcam.adminPage.order.AdminOrderService;
import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	
	@Resource(name="adminProductService")
	private AdminProductService adminProductService;

	Logger log = Logger.getLogger(this.getClass());
	
	//product
	
	@RequestMapping(value="/productList")
	public ModelAndView productList(CommandMap commandMap,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			HttpServletRequest request)throws Exception {
		System.out.println(commandMap.getMap());
		
		HttpSession session = request.getSession();
		Object rank = session.getAttribute("session_MEM_RANK");
		System.out.println(rank);
		int sessionRank = Integer.parseInt(String.valueOf(rank));
		ModelAndView mv;
		
		if(sessionRank == 0) {
			mv = new ModelAndView("/productList");
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
			request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword); 
		}else {
			mv = new ModelAndView("/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/selectProductList") 
	public ModelAndView selectProductList(CommandMap commandMap,
			@RequestParam(value="keyword", defaultValue="") String keyword,
			@RequestParam(value="searchType", defaultValue="") String searchType,
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		
		List<Map<String,Object>> list = adminProductService.adProductList(commandMap.getMap(), keyword, searchType); 
		mv.addObject("list", list); 
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}

	
	
	@RequestMapping(value="/productModify", method=RequestMethod.GET)
	public ModelAndView productModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/productList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminProductService.updateProduct(commandMap.getMap(), request);
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		 
		return mv;
	}
	
	@RequestMapping(value="/productUpdate", method = RequestMethod.GET) 
	public ModelAndView productUpdate(CommandMap commandMap, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("/productModify");
		 
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = adminProductService.adProductModify(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		
		
		
		return mv;
	} 
	 
	@RequestMapping(value="/productWrite")
	public ModelAndView productWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/productList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminProductService.insertProduct(commandMap.getMap(), request);
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value="/openProductWrite")
	public ModelAndView openProductWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		Object rank = session.getAttribute("session_MEM_RANK");
		int sessionRank = Integer.parseInt(String.valueOf(rank));
		ModelAndView mv;
		
		if(sessionRank == 0) {
			mv = new ModelAndView("/productWrite");
			
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		}else {
			mv = new ModelAndView("/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/productDelete", method = RequestMethod.GET)
	public ModelAndView productDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/admin/productList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminProductService.deleteProduct(commandMap.getMap());
		
		return mv;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/productTable", method = RequestMethod.GET)
	public ModelAndView productTable(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/productTable");
		
		adminProductService.insertProduct(commandMap.getMap(), request);
		
		return mv;
	}
}
