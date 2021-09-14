package zikcam.myPage.myRental;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myRentalDAO")
public class MyRentalDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

}