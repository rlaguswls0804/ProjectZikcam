package first.common.util;

import java.util.UUID;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class CommonUtils {

	Log log = LogFactory.getLog(CommonUtils.class);
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replace("-", "");
	}
	
	protected void printFile(String file) {
		log.debug("------------- start upload -------------");
		
		if(log.isDebugEnabled()){
			log.debug("\t file  \t:  " + file);
		}
		
		log.debug("------------- end upload -------------");
	}
}
