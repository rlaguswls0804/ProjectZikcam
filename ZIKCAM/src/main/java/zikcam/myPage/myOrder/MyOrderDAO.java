package zikcam.myPage.myOrder;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myOrderDAO")
public class MyOrderDAO extends AbstractDAO {


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("mypage.selectOrderList", map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPOrderDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectPOrderDetail", map); 
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectROrderDetail(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectROrderDetail", map); 
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderDetailStatus(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectOrderDetailStatus", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRefundProduct(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.selectRefundProduct", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> rentalDate(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("mypage.rentalDate", map);
	}
	
	public void orderRefund(Map<String, Object> map) throws Exception{
		update("mypage.orderRefund", map);
	}
	
	public void deletePart(Map<String, Object> map) throws Exception{
		delete("mypage.deletePart", map);
	}
	
	public void deleteAll(Map<String, Object> map) throws Exception{
		delete("mypage.deleteAll", map);
	}

}