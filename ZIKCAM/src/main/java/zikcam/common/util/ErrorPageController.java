package zikcam.common.util;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/errorPage")
public class ErrorPageController {

	@RequestMapping(value = "/errorPage404")
	public ModelAndView errorPage404(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/errorPage404");
		
		return mv;
	}
	
	@RequestMapping(value = "/errorPageCheck")
	public ModelAndView errorPageCheck(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/errorPageCheck");
		
		return mv;
	}
	
}
