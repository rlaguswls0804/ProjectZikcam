package zikcam.customerService.faq;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("csFAQDAO")
public class CSFAQDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());
	
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectPagingList("faq.selectFaqList", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFaqList2(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("faq.selectFaqList2", map);
	}
	
	public void insertFaq(Map<String, Object> map) throws Exception{
		insert("faq.insertFaq", map);
	}
	
	@SuppressWarnings("unchecked") 
	public Map<String, Object> selectFaqDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("faq.selectFaqDetail", map);	
	}

	public void updateHitCount(Map<String, Object> map) throws Exception{
		update("faq.updateHitCount", map);
	}
	
	
	public void updateFaq(Map<String, Object> map) throws Exception{
		update("faq.updateFaq", map);
	}
	
	public void deleteFaq(Map<String, Object> map) throws Exception{
		update("faq.deleteFaq", map);
	}
	
	
}