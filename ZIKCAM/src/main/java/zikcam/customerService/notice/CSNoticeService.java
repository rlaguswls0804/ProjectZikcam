package zikcam.customerService.notice;

import java.util.HashMap;
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

@Service("csNoticeService")
public class CSNoticeService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="csNoticeDAO")
	private CSNoticeDAO csNoticeDAO;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils; 
	
	public List<Map<String, Object>> selectNoticeList(
			Map<String, Object> map, String keyword, String searchType, String sortType) throws Exception{	
				
			map.put("keyword", keyword); 
			map.put("searchType", searchType);
			map.put("sortType", sortType);
			
			
			if((keyword.equals("") || keyword == null) && (sortType.equals("") || sortType == null)) {
				return csNoticeDAO.selectNoticeList(map);
			}else {
				return csNoticeDAO.selectNoticeList2(map);
			}
			 
			
		 }
	  
	  
		public void insertNotice(Map<String, Object> map, HttpServletRequest request) throws Exception {
			csNoticeDAO.insertNotice(map);
			
			
			map.put("IDX", map.get("NOTICE_NUM"));
			/*
			 * List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(map, request);
			 * 
			 * for(int i=0, size=list.size(); i<size; i++) {
			 * csNoticeDAO.insertNoticeFile(list.get(i)); }
			 */
		}

		
		public Map<String, Object> selectNoticeDetail(Map<String, Object> map) throws Exception {
			csNoticeDAO.updateHitCnt(map);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			Map<String, Object> tempMap = csNoticeDAO.selectNoticeDetail(map);
			
			resultMap.put("map", tempMap);
			
			/*
			 * List<Map<String, Object>> list = csNoticeDAO.selectNoticeFileList(map);
			 * resultMap.put("list", list);
			 */
			
			return resultMap;
		}

		
		public void updateNotice(Map<String, Object> map, HttpServletRequest request) throws Exception{
			csNoticeDAO.updateNotice(map);
			
		}

		
		public void deleteNotice(Map<String, Object> map) throws Exception {
			csNoticeDAO.deleteNotice(map);
		}
}