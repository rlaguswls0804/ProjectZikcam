package zikcam.customerService.qna;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;


@Service("csQnAService")
public class CSQnAService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="csQnADAO")
	private CSQnADAO csQnADAO;
	
	
	public List<Map<String, Object>> selectQnaList(Map<String, Object> map, String keyword, String searchType, String sortType) throws Exception{
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("sortType", sortType);
		
		if((keyword.equals("") || keyword == null) && (sortType.equals("") || sortType == null)) {
			return csQnADAO.selectQnaList(map);
		}else {
			return csQnADAO.selectQnaList2(map);
		}
		
	}
	
	public void insertQnaBoard(Map<String,Object> map, HttpServletRequest request) throws Exception{
		csQnADAO.insertQnaBoard(map);
		
	}
	
	public void insertQnaAnswer(Map<String,Object> map, HttpServletRequest request) throws Exception{
		csQnADAO.insertQnaAnswer(map);	
	}
	
	public Map<String, Object> selectQnaBoardDetail (Map<String, Object> map) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = csQnADAO.selectQnaBoardDetail(map);
		
		resultMap.put("boardMap", tempMap);
		
	
		return resultMap;
	}
	
	public Map<String, Object> selectQnaAnswerDetail (Map<String, Object> map) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = csQnADAO.selectQnaAnswerDetail(map);
		
		resultMap.put("answerMap", tempMap);
		
	
		return resultMap;
	}

	public void updateQna(Map<String,Object> map, HttpServletRequest request) throws Exception{
		csQnADAO.updateQna(map);
	}
	
	public void updateQnaAnswer(Map<String,Object> map, HttpServletRequest request) throws Exception{
		csQnADAO.updateQnaAnswer(map);
	}
	
	public void updateQnaReply(Map<String,Object> map, HttpServletRequest request) throws Exception{
		  csQnADAO.updateQnaReply(map); 
	}
	 
	
	public void deleteQnaReply(Map<String,Object> map) throws Exception{
		csQnADAO.deleteQnaReply(map);
	}
	
	public void deleteQna(Map<String,Object> map) throws Exception{
		csQnADAO.deleteQna(map);
	}
	
}