package zikcam.myPage.myOrder;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;


@Service("myOrderService")
public interface MyOrderService {
	
	List<Map<String, Object>> selectOrderList(Map<String, Object> commandMap) throws Exception;
	
	List<Map<String, Object>> selectPOrderDetail(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectROrderDetail(Map<String, Object> commandMap) throws Exception;
	
	Map<String, Object> selectOrderDetailStatus(Map<String, Object> commandMap) throws Exception;
	Map<String, Object> selectRefundProduct(Map<String, Object> commandMap) throws Exception;
	Map<String, Object> rentalDate(Map<String, Object> commandMap) throws Exception;
	
	void orderRefund(Map<String, Object> commandMap) throws Exception;
	void deletePart(Map<String, Object> commandMap) throws Exception;
	void deleteAll(Map<String, Object> commandMap) throws Exception;
}