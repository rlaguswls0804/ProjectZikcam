package zikcam.product.rental;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("rentalDAO")
public class RentalDAO extends AbstractDAO {
	
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRentalList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("rental.selectRentalList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectRentalList2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("rental.selectRentalList2", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectRentalDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("rental.selectRentalDetail", map);
	}
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectWishDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("rental.selectWishDetail", map);
	}
	
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("rental.updateHitCount", map);
	}
	
	public void insertWish(Map<String, Object> map) throws Exception{
		insert("rental.insertWish", map); 
	} 
	
	public void deleteWish(Map<String, Object> map) throws Exception{
		delete("rental.deleteWish", map);
	}
}