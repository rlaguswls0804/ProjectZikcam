package zikcam.myPage.myPageMain;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import zikcam.myPage.myPageMain.MyPageMainDAO;

@Service("myPageMainService")
public class MyPageMainServiceImpl implements MyPageMainService {

	@Resource(name="myPageMainDAO")
	private MyPageMainDAO myPageMainDAO;
	
	@Override
	public List<Map<String, Object>> selectOrderList(Map<String, Object> map) throws Exception{
		return myPageMainDAO.selectOrderList(map);
	}
	
	@Override
	public List<Map<String, Object>> selectReviewList(Map<String, Object> map) throws Exception{
		return myPageMainDAO.selectReviewList(map);
	}
	@Override
	public List<Map<String, Object>> selectPQList(Map<String, Object> map) throws Exception{
		return myPageMainDAO.selectPQList(map);
	}
	@Override
	public List<Map<String, Object>> selectCartList(Map<String, Object> map) throws Exception{
		return myPageMainDAO.selectCartList(map);
	}
	
}
