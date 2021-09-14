//package zikcam.product.product;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Service;
//
//@Service("productService")
//public class ProductService {
//	Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="productDAO")
//	private ProductDAO productDAO;
////
////	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
////		return purchaseDAO.selectMainProductList(param);
////	}
////
////	public List<Map<String, Object>> allProductList(Map<String, Object> param) {
////		return purchaseDAO.selectAllProductList(param);
////	}
//}


package zikcam.product.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="productDAO")
	private ProductDAO productDAO;

	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
		return productDAO.selectMainProductList(param);
	}
 
	public List<Map<String, Object>> allProductList(Map<String, Object> param, String keyword, String searchType) {
		param.put("keyword", keyword);
		
		return productDAO.selectAllProductList(param);
	}
	
	public List<Map<String, Object>> oneProductList(Map<String, Object> param) {
		return productDAO.selectOneProductList(param);
	}
	//
//	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
//		return purchaseDAO.selectMainProductList(param);
//	}
//
//	public List<Map<String, Object>> allProductList(Map<String, Object> param) {
//		return purchaseDAO.selectAllProductList(param);
//	}
	
	public Map<String, Object> selectProductInform(Map<String, Object> map) throws Exception {
		return productDAO.selectProductInform(map);
	}
	
	public List<Map<String, Object>> selectProductReview(Map<String, Object> map) throws Exception {
		return productDAO.selectProductReview(map);
	}
	
	public List<Map<String, Object>> selectProductQuestion(Map<String, Object> map) throws Exception {
		return productDAO.selectProductQuestion(map);
	}
	
	public void insertProductQuestion(Map<String, Object> map) throws Exception{
		productDAO.insertProductQuestion(map);
	}
	
	public void insertReview(Map<String, Object> map) throws Exception{
		productDAO.insertReview(map);
	}
	
	public void insertCart(Map<String, Object> map)  throws Exception {
		productDAO.insertCart(map); 
	}
	
	public Map<String, Object> selectCart(Map<String, Object> map) throws Exception {
		return productDAO.selectCart(map);
	}
	
	public void updateCart(Map<String, Object> map) throws Exception {
		productDAO.updateCart(map);
	}
	
	public Map<String, Object> selectDayStock(Map<String, Object> map) throws Exception {
		return productDAO.selectDayStock(map);
	}
	
	public Map<String, Object> selectProductDetail(Map<String, Object> map) throws Exception {
		productDAO.updateHitCnt(map);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = productDAO.selectProductDetail(map);
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
	
	public Map<String, Object> selectProductDetail2(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> tempMap = productDAO.selectProductDetail(map);
		
		resultMap.put("map", tempMap);
		
		return resultMap;
	}
	
	public void insertWish2(Map<String, Object> map, HttpServletRequest request) throws Exception {
		 productDAO.insertWish2(map);
			
			
		 map.put("PROD_NUM", map.get("PROD_NUM"));
		 map.put("MEMBER_ID", map.get("MEMBER_ID"));
	}
	 
	 public void deleteWish2(Map<String, Object> map) throws Exception {
		 productDAO.deleteWish2(map);
		 
		 map.put("PROD_NUM", map.get("PROD_NUM"));
		 map.put("MEMBER_ID", map.get("MEMBER_ID"));
	}
} 






//
//package zikcam.product.purchase;
//
//import java.util.List;
//import java.util.Map;
//
//import javax.annotation.Resource;
//
//import org.apache.log4j.Logger;
//import org.springframework.stereotype.Service;
//
//@Service("purchaseService")
//public class PurchaseService {
//	Logger log = Logger.getLogger(this.getClass());
//	
//	@Resource(name="purchaseDAO")
//	private PurchaseDAO purchaseDAO;
//
//	public List<Map<String, Object>> mainProductList(Map<String, Object> param) {
//		return purchaseDAO.selectMainProductList(param);
//	}
//
//	public List<Map<String, Object>> allProductList(Map<String, Object> param) {
//		return purchaseDAO.selectAllProductList(param);
//	}
//}