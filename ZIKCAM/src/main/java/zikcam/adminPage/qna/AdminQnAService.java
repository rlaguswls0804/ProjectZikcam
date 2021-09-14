package zikcam.adminPage.qna;

import java.util.List;
import java.util.Map;

public interface AdminQnAService {
	
	List<Map<String, Object>> adQnAList(Map<String, Object> map, String keyword, String searchType)throws Exception;
	
	Map<String, Object> adQnADetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> adQnASubDetail(Map<String, Object> map) throws Exception;
	
	void adQnAReplyWrite(Map<String, Object>map)throws Exception;
	
	void adQnASwitch(Map<String, Object>map)throws Exception;
	
	void adQnAReplyUpdate(Map<String, Object>map)throws Exception;
	
	void adQnADelete(Map<String, Object>map)throws Exception;

}
