package zikcam.myPage.myCart;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import zikcam.common.map.CommandMap;
import zikcam.product.order.OrderService;


@Controller
@RequestMapping("/myPage")
public class MyCartController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	Logger log = Logger.getLogger(this.getClass());
	
	//myCart
	@RequestMapping(value="/myCartList")
	public String myCartList(CommandMap commandMap, Model model,
			@RequestParam(value="start_date", defaultValue="") String start_date,
			@RequestParam(value="end_date", defaultValue="") String end_date,  
			HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		
		String rental_start = (String)request.getParameter("rental_start");
		String rental_end = (String)request.getParameter("rental_end");
		
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		session.setAttribute("rental_start", rental_start);
		session.setAttribute("rental_end", rental_end); 
		commandMap.put("rental_start", session.getAttribute("rental_start"));
		commandMap.put("rental_end", session.getAttribute("rental_end"));
		
		
		List<Map<String, Object>> list1 = orderService.selectPurchaseList(commandMap.getMap());
		List<Map<String, Object>> list2 = orderService.selectRentalList(commandMap.getMap());
		Map<String, Object> list3 = orderService.selectMemberInform(commandMap.getMap());
		
		Map<String, Object> sum = new HashMap<String, Object>();
		
		if (orderService.sumPurchase(commandMap.getMap()) == null) {
			sum.put("PRICE", 0);
		} else {
			sum.putAll(orderService.sumPurchase(commandMap.getMap()));
		}
		if (orderService.sumRental(commandMap.getMap()) == null) {
			sum.put("RPRICE", 0);
		} else {
			sum.putAll(orderService.sumRental(commandMap.getMap()));
		} 
		   
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("test",test);
		model.addAttribute("sum",sum); 
		model.addAttribute("rental_start", rental_start);
		model.addAttribute("rental_end", rental_end);
		
		System.out.println(commandMap.getMap());    
		System.out.println("start_date" + session.getAttribute("start_date"));
		System.out.println("end_date" + session.getAttribute("end_date"));
		System.out.println("rental_start" + session.getAttribute("rental_start"));
		System.out.println("rental_end" + session.getAttribute("rental_end"));
		System.out.println("rental_start" + rental_start);
		System.out.println("rental_end" + rental_end);
		
		return "/myCartList";
		
	}
	
	@RequestMapping(value="/myCartUpdate", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> myCartUpdate(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println(commandMap.getMap());
		orderService.updateProdCount(commandMap.getMap());
		
		if (orderService.sumPurchase(commandMap.getMap()) == null) {
			test.put("PRICE", 0);
		} else {
			test.putAll(orderService.sumPurchase(commandMap.getMap()));
		}
		
		if (orderService.sumRental(commandMap.getMap()) == null) {
			test.put("RPRICE", 0);
		} else {
			test.putAll(orderService.sumRental(commandMap.getMap()));
		}
		
		return test;
	}
	
	@RequestMapping(value="/myCartUpdateDel", method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> myCartUpdateDel(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		orderService.updateCartDel(commandMap.getMap());
		
		if (orderService.sumPurchase(commandMap.getMap()) == null) {
			test.put("PRICE", 0);
		} else {
			test.putAll(orderService.sumPurchase(commandMap.getMap()));
		}
		
		if (orderService.sumRental(commandMap.getMap()) == null) {
			test.put("RPRICE", 0);
		} else {
			test.putAll(orderService.sumRental(commandMap.getMap()));
		}
		
		return test;
	}
	
	@RequestMapping(value="/myCartOneDelete")
	public @ResponseBody Map<String, Object> myCartOneDelete(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		orderService.deleteCartProduct(commandMap.getMap());

		if (orderService.sumPurchase(commandMap.getMap()) == null) {
			test.put("PRICE", 0);
		} else {
			test.putAll(orderService.sumPurchase(commandMap.getMap()));
		}
		
		if (orderService.sumRental(commandMap.getMap()) == null) {
			test.put("RPRICE", 0);
		} else {
			test.putAll(orderService.sumRental(commandMap.getMap()));
		}
		
		return test;
	}
	
	@RequestMapping(value="/myCartDelete")
	public @ResponseBody Map<String, Object> myCartDelete(@RequestBody ArrayList<Map<String, Object>> list, Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		test.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		Iterator it = list.iterator();

		while(it.hasNext()) {
			@SuppressWarnings("unchecked")
			Map<String, Object> map = (Map<String, Object>) it.next();
			orderService.deleteCartProduct(map);
		}
		
		if (orderService.sumPurchase(test) == null) {
			test.put("PRICE", 0);
		} else {
			test.putAll(orderService.sumPurchase(test));
		}
		
		if (orderService.sumRental(test) == null) {
			test.put("RPRICE", 0);
		} else {
			test.putAll(orderService.sumRental(test));
		}
		
		return test;
	}
	
	@RequestMapping(value="/purchaseInvenCheck")
	public @ResponseBody List<Map<String, Object>> purchaseInvenCheck(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = orderService.selectPurchaseList(commandMap.getMap());
		
		return list;
	}
	
	@RequestMapping(value="/rentalInvenCheck")
	public @ResponseBody List<Map<String, Object>> rentalInvenCheck(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		List<Map<String, Object>> list = orderService.selectRentalList(commandMap.getMap());
		
		return list;
	}
}
