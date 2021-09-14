package zikcam.customerService.introduction;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/cs")
public class CSIntroductionController {

	@Resource(name="csIntroductionService")
	private CSIntroductionService csIntroductionService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//intro
	
	@RequestMapping(value="/introList", method = RequestMethod.GET)
	public String introList(Model model) {
		return "/introList";
	}
	
	@RequestMapping(value="/csIndex", method = RequestMethod.GET)
	public String csIndex(Model model) {
		return "/csIndex";
	}
	
	
	
}
