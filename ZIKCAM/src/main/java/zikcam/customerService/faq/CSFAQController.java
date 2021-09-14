package zikcam.customerService.faq;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/cs")
public class CSFAQController {


	@Resource(name="csFAQService")
	private CSFAQService csFAQService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	
	//faq
	
	//ORIGIN_LIST
	/* @RequestMapping(value="/faqList", method = RequestMethod.GET) 
	public ModelAndView faqList(CommandMap commandMap) throws Exception{ 
		ModelAndView mv = new ModelAndView("/faqList");
	  
		List<Map<String, Object>> faqList = csFAQService.selectFaqList(commandMap.getMap());
		mv.addObject("faqList", faqList);
		
		System.out.println(faqList);
		
		return mv; 
		
	}*/
	@RequestMapping(value = "/faqList", method = RequestMethod.GET)
	public ModelAndView faqList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value="sortType", defaultValue="deli") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/faqList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));

		List<Map<String, Object>> faqList = csFAQService.selectFaqList(commandMap.getMap(), keyword, searchType, sortType);
		mv.addObject("sortType", sortType);
		mv.addObject("faqList", faqList);
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		
		return mv;
	}
	
	
	 
	@RequestMapping(value="/selectFaqList", method = RequestMethod.GET) 
	public ModelAndView selectFaqList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="deli") String sortType, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		
		List<Map<String, Object>> faqList = csFAQService.selectFaqList(commandMap.getMap(), keyword, searchType, sortType);
		mv.addObject("sortType", sortType);
		mv.addObject("faqList", faqList);
		
		System.out.println("검색어: " + keyword); 
		System.out.println("검색타입: " + searchType);
		System.out.println("카테고리: "+sortType);
		System.out.println(commandMap.getMap());
		
		 if(faqList.size() > 0) {
			 mv.addObject("TOTAL", faqList.get(0).get("TOTAL_COUNT"));
		 }else {
			 mv.addObject("TOTAL", 0); 
		 }
		
		return mv; 
		
	}
	
	@RequestMapping(value="/faqWrite", method = RequestMethod.GET)
	public ModelAndView faqWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/cs/faqList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csFAQService.insertFaq(commandMap.getMap(), request);
		
		return mv;
	}
	
	
	  @RequestMapping(value="/openFaqWrite", method = RequestMethod.GET) 
	  public ModelAndView openFaqWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/faqWrite");
		  
		  HttpSession session = request.getSession();
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
	  
		  return mv; 
	  }
	 
	
	@RequestMapping(value="/faqModify", method = RequestMethod.GET)
	public ModelAndView faqModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/cs/faqList"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csFAQService.updateFaq(commandMap.getMap());
		
		mv.addObject("FAQ_NUM", commandMap.get("FAQ_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value="/openFaqUpdate") 
	public ModelAndView openFaqUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("/faqModify");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = csFAQService.selectFaqDetail(commandMap.getMap());
		
		mv.addObject("map", map);
		
		return mv;
	}

	
	@RequestMapping(value="/faqDelete", method = RequestMethod.GET)
	public ModelAndView faqDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/cs/faqList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csFAQService.deleteFaq(commandMap.getMap());
		
		return mv;

	}
	
}