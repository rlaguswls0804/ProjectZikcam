package zikcam.adminPage.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminOrderService")
public class AdminOrderServiceImpl implements AdminOrderService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminOrderDAO")
	private AdminOrderDAO adminOrderDAO;

	@Override
	public List<Map<String, Object>> adOrderList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		
		if(keyword.equals("") || keyword == null) {
			return adminOrderDAO.adOrderList(map);
		}else {
			return adminOrderDAO.adOrderSearchList(map);
		}
	}

	@Override
	public List<Map<String, Object>> adCancelList(Map<String, Object> map, String keyword, String searchType, String sortType, String formSortType) throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		 
		if((keyword.equals("") || keyword == null) && (sortType.equals("") || sortType == null)) {
			return adminOrderDAO.adCancelList(map);
		}else {
			return adminOrderDAO.adCancelSearchList(map);
		}
	}

	@Override
	public Map<String, Object> adOrderDetail(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = adminOrderDAO.adOrderDetail(map);
		return resultMap;
	}
	
	@Override
	public List<Map<String, Object>> adOrderDetailList(Map<String, Object> map) throws Exception {
		return adminOrderDAO.adOrderDetailList(map);
	}

	@Override
	public void adCSModify(Map<String, Object> map) throws Exception {
		adminOrderDAO.adCSModify(map);
	} 
}
