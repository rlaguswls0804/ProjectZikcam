package zikcam.adminPage.order;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminOrderDAO")
public class AdminOrderDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adOrderList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminOrder.selectOrderList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adOrderSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminOrder.selectSearchList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adCancelList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminOrder.selectCancelList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adCancelSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminOrder.selectSearchCancelList", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adOrderDetail(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("adminOrder.selectOrderDetail", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adOrderDetailList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("adminOrder.selectOrderDetailList", map);
	}

	public void adCSModify(Map<String, Object> map) {
		update("adminOrder.updateCS", map);
	}
	
}