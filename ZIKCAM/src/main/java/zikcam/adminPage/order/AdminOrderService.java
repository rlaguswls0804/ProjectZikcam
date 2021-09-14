package zikcam.adminPage.order;

import java.util.List;
import java.util.Map;

public interface AdminOrderService {
	List<Map<String, Object>> adOrderList(Map<String, Object> map, String keyword, String searchType)throws Exception;
	
	List<Map<String, Object>> adCancelList(Map<String, Object> map, String keyword, String searchType, String sortType, String formSortType)throws Exception;
	
	Map<String, Object> adOrderDetail(Map<String, Object> map) throws Exception;
	
	List<Map<String, Object>> adOrderDetailList(Map<String, Object> map)throws Exception;

	void adCSModify(Map<String, Object> map)throws Exception;
	
}