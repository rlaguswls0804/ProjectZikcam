package zikcam.myPage.myCart;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("myCartService")
public class MyCartService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myCartDAO")
	private MyCartDAO myCartDAO;
}