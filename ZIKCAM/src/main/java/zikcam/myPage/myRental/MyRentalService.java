package zikcam.myPage.myRental;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("myRentalService")
public class MyRentalService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myRentalDAO")
	private MyRentalDAO myRentalDAO;
}