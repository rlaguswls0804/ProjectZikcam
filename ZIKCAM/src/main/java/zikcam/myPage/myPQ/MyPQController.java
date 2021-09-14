package zikcam.myPage.myPQ;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;
import zikcam.myPage.myPQ.MyPQService;

@Controller
@RequestMapping("/myPage")
public class MyPQController {
	
	@Resource(name="myPQService")
	private MyPQService myPQService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	//myPQ
	@RequestMapping(value = "/myPQList", method = RequestMethod.GET)
	public ModelAndView myPQList(CommandMap commandMap, 
			@RequestParam(value="list", defaultValue="") String list, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value ="keyword", defaultValue="") String keyword,
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myPQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("list", list);
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchType", searchType);
		request.setAttribute("sortType", sortType);	
		request.setAttribute("formSortType", formSortType);	
		
		return mv;
	}
	
	@RequestMapping(value = "/selectMyPQList", method = RequestMethod.GET)
	public ModelAndView selectMyPQList(CommandMap commandMap, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value ="keyword", defaultValue="") String keyword,
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchType", searchType);
		request.setAttribute("sortType", sortType);
		request.setAttribute("formSortType", formSortType);
		if(sortType.isEmpty()) {
			sortType = formSortType;
		}else if(formSortType.isEmpty()) {
			formSortType = sortType;
		}
		
		List<Map<String, Object>> list;
		
		if(sortType.equals("PQ") || sortType.isEmpty()) {
			list = myPQService.selectMyPQList(commandMap.getMap(), keyword, searchType);
		}else {
			list = myPQService.selectQNAList(commandMap.getMap(), keyword, searchType);
		}	
		mv.addObject("list", list);
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		}
		
		System.out.println("keyword : " + keyword + "\n searchType : " + searchType + "\n sortType : " + sortType + "\n formSortType : " + formSortType);
		System.out.println(commandMap.getMap());
		
		return mv;
	}
	
	@RequestMapping(value = "/myPQDetail")
	public ModelAndView myPQDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPQDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = myPQService.selectPQDetail(commandMap.getMap());
		Map<String, Object> map = myPQService.selectPQModifyForm(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/myPQModifyForm")
	public ModelAndView myPQModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPQModifyForm");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = myPQService.selectPQDetail(commandMap.getMap());
		Map<String, Object> map = myPQService.selectPQModifyForm(commandMap.getMap());
		
		System.out.println(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/myPQModify")
	public ModelAndView myPQModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myPQDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myPQService.updatePQ(commandMap.getMap());
		mv.addObject("PQ_NUM", commandMap.get("PQ_NUM"));
		
		return mv;
	}
	@RequestMapping(value = "/myPQDelete")
	public ModelAndView myPQDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myPQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myPQService.deletePQ(commandMap.getMap());
		
		return mv;
	}
	
//	QNA
	@RequestMapping(value = "/myQNADetail")
	public ModelAndView myQNADetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPQDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = myPQService.selectQNADetail(commandMap.getMap());
		Map<String, Object> map = myPQService.selectQNAModifyForm(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/myQNAModifyForm")
	public ModelAndView myQNAModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myPQModifyForm");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		
		List<Map<String, Object>> list = myPQService.selectQNADetail(commandMap.getMap());
		Map<String, Object> map = myPQService.selectQNAModifyForm(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/myQNAModify")
	public ModelAndView myQNAModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myQNADetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myPQService.updateQNA(commandMap.getMap());
		mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		
		return mv;
	}
	@RequestMapping(value = "/myQNADelete")
	public ModelAndView myQNADelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myPQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myPQService.deleteQNA(commandMap.getMap());
		
		return mv;
	}
	
}
