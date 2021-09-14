package zikcam.adminPage.pq;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import zikcam.common.util.FileUtils;
import zikcam.adminPage.pq.AdminPQDAO;

@Service("adminPQService")
public class AdminPQServiceImpl implements AdminPQService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Resource(name="adminPQDAO")
	private AdminPQDAO adminPQDAO;

	@Override
	public List<Map<String, Object>> adPQList(Map<String, Object> map, String keyword, String searchType) throws Exception {
		map.put("keyword", keyword); 
		map.put("searchType", searchType);
		
		if(keyword.equals("") || keyword == null) {
			return adminPQDAO.adPQList(map);
		}else {
			return adminPQDAO.adPQSearchList(map);
		}
	}

	@Override
	public Map<String, Object> adPQDetail(Map<String, Object> map) throws Exception {
		return adminPQDAO.adPQDetail(map);
	}
		
	@Override
	public Map<String, Object> adPQSubDetail(Map<String, Object> map) throws Exception {
		return adminPQDAO.adPQSubDetail(map);
	}
	
	@Override
	public void adPQReplyWrite(Map<String, Object>map)throws Exception{
		adminPQDAO.adPQReplyWrite(map); 
	} 
	
	@Override
	public void adPQSwitch(Map<String, Object>map)throws Exception{
		adminPQDAO.adPQSwitch(map); 
	}
	
	@Override
	public void adPQReplyUpdate(Map<String, Object>map)throws Exception{
		adminPQDAO.adPQReplyUpdate(map); 
	}
	
	@Override
	public void adPQDelete(Map<String, Object>map)throws Exception{
		adminPQDAO.adPQDelete(map); 
	}
}