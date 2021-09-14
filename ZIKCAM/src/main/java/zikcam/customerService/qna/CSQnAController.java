package zikcam.customerService.qna;

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
@RequestMapping("/cs")
public class CSQnAController {

	@Resource(name = "csQnAService")
	private CSQnAService csQnAService;

	Logger log = Logger.getLogger(this.getClass());

	// qna

	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/qnaList");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));

		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);
		
		return mv;
	}

	
	
	@RequestMapping(value="/selectQnaList", method = RequestMethod.GET) 
	public ModelAndView selectQnaList(CommandMap commandMap, 
			@RequestParam(value = "keyword", defaultValue="") String keyword, 
			@RequestParam(value="searchType", defaultValue="") String searchType,
			@RequestParam(value="sortType", defaultValue="") String sortType, HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView("jsonView");
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
	  
		request.setAttribute("searchType", searchType);
		request.setAttribute("keyword", keyword);
		request.setAttribute("sortType", sortType);

		  List<Map<String, Object>> qnaList = csQnAService.selectQnaList(commandMap.getMap(), keyword, searchType, sortType);
		  mv.addObject("sortType", sortType);
		  mv.addObject("qnaList", qnaList); 
		  
		  System.out.println("검색어: " + keyword); 
		  System.out.println("검색타입: " + searchType);
		  System.out.println("카테고리: "+sortType);
		  System.out.println(commandMap.getMap());
		  
		  if(qnaList.size() > 0) {
			  mv.addObject("TOTAL", qnaList.get(0).get("TOTAL_COUNT"));
		  }else {
			  mv.addObject("TOTAL", 0); 
		  }
	  
	  return mv; 
	}
	 
	  
	  @RequestMapping(value="/qnaDetail", method = RequestMethod.GET) 
	  public ModelAndView qnaDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/qnaDetail");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  Map<String,Object> boardMap = csQnAService.selectQnaBoardDetail(commandMap.getMap());
			
		  mv.addObject("boardMap", boardMap.get("boardMap"));
		  
		  Map<String,Object> answerMap = csQnAService.selectQnaAnswerDetail(commandMap.getMap());
		  
		  mv.addObject("answerMap", answerMap.get("answerMap"));
		  
		  return mv; 
	  }
	   
	  @RequestMapping(value="/qnaWrite", method = RequestMethod.GET)
	  public ModelAndView qnaWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("redirect:/cs/qnaList");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  csQnAService.insertQnaBoard(commandMap.getMap(), request);
			
		  return mv;
	  }
		
	  @RequestMapping(value="/openQnaWrite", method = RequestMethod.GET)
	  public ModelAndView openBoardWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/qnaWrite");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
	  
		  return mv; 
	  }
	  
	  @RequestMapping(value="/qnaReplyWrite", method = RequestMethod.GET)
	  public ModelAndView qnaReplyWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
			ModelAndView mv = new ModelAndView("redirect:/cs/qnaDetail");
			
			HttpSession session = request.getSession();
			commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
			csQnAService.insertQnaAnswer(commandMap.getMap(), request);
			 
			csQnAService.updateQnaReply(commandMap.getMap(), request);
			mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
			return mv;
	  }
	  
	  @RequestMapping(value="/openQnaReplyWrite", method = RequestMethod.GET)
	  public ModelAndView openQnaReplyWrite(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/qnaReplyWrite");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		  
		  Map<String,Object> boardMap = csQnAService.selectQnaBoardDetail(commandMap.getMap());
		  mv.addObject("boardMap", boardMap.get("boardMap"));
			
		  return mv; 
	  }
	  
	  /* @RequestMapping(value="/insertQna", method = RequestMethod.GET) 
	  public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		  ModelAndView mv = new ModelAndView("redirect:/qnaList");
	  
		  csQnAService.insertQnaBoard(commandMap.getMap(), request);
		  csQnAService.insertQnaAnswer(commandMap.getMap(), request);
	  
		  return mv; 
	  }*/
	  
	  @RequestMapping(value="/qnaModify", method = RequestMethod.GET) 
	  public ModelAndView qnaModify(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		  ModelAndView mv = new ModelAndView("redirect:/cs/qnaDetail"); 
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  csQnAService.updateQna(commandMap.getMap(), request);
		  mv.addObject("QNA_NUM", commandMap.get("QNA_NUM"));
		 
		  
		  return mv;
	  }
	  
		
	  @RequestMapping(value="/openQnaUpdate", method = RequestMethod.GET) 
	  public ModelAndView openQnaUpdate(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/qnaModify");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		  
		  Map<String,Object> boardMap =
		  csQnAService.selectQnaBoardDetail(commandMap.getMap());
		  mv.addObject("boardMap", boardMap.get("boardMap"));
		 
		  
		  return mv; 
	  }
	  
	  @RequestMapping(value="/qnaReplyModify", method = RequestMethod.GET) 
	  public ModelAndView qnaReplyModify(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		  ModelAndView mv = new ModelAndView("redirect:/cs/qnaDetail"); 
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  csQnAService.updateQnaAnswer(commandMap.getMap(), request);
			
		  mv.addObject("QNA_NUM", commandMap.get("QNA_PNUM"));
			 
		  return mv;  
	  }
	  
	  @RequestMapping(value="/openQnaReplyModify", method = RequestMethod.GET) 
	  public ModelAndView openQnaReplyModify(CommandMap commandMap, HttpServletRequest request) throws Exception{
		  ModelAndView mv = new ModelAndView("/qnaReplyModify");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		 
		  Map<String,Object> answerMap =
		  csQnAService.selectQnaAnswerDetail(commandMap.getMap());
		  mv.addObject("answerMap", answerMap.get("answerMap"));
		  
		  System.out.println("commandMap" + commandMap.getMap());
		  System.out.println("mv :" + mv);
		  return mv; 
	  }
		 
	  
	  @RequestMapping(value="/qnaDelete", method = RequestMethod.GET) 
	  public ModelAndView qnaDelete(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		  ModelAndView mv = new ModelAndView("/qnaDelete");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  csQnAService.deleteQna(commandMap.getMap());
			
		  return mv; 
	  }
	  
	  @RequestMapping(value="/qnaDeleteReply", method = RequestMethod.GET) 
	  public ModelAndView qnaDeleteReply(CommandMap commandMap, HttpServletRequest request) throws Exception{ 
		  ModelAndView mv = new ModelAndView("/qnaDelete");
		  
		  HttpSession session = request.getSession();
		  commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
			
		  csQnAService.deleteQnaReply(commandMap.getMap());
		  
		  return mv; 
	  }
	 

}
