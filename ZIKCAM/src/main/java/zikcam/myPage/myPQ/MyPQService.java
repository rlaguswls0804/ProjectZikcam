package zikcam.myPage.myPQ;

import java.util.List;
import java.util.Map;


import org.springframework.stereotype.Service;


@Service("myPQService")
public interface MyPQService {
	
//	PRODUCTQUESTION
	List<Map<String, Object>> selectMyPQList(Map<String, Object> commandMap, String keyword, String searchType) throws Exception;
	List<Map<String, Object>> selectPQDetail(Map<String, Object> commandMap) throws Exception;
	Map<String, Object> selectPQModifyForm(Map<String, Object> commandMap) throws Exception;
	void updatePQ(Map<String, Object> commandMap) throws Exception;
	void deletePQ(Map<String, Object> commandMap) throws Exception;
	
//	QNA
	List<Map<String, Object>> selectQNAList(Map<String, Object> commandMap, String keyword, String searchType) throws Exception;
	List<Map<String, Object>> selectQNADetail(Map<String, Object> commandMap) throws Exception;
	Map<String, Object> selectQNAModifyForm(Map<String, Object> commandMap) throws Exception;
	void updateQNA(Map<String, Object> commandMap) throws Exception;
	void deleteQNA(Map<String, Object> commandMap) throws Exception;
	
}