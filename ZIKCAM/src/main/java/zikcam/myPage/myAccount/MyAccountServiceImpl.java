package zikcam.myPage.myAccount;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


import zikcam.myPage.myAccount.MyAccountDAO;

@Service("myAccountService")
public class MyAccountServiceImpl implements MyAccountService{

Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="myAccountDAO")
	private MyAccountDAO myAccountDAO;
	
	@Override
	public List<Map<String, Object>> selectAccount(Map<String, Object> map) throws Exception{
		return myAccountDAO.selectAccount(map);
	}
	
	@Override
	public Map<String, Object> selectAccountModify(Map<String, Object> map) throws Exception{
		return myAccountDAO.selectAccountModify(map);
	}
	
	@Override
	public void updateAccount(Map<String, Object> map) throws Exception {
		myAccountDAO.updateAccount(map);
	}
	
}
