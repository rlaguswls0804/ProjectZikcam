package zikcam.adminPage.pq;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface AdminPQService {
	
	List<Map<String, Object>> adPQList(Map<String, Object> map, String keyword, String searchType)throws Exception;
	
	Map<String, Object> adPQDetail(Map<String, Object> map) throws Exception;
	
	Map<String, Object> adPQSubDetail(Map<String, Object> map) throws Exception;
	
	void adPQReplyWrite(Map<String, Object>map)throws Exception;
	
	void adPQSwitch(Map<String, Object>map)throws Exception;
	
	void adPQReplyUpdate(Map<String, Object>map)throws Exception;
	
	void adPQDelete(Map<String, Object>map)throws Exception;

}
