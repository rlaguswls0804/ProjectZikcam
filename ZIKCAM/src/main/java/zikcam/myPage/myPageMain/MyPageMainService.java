package zikcam.myPage.myPageMain;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import zikcam.myPage.myPageMain.MyPageMainDAO;

@Service("myPageMainService")
public interface MyPageMainService {
	
	List<Map<String, Object>> selectOrderList(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectReviewList(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectPQList(Map<String, Object> commandMap) throws Exception;
	List<Map<String, Object>> selectCartList(Map<String, Object> commandMap) throws Exception;
	
}