package zikcam.customerService.notice;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.annotation.Resource;

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
public class CSNoticeController {

	@Resource(name="csNoticeService")
	private CSNoticeService csNoticeService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//notice
	
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/noticeList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		request.setAttribute("sortType", sortType);
		
		return mv;
	}
	
	@RequestMapping(value="/selectNoticeList", method = RequestMethod.GET)
	public ModelAndView selectNoticeList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			@RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword); 
		request.setAttribute("sortType", sortType);
		 
		
		List<Map<String, Object>> noticeList = 
				csNoticeService.selectNoticeList(commandMap.getMap() , keyword, searchType, sortType );
		mv.addObject("sortType", sortType);
		mv.addObject("noticeList", noticeList);
		
		System.out.println("검색어: " + keyword); 
		System.out.println("검색타입: " + searchType); 
		System.out.println("카테고리: "+sortType);
		System.out.println(commandMap.getMap());
		   
		if(noticeList.size() > 0) {
			mv.addObject("TOTAL", noticeList.get(0).get("TOTAL_COUNT"));
		}else {
			mv.addObject("TOTAL", 0);
		}
		
		return mv;
	}
		
	
	@RequestMapping(value="/noticeDetail", method = RequestMethod.GET)
	public ModelAndView noticeDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/noticeDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = csNoticeService.selectNoticeDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		
		return mv;
	}
	
	@RequestMapping(value="/noticeWrite", method = RequestMethod.GET)
	public ModelAndView noticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/cs/noticeList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csNoticeService.insertNotice(commandMap.getMap(), request);
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));
		
		return mv;
	}
	
	@RequestMapping(value="/openNoticeWrite", method = RequestMethod.GET)
	public ModelAndView openNoticeWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/noticeWrite");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		return mv;
	}
	
	@RequestMapping(value="/noticeModify", method = RequestMethod.GET)
	public ModelAndView noticeModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/cs/noticeDetail"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csNoticeService.updateNotice(commandMap.getMap(), request);
		
		mv.addObject("NOTICE_NUM", commandMap.get("NOTICE_NUM"));
		
		return mv;
	}
	
	
	@RequestMapping(value="/openNoticeUpdate", method = RequestMethod.GET) 
	public ModelAndView openNoticeUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("/noticeModify");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String,Object> map = csNoticeService.selectNoticeDetail(commandMap.getMap());
		
		mv.addObject("map", map.get("map"));
		
		return mv;
	}
	
	
	@RequestMapping(value="/noticeDelete", method = RequestMethod.GET)
	public ModelAndView noticeDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/noticeDelete");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		csNoticeService.deleteNotice(commandMap.getMap());
		
		return mv;
	}
}
