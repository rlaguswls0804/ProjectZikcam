package zikcam.product.wish;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("wishService")
public class WishService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="wishDAO")
	private WishDAO wishDAO;
	
	public List<Map<String, Object>> selectWishList(Map<String, Object> map) throws Exception {
		return wishDAO.selectWishList(map);
	}
}
