package zikcam.product.order;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("orderService")
public class OrderService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="orderDAO")
	private OrderDAO orderDAO;
	
	public List<Map<String, Object>> selectPurchaseList(Map<String, Object> map) throws Exception {
		return orderDAO.selectPurchaseList(map);
	}
	
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception {
		return orderDAO.selectRentalList(map);
	}
	
	public Map<String, Object> selectPurchase(Map<String, Object> map) throws Exception {
		return orderDAO.selectPurchase(map);
	}
	
	public Map<String, Object> selectRental(Map<String, Object> map) throws Exception {
		return orderDAO.selectRental(map);
	}
	
	public Map<String, Object> selectOrderPurchase(Map<String, Object> map) throws Exception {
		return orderDAO.selectOrderPurchase(map);
	}
	
	public void deleteCartProduct(Map<String, Object> map) throws Exception {
		orderDAO.deleteCartProduct(map);
	}
	
	public void updateProdCount(Map<String, Object> map) throws Exception {
		orderDAO.updateProdCount(map);
	}
	
	public void updateCartDel(Map<String, Object> map) throws Exception {
		orderDAO.updateCartDel(map);
	}
	
	public Map<String, Object> selectMemberInform(Map<String, Object> map) throws Exception {
		return orderDAO.selectMemberInform(map);
	}
	
	public void insertBorder(Map<String, Object> map)  throws Exception {
		orderDAO.insertBorder(map);
	}
	
	public Map<String, Object> selectLastOrderNum(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastOrderNum(map);
	}
	
	public Map<String, Object> selectLastOrderNumOne(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastOrderNumOne(map);
	}
	
	public void insertDorder(Map<String, Object> map)  throws Exception {
		orderDAO.insertDorder(map);
	}
	
	public void insertDorderWithNull(Map<String, Object> map)  throws Exception {
		orderDAO.insertDorderWithNull(map);
	}
	
	public List<Map<String, Object>> selectCartWithoutDel(Map<String, Object> map) throws Exception {
		return orderDAO.selectCartWithoutDel(map);
	}
	
	public void updateProdStock(Map<String, Object> map) throws Exception {
		orderDAO.updateProdStock(map);
	}
	
	public void updateRProdStock(Map<String, Object> map) throws Exception {
		orderDAO.updateRProdStock(map);
	}
	
	public List<Map<String, Object>> selectLastDorderPurchase(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastDorderPurchase(map);
	}
	
	public List<Map<String, Object>> selectLastDorderRental(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastDorderRental(map);
	}
	
	public Map<String, Object> selectLastBorder(Map<String, Object> map) throws Exception {
		return orderDAO.selectLastBorder(map);
	}
	
	public Map<String, Object> sumPurchase(Map<String, Object> map) throws Exception {
		return orderDAO.sumPurchase(map);
	}
	
	public Map<String, Object> sumRental(Map<String, Object> map) throws Exception {
		return orderDAO.sumRental(map);
	}
	
	public void insertRental(Map<String, Object> map)  throws Exception {
		orderDAO.insertRental(map);
		
		map.put("PROD_NUM", map.get("PROD_NUM"));
		 map.put("MEMBER_ID", map.get("MEMBER_ID"));
	}
	
	public List<Map<String, Object>> findSerialNum(Map<String, Object> map) throws Exception {
		return orderDAO.findSerialNum(map);
	}
}