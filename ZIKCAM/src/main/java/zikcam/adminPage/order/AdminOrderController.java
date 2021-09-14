package zikcam.adminPage.order;

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
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
	
	@Resource(name="adminOrderService")
	private AdminOrderService adminOrderService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//order
	
	@RequestMapping(value="/orderList")
	public ModelAndView orderList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request)throws Exception {
		
		HttpSession session = request.getSession();
		Object rank = session.getAttribute("session_MEM_RANK");
		int sessionRank = Integer.parseInt(String.valueOf(rank));
		
		ModelAndView mv;
		
		if(sessionRank == 0) {
			mv = new ModelAndView("/orderList");
			
			commandMap.put("MEMBER_RANK", session.getAttribute("session_MEM_RANK"));
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
			request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword);
		}else{
			mv = new ModelAndView("/errorPage");
		}
		return mv;
	}
	
	@RequestMapping(value="/selectOrderList") 
	public ModelAndView selectOrderList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		List<Map<String,Object>> list = adminOrderService.adOrderList(commandMap.getMap(), keyword, searchType); 
		mv.addObject("list", list); 
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}
	
	@RequestMapping(value="/orderCancelList")
	public ModelAndView orderCalcelList(Map<String, Object> commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request)throws Exception {
		
		HttpSession session = request.getSession();
		Object rank = session.getAttribute("session_MEM_RANK");
		int sessionRank = Integer.parseInt(String.valueOf(rank));
		ModelAndView mv;
		 
		if(sessionRank == 0) {
			mv = new ModelAndView("/orderCancelList");
			
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
			request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword);
			request.setAttribute("sortType", sortType);
			request.setAttribute("formSortType", formSortType);
			
		}else {
			mv = new ModelAndView("/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping(value="/selectCancelList") 
	public ModelAndView selectCancelList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		request.setAttribute("formSortType", formSortType);
		
		List<Map<String,Object>> list = adminOrderService.adCancelList(commandMap.getMap(), keyword, searchType, sortType, formSortType); 
		mv.addObject("list", list); 
		mv.addObject("sortType", sortType);
		mv.addObject("formSortType", formSortType);
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}
	
	@RequestMapping(value="/orderDetail")
	public ModelAndView orderDetail(CommandMap commandMap, HttpServletRequest request)throws Exception {
		ModelAndView mv = new ModelAndView("/orderDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = adminOrderService.adOrderDetailList(commandMap.getMap());
		Map<String, Object> map = adminOrderService.adOrderDetail(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("list", list);
		return mv;
	}
	
	@RequestMapping(value = "/CSModify")
	public ModelAndView orderCSModify(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/orderCancelList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminOrderService.adCSModify(commandMap.getMap());
		return mv;
	}
	
}
