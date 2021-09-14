package zikcam.product.order;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("orderDAO")
public class OrderDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPurchaseList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectPurchaseList",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectRentalList",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectPurchase(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectPurchase",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRental(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectRental",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectOrderPurchase(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectOrderPurchase",map);
	}
	
	public void deleteCartProduct(Map<String, Object> map) throws Exception{
		delete("order.deleteCartProduct",map);
	}
	
	public void updateProdCount(Map<String, Object> map) throws Exception{
		update("order.updateProdCount",map);
	}
	
	public void updateCartDel(Map<String, Object> map) throws Exception{
		update("order.updateCartDel",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberInform(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectMemberInform",map);
	}
	
	public void insertBorder(Map<String, Object> map) throws Exception {
		insert("order.insertBorder",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLastOrderNum(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectLastOrderNum",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLastOrderNumOne(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectLastOrderNumOne",map);
	}
	
	public void insertDorder(Map<String, Object> map) throws Exception {
		insert("order.insertDorder",map);
		
	}
	
	public void insertDorderWithNull(Map<String, Object> map) throws Exception {
		insert("order.insertDorderWithNull",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartWithoutDel(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectCartWithoutDel",map);
	}
	
	public void updateProdStock(Map<String, Object> map) throws Exception{
		update("order.updateProdStock",map);
	}
	
	public void updateRProdStock(Map<String, Object> map) throws Exception{
		update("order.updateRProdStock",map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLastDorderPurchase(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectLastDorderPurchase",map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectLastDorderRental(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.selectLastDorderRental",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectLastBorder(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.selectLastBorder",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sumPurchase(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.sumPurchase",map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> sumRental(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("order.sumRental",map);
	}
	
	public void insertRental(Map<String, Object> map) throws Exception {
		insert("order.insertRental",map);
		
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findSerialNum(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectList("order.findSerialNum",map);
	}
}