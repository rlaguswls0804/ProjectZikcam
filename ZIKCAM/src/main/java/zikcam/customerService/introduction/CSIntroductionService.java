package zikcam.customerService.introduction;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("csIntroductionService")
public class CSIntroductionService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="csIntroductionDAO")
	private CSIntroductionDAO csIntroductionDAO;
}