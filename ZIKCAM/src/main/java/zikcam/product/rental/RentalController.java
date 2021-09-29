package zikcam.product.rental;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
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
import zikcam.common.util.CommonUtils;

@Controller
@RequestMapping("/prod")
public class RentalController {
	
	@Resource(name="rentalService")
	private RentalService rentalService;
	
	CommonUtils commonUtils = new CommonUtils();
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	//rental
	@RequestMapping(value="/rentalDate", method = RequestMethod.GET)
	public ModelAndView rentalDate(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/rentalDate");
		
		Date date = new Date();
		
		String start_date = (String)request.getParameter("start_date");
		String end_date = (String)request.getParameter("end_date");
		
		HttpSession session = request.getSession();
		session.setAttribute("start_date", start_date);
		session.setAttribute("end_date", end_date);
		
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("start_date", session.getAttribute("start_date"));
		commandMap.put("end_date", session.getAttribute("end_date"));
		
		System.out.println(commandMap.getMap());
		System.out.println(session.getAttribute("start_date"));
		
		return mv;
	}
	
	@RequestMapping(value="/rentalList", method = RequestMethod.GET)
	public ModelAndView rentalList(CommandMap commandMap,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/rentalList");
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		request.setAttribute("sortType", sortType);
		
		return mv;
	}
	@RequestMapping(value="/selectRentalList", method = RequestMethod.GET)
	public ModelAndView selectRentalList(CommandMap commandMap,
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType,
			@RequestParam(value="sortType2", defaultValue="") String sortType2,
			@RequestParam(value="start_date", defaultValue="") String start_date,
			@RequestParam(value="end_date", defaultValue="") String end_date, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		
		HttpSession session = request.getSession();
		session.setAttribute("start_date", start_date);
		session.setAttribute("end_date", end_date);
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("start_date", session.getAttribute("start_date"));
		commandMap.put("end_date", session.getAttribute("end_date"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		request.setAttribute("sortType", sortType);
		request.setAttribute("sortType2", sortType2);
		request.setAttribute("start_date", start_date);
		request.setAttribute("end_date", end_date);
		
		/* Cookie setCookie = new Cookie("cookie_start_date", (String) commandMap.get("start_date"));
		Cookie setCookie2 = new Cookie("cookie_end_date", (String) commandMap.get("end_date")); 
		
		commandMap.put("cookie_start_date", session.getAttribute("cookie_start_date"));
		commandMap.put("cookie_end_date", session.getAttribute("cookie_end_date")); */
		
		List<Map<String, Object>> rentalList = 
				rentalService.selectRentalList(commandMap.getMap(), keyword, searchType, sortType, sortType2);
		request.setAttribute("rentalList", rentalList);
		
		
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("sortType", sortType);
		mv.addObject("sortType2", sortType2);
		mv.addObject("start_date", start_date);
		mv.addObject("end_date", end_date);
		mv.addObject("rentalList", rentalList);
		
		Map<String, Object> wishDetail = 
				rentalService.selectWishDetail(commandMap.getMap());
		request.setAttribute("wishDetail", wishDetail);
		mv.addObject("wishDetail", wishDetail);
		
		System.out.println("검색어: " + keyword); 
		System.out.println("검색타입: " + searchType); 
		System.out.println("정렬: " + sortType);
		System.out.println("카테고리: " + sortType2);
		System.out.println("시작날짜: " + start_date);
		System.out.println("종료날짜: " + end_date);
		System.out.println(commandMap.getMap());
		
		commonUtils.printMap(commandMap.getMap());
		
		if(rentalList.size() > 0) {
			mv.addObject("TOTAL", rentalList.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
	
	
	@RequestMapping(value="/rentalDetail", method = RequestMethod.GET) 
	public ModelAndView productDetail(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		ModelAndView mv = new ModelAndView("redirect:/prod/rentalDetail2");
		 
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = rentalService.selectRentalDetail(commandMap.getMap());
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		mv.addObject("map", map.get("map"));
		
		System.out.println(commandMap.getMap());
		System.out.println(map.get("map"));
		
		return mv;
	} 
	
	
	@RequestMapping(value="/rentalDetail2", method = RequestMethod.GET) 
	public ModelAndView productDetail2(CommandMap commandMap, HttpServletRequest request) throws Exception { 
		ModelAndView mv = new ModelAndView("/rentalDetail2");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = rentalService.selectRentalDetail2(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		
		System.out.println(commandMap.getMap());
		System.out.println(map.get("map"));
		
		return mv;
	
	}
	 
	@RequestMapping(value="/insertWish", method = RequestMethod.GET)
	public ModelAndView insertWish(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/prod/rentalDetail2");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		rentalService.insertWish(commandMap.getMap(), request);
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		return mv;
	}
	
	
	@RequestMapping(value="/deleteWish", method = RequestMethod.GET)
	public ModelAndView deleteWish(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/prod/rentalDetail2");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		rentalService.deleteWish(commandMap.getMap());
		
		mv.addObject("PROD_NUM", commandMap.get("PROD_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value = "/deleteSession") // 구매하기로 전환
	public ModelAndView deleteSession(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HttpSession session = request.getSession();
		session.removeAttribute("start_date");
		session.removeAttribute("end_date"); 
 
		mv.setViewName("redirect:/prod/purchaseTent");
		return mv;
	} 
	    
	
	@RequestMapping(value="/rentalMatt", method = RequestMethod.GET)
	public String rentalMatt(Model model) {
		return "/rentalDate";
	}
	
	@RequestMapping(value="/rentalTable", method = RequestMethod.GET)
	public String rentalTable(Model model) {
		return "/rentalDate";
	}
		
	
}
