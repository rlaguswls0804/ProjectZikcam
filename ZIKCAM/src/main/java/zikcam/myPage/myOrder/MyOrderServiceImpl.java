package zikcam.myPage.myOrder;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zikcam.myPage.myOrder.MyOrderDAO;

@Service("myOrderService")
public class MyOrderServiceImpl implements MyOrderService{

	
	@Resource(name="myOrderDAO")
	private MyOrderDAO myOrderDAO;
	
	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception{
		return myOrderDAO.selectOrderList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPOrderDetail(Map<String, Object> map) throws Exception{
		return myOrderDAO.selectPOrderDetail(map);
	}
	@Override
	public List<Map<String, Object>> selectROrderDetail(Map<String, Object> map) throws Exception{
		return myOrderDAO.selectROrderDetail(map);
	}
	
	@Override
	public Map<String, Object> selectOrderDetailStatus(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = myOrderDAO.selectOrderDetailStatus(map);
		return resultMap;
	}
	
	@Override
	public Map<String, Object> selectRefundProduct(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = myOrderDAO.selectRefundProduct(map);
		return resultMap;
	}
	
	@Override
	public Map<String, Object> rentalDate(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = myOrderDAO.rentalDate(map);
		return resultMap;
	}
	
	@Override
	public void orderRefund(Map<String, Object> map) throws Exception{
		myOrderDAO.orderRefund(map);
	}
	
	@Override
	public void deletePart(Map<String, Object> map) throws Exception{
		myOrderDAO.deletePart(map);
	}
	@Override
	public void deleteAll(Map<String, Object> map) throws Exception{
		myOrderDAO.deleteAll(map);
	}
}
