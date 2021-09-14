package zikcam.myPage.myRental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/myPage")
public class MyRentalController {
	
	@Resource(name="myRentalService")
	private MyRentalService myRentalService;
	
	Logger log = Logger.getLogger(this.getClass());
}