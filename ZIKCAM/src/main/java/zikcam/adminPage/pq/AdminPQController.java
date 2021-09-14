package zikcam.adminPage.pq;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;
import zikcam.adminPage.pq.*;

@Controller
@RequestMapping("/admin")
public class AdminPQController {

	@Resource(name = "adminPQService")
	private AdminPQService adminPQService;

	Logger log = Logger.getLogger(this.getClass());

	// PQ

	@RequestMapping(value = "/PQList")
	public ModelAndView PQList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		Object rank = session.getAttribute("session_MEM_RANK");
		int sessionRank = Integer.parseInt(String.valueOf(rank));
		ModelAndView mv;
		
		if(sessionRank == 0) {
			mv = new ModelAndView("/PQList");
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
			request.setAttribute("searchType", searchType);
			request.setAttribute("keyword", keyword);
		}else {
			mv = new ModelAndView("/errorPage");
		}
		return mv;
		
	}
	
	@RequestMapping(value="/selectPQList") 
	public ModelAndView selectPQList(CommandMap commandMap, 
			@RequestParam(value="keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType, 
			HttpServletRequest request) throws Exception{ 
		ModelAndView mv = new ModelAndView("jsonView"); 
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		
		List<Map<String,Object>> list = adminPQService.adPQList(commandMap.getMap(), keyword, searchType); 
		mv.addObject("list", list); 
		
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
		} else{ 
			mv.addObject("TOTAL", 0); 
		} 
		return mv; 
	}

	@RequestMapping(value = "/PQDetail")
	public ModelAndView PQDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/PQDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = adminPQService.adPQDetail(commandMap.getMap());
		Map<String, Object> sub = adminPQService.adPQSubDetail(commandMap.getMap());
		mv.addObject("map", map);
		mv.addObject("sub", sub);
		return mv;
	}

	@RequestMapping(value = "/PQReply")
	public ModelAndView insertReply(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/PQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminPQService.adPQReplyWrite(commandMap.getMap());
		adminPQService.adPQSwitch(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/PQModifyForm")
	public ModelAndView PQModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/PQModifyForm");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = adminPQService.adPQDetail(commandMap.getMap());
		mv.addObject("map", map);
		return mv;
	}
	
	@RequestMapping(value = "/PQModify")
	public ModelAndView updateReply(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/PQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminPQService.adPQReplyUpdate(commandMap.getMap());
		System.out.println(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/PQDelete")
	public ModelAndView deletePQ(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/PQList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		adminPQService.adPQDelete(commandMap.getMap());
		System.out.println(commandMap.getMap());
		return mv;
	}

}
