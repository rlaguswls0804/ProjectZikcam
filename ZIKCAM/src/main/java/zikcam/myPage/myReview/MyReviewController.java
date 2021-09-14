package zikcam.myPage.myReview;

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
import zikcam.myPage.myReview.MyReviewService;

@Controller
@RequestMapping("/myPage")
public class MyReviewController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "myReviewService")
	private MyReviewService myReviewService;

	// myReview\
	@RequestMapping(value = "/myReviewList", method = RequestMethod.GET)
	public ModelAndView myReviewList(CommandMap commandMap,  
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value ="keyword", defaultValue="") String keyword,
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myReviewList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		request.setAttribute("keyword", keyword);
		request.setAttribute("searchType", searchType);
		request.setAttribute("sortType", sortType);
		request.setAttribute("formSortType", formSortType);
		
		System.out.println("list  formSortType : " + formSortType);
		
		return mv;
	}
	
	
	@RequestMapping(value = "/selectMyReviewList")
	public ModelAndView selectMyReviewList(CommandMap commandMap,  
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value ="keyword", defaultValue="") String keyword,
			@RequestParam(value="sortType", defaultValue="") String sortType, 
			@RequestParam(value="formSortType", defaultValue="") String formSortType, 
			HttpServletRequest request) throws Exception {
		
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println("selectReviewList formSortType : "+formSortType);
		
		List<Map<String, Object>> list = myReviewService.selectMyReviewList(commandMap.getMap(), keyword, searchType, sortType, formSortType);
		mv.addObject("sortType", sortType);
		mv.addObject("formSortType", formSortType);
		mv.addObject("searchType", searchType);
		mv.addObject("keyword", keyword);
		mv.addObject("list", list);
		if(list.size() > 0){ 
			mv.addObject("TOTAL", list.get(0).get("TOTAL_COUNT")); 
			} else{ 
				mv.addObject("TOTAL", 0); 
				}
		System.out.println("keyword : " + keyword + " \n searchType : " + searchType + " \n sortType : " + sortType + "\n formSortType : " +formSortType);
		System.out.println(commandMap.getMap());
		return mv;
	}

	@RequestMapping(value = "/myReviewDetail")
	public ModelAndView myReviewDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myReviewDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = myReviewService.selectReviewDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	@RequestMapping(value = "/myReviewModifyForm")
	public ModelAndView myReviewModifyForm(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("/myReviewModifyForm");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Map<String, Object> map = myReviewService.selectReviewDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	@RequestMapping(value = "/myReviewModify")
	public ModelAndView myReviewModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myReviewDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myReviewService.updateReview(commandMap.getMap());
		mv.addObject("REVIEW_NUM", commandMap.get("REVIEW_NUM"));

		return mv;
	}
	
	@RequestMapping(value = "/myReviewDelete")
	public ModelAndView myReviewDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("redirect:/myPage/myReviewList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		myReviewService.updateReview(commandMap.getMap());

		return mv;
	}

}
