package zikcam.product.wish;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
public class WishController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="wishService")
	private WishService wishService;
	
	@RequestMapping(value="/main/openWish")
	public ModelAndView openWishList(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/product/wish");
		
		return mv;
	}
	
	@RequestMapping(value="/main/selectWish")
	public ModelAndView openCartList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");
		
		List<Map<String,Object>> wishList = wishService.selectWishList(commandMap.getMap());
		mv.addObject("wishList",wishList);
		
		if(wishList.size() > 0){ 
			mv.addObject("TOTAL", wishList.get(0).get("TOTAL_COUNT")); 
		} 
		else{ 
			mv.addObject("TOTAL", 0); 
		}
		
		return mv;
	}
	
	
}