package zikcam.myPage.myPQ;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import zikcam.myPage.myPQ.MyPQDAO;

@Service("myPQService")
public class MyPQServiceImpl implements MyPQService {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "myPQDAO")
	private MyPQDAO myPQDAO;

	@Override
	public List<Map<String, Object>> selectMyPQList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword);
		map.put("searchType", searchType);		
		return myPQDAO.selectMyPQList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectPQDetail(Map<String, Object> map) throws Exception {
		return myPQDAO.selectPQDetail(map);
	}
	
	@Override
	public Map<String, Object> selectPQModifyForm(Map<String, Object> map) throws Exception{
		return myPQDAO.selectPQModifyForm(map);
	}
	
	@Override
	public void updatePQ(Map<String, Object> map) throws Exception{
		myPQDAO.updatePQ(map);
	}

	@Override
	public void deletePQ(Map<String, Object> map) throws Exception{
		myPQDAO.deletePQ(map);
	}
	
	
	
//	QNA
	@Override
	public List<Map<String, Object>> selectQNAList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		return myPQDAO.selectQNAList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectQNADetail(Map<String, Object> map) throws Exception {
		return myPQDAO.selectQNADetail(map);
	}
	
	@Override
	public Map<String, Object> selectQNAModifyForm(Map<String, Object> map) throws Exception{
		return myPQDAO.selectQNAModifyForm(map);
	}
	
	@Override
	public void updateQNA(Map<String, Object> map) throws Exception{
		myPQDAO.updateQNA(map);
	}

	@Override
	public void deleteQNA(Map<String, Object> map) throws Exception{
		myPQDAO.deleteQNA(map);
	}
}
