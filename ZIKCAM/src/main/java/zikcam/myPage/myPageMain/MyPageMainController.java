package zikcam.myPage.myPageMain;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import zikcam.myPage.myPageMain.MyPageMainService;

@Controller
@RequestMapping("/myPage")
public class MyPageMainController {
	
	@Resource(name="myPageMainService")
	private MyPageMainService myPageMainService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//main
	@RequestMapping(value = "/myPageList")
	public ModelAndView openmyAccount(Map<String, Object> commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/myPageList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("RENTAL_START", session.getAttribute("session_RENTAL_START"));
		commandMap.put("RENTAL_START", session.getAttribute("session_RENTAL_END"));
		

		List<Map<String, Object>> orderlist = myPageMainService.selectOrderList(commandMap);
		List<Map<String, Object>> reviewlist = myPageMainService.selectReviewList(commandMap);
		List<Map<String, Object>> pqlist = myPageMainService.selectPQList(commandMap);
		List<Map<String, Object>> cartlist = myPageMainService.selectCartList(commandMap);
		
		mv.addObject("orderlist", orderlist);
		mv.addObject("reviewlist", reviewlist);
		mv.addObject("pqlist", pqlist);
		mv.addObject("cartlist", cartlist);
		
		System.out.println("session : " + commandMap);
		
		return mv;
	}
}
