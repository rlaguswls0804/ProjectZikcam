package zikcam.adminPage.product;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("adminProductDAO")
public class AdminProductDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adProductList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminProduct.selectProductList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> adProductSearchList(Map<String, Object> map) throws Exception {
		return (List<Map<String, Object>>) selectPagingList("adminProduct.selectProductSearchList", map);
	}
		
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("adminProduct.selectProductDetail", map);
	}
	  
	public void updateHitCnt(Map<String, Object> map) throws Exception{
		update("adminProduct.updateHitCount", map);
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> adProductModify(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("adminProduct.selectProductModify", map);
	}
	
	public void insertProduct(Map<String, Object> map) throws Exception {
		insert("adminProduct.insertProduct",map);
	}
	
	public void updateProduct(Map<String, Object> map) throws Exception{
		update("adminProduct.updateProduct",map);
	}
	
	public void deleteProduct(Map<String, Object> map) throws Exception{
		update("adminProduct.deleteProduct", map);
	}

}