package zikcam.myPage.myPageMain;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import zikcam.common.dao.AbstractDAO;

@Repository("myPageMainDAO")
public class MyPageMainDAO extends AbstractDAO {
	Logger log = Logger.getLogger(this.getClass());

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectMainOrderList", map); 
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectMainReviewList", map); 
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectPQList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectMainPQList", map); 
	}
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCartList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>) selectList("mypage.selectMainCartList", map); 
	}
	
}