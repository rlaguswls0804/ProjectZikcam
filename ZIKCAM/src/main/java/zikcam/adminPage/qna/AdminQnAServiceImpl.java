package zikcam.adminPage.qna;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("adminQnAService")
public class AdminQnAServiceImpl implements AdminQnAService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminQnADAO")
	private AdminQnADAO adminQnADAO;

	@Override
	public List<Map<String, Object>> adQnAList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		
		if(keyword.equals("") || keyword == null) {
			return adminQnADAO.adQnAList(map);
		}else {
			return adminQnADAO.adQnASearchList(map);
		}
	}

	@Override
	public Map<String, Object> adQnADetail(Map<String, Object> map) throws Exception {
		return adminQnADAO.adQnADetail(map);
	}
		
	@Override
	public Map<String, Object> adQnASubDetail(Map<String, Object> map) throws Exception {
		return adminQnADAO.adQnASubDetail(map);
	}
	
	@Override
	public void adQnAReplyWrite(Map<String, Object>map)throws Exception{
		adminQnADAO.adQnAReplyWrite(map); 
	}
	 
	@Override
	public void adQnASwitch(Map<String, Object>map)throws Exception{
		adminQnADAO.adQnASwitch(map); 
	}
	
	@Override
	public void adQnAReplyUpdate(Map<String, Object>map)throws Exception{
		adminQnADAO.adQnAReplyUpdate(map); 
	}
	
	@Override
	public void adQnADelete(Map<String, Object>map)throws Exception{
		adminQnADAO.adQnADelete(map); 
	}
}