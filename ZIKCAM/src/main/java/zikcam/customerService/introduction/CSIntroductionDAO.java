package zikcam.customerService.introduction;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("csIntroductionDAO")
public class CSIntroductionDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
}
