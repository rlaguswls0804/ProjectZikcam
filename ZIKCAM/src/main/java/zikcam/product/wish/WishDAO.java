package zikcam.product.wish;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("wishDAO")
public class WishDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectWishList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("wish.selectWishList",map);
	}
}
