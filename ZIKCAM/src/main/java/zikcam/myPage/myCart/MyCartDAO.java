package zikcam.myPage.myCart;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myCartDAO")
public class MyCartDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPurchaseList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectPurchaseList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectRentalList",map);
	}
}