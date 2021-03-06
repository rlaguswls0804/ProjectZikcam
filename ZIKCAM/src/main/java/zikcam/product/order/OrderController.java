package zikcam.product.order;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

import zikcam.common.map.CommandMap;

@Controller
@RequestMapping("/prod")
public class OrderController {
	
	@Resource(name="orderService")
	private OrderService orderService;
	
	Logger log = Logger.getLogger(this.getClass());

	private String prod_serical_num;
	
	 
	@RequestMapping(value="/order")
	public String order(CommandMap commandMap,
			@RequestParam(value="start_date", defaultValue="") String start_date,
			@RequestParam(value="end_date", defaultValue="") String end_date,
			@RequestParam(value="rental_start", defaultValue="") String rental_start,
			@RequestParam(value="rental_end", defaultValue="") String rental_end,
			Model model, HttpServletRequest request) throws Exception {
		
		Map<String, Object> test = new HashMap<String, Object>();
		
		HttpSession session = request.getSession();
		 
		session.setAttribute("rental_start", start_date);
		session.setAttribute("rental_end", end_date);
		
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("rental_start", start_date);
		commandMap.put("rental_end", end_date);
		
		request.setAttribute("rental_start", start_date);
		request.setAttribute("rental_end", end_date); 
		 
		/*
		 * test.put("RENTAL_START", "2021-08-30"); test.put("RENTAL_END", "2021-09-04");
		 */ 
		  
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
		model.addAttribute("temp",test);
		model.addAttribute("sum",sum);  
		model.addAttribute("rental_start", rental_start);
		model.addAttribute("rental_end", rental_end); 
		model.addAttribute("start_date", start_date);
		model.addAttribute("end_date", end_date);  
		 
		System.out.println(commandMap.getMap());
		System.out.println(model);
		System.out.println("start_date" + session.getAttribute("start_date"));
		System.out.println("end_date" + session.getAttribute("end_date"));
		System.out.println("rental_start" + session.getAttribute("rental_start"));
		System.out.println("rental_end" + session.getAttribute("rental_end"));
		return "/order";
	}
	
	@RequestMapping(value="/order2")
	public String order2(CommandMap commandMap, Model model,
			@RequestParam(value="start_date", defaultValue="") String start_date,
			@RequestParam(value="end_date", defaultValue="") String end_date,
			@RequestParam(value="PROD_NUM", defaultValue="") String PROD_NUM,
			@RequestParam(value="PROD_COUNT", defaultValue="") String PROD_COUNT,
			HttpServletRequest request) throws Exception {
		Map<String, Object> test = new HashMap<String, Object>();
		 
		HttpSession session = request.getSession();	
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		commandMap.put("PROD_NUM", PROD_NUM);
		/* if((session.getAttribute("start_date") != null && session.getAttribute("end_date") != null) ||
				(session.getAttribute("start_date") != "" && session.getAttribute("end_date") != "")) {
			commandMap.put("start_date", session.getAttribute("start_date"));
			commandMap.put("end_date", session.getAttribute("end_date"));
			request.setAttribute("start_date", start_date);
			request.setAttribute("end_date", end_date);
			model.addAttribute("isRental", true);
		}else {
			model.addAttribute("isRental", false);
		} */
		  
		   
		/* test.put("RENTAL_START", "2021-08-26");
		test.put("RENTAL_END", "2021-09-04");
		test.put("isRental", true); // true ???????????? ?????? ?????? ???????????????.
		test.put("PROD_NUM", "5");// ????????? ???????????? ????????????
		test.put("PROD_COUNT", "3");// ????????? ???????????? ????????????*/
		 
		
		Map<String, Object> list3 = orderService.selectMemberInform(commandMap.getMap());
		list3.put("PROD_NUM", PROD_NUM);
		list3.put("PROD_COUNT", PROD_COUNT);
		
		/* if(session.getAttribute("RENTAL_END") != null || session.getAttribute("end_date") != null) {
			Map<String, Object> list1 = orderService.selectRental(commandMap.getMap());
			model.addAttribute("list1",list1);
		} else {
			Map<String, Object> list1 = orderService.selectPurchase(commandMap.getMap());
			model.addAttribute("list1",list1);
		} */
		
		Map<String, Object> list1 = orderService.selectPurchase(commandMap.getMap());
		model.addAttribute("list1",list1);
		
		model.addAttribute("list3",list3);
		model.addAttribute("temp",test);
		model.addAttribute("start_date", start_date);
		model.addAttribute("end_date", end_date);
		model.addAttribute("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		System.out.println("list3" + list3);
		System.out.println(commandMap.getMap());
		System.out.println(model);
		
		return "/order2";
	}
	
	@ResponseBody
	@RequestMapping(value="/orderTable", method = RequestMethod.POST)
	public String orderTable(CommandMap commandMap, Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();	
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		
		Map<String, Object> lastOrderNum = orderService.selectLastOrderNum(commandMap.getMap());
		List<Map<String, Object>> cartList = orderService.selectCartWithoutDel(commandMap.getMap());
		
		System.out.println(cartList);
		System.out.println(lastOrderNum);
		
		orderService.insertBorder(commandMap.getMap());
		 
		for(int i = 0; i < cartList.size(); i++) {
			Map<String, Object> borderMap = new HashMap<String, Object>();
			
			borderMap.putAll(commandMap.getMap());
			borderMap.put("ORDER_NUM", lastOrderNum.get("ORDER_NUM"));
			borderMap.put("PROD_NUM", cartList.get(i).get("PROD_NUM"));
			borderMap.put("PROD_COUNT", cartList.get(i).get("PROD_COUNT"));
			borderMap.put("CART_NUM", cartList.get(i).get("CART_NUM"));
			
			String pay = String.valueOf(commandMap.get("ORDER_PAYTYPE"));

			if (pay.equals("????????? ??????")) {
				borderMap.put("ORDER_STATUS", "?????? ?????????");
			} else {
				borderMap.put("ORDER_STATUS", "?????? ?????????");
			}
			
			String rental = String.valueOf(cartList.get(i).get("CART_RENTAL"));
			
			if (rental.equals("0")) {
				orderService.insertDorderWithNull(borderMap);
				orderService.updateProdStock(borderMap);
				
			} else {
				Map<String, Object> temp = orderService.selectRental(borderMap);
				
				String tt = String.valueOf(temp.get("PROD_RSTOCK"));
				int prod_stock = Integer.parseInt(tt);
				
				String qq = String.valueOf(cartList.get(i).get("PROD_COUNT"));
				int prod_count = Integer.parseInt(qq); 
				
				System.out.println(cartList.get(i).get("PROD_NUM"));
			
				orderService.insertDorder(borderMap);
				
				System.out.println("?????? ?????????" + borderMap);
				
				ArrayList<Integer> notStockList = new ArrayList<Integer>();
				
				for(int x = 1; x<= prod_stock; x++) {
					notStockList.add(x);
			    }
				 
				System.out.println(prod_stock +"?????? ?????????"+notStockList);
				
				List<Map<String, Object>> serialNum = orderService.findSerialNum(borderMap);
				System.out.println("????????? ?????????"+serialNum);
				
				for(int j = 0; j < serialNum.size(); j++) {
					String ff = String.valueOf(serialNum.get(j).get("PROD_SERIAL_NUM"));
					int prod_serical_num = Integer.parseInt(ff);
					
					System.out.println("????????? ?????? : " + prod_serical_num);
					
					int index = notStockList.indexOf(prod_serical_num);
					System.out.println("????????? ?????? : " + index);
					
					notStockList.remove(index);
				}
				
				System.out.println("????????? ?????????"+notStockList);
				
				for(int a = 0; a < prod_count; a++) {
					borderMap.put("PROD_SERIAL_NUM", notStockList.get(a));
					
					orderService.insertRental(borderMap);
				}
				orderService.updateRProdStock(borderMap);
			}
			orderService.deleteCartProduct(borderMap);
		}
		
		return "/orderTable";
	}
	
	@ResponseBody
	@RequestMapping(value="/orderTable2", method = RequestMethod.POST)
	public String orderTable2(CommandMap commandMap,@RequestParam(value = "MEMBER_ID", defaultValue="") String MEMBER_ID,
			@RequestParam(value = "PROD_NUM", defaultValue="") String PROD_NUM, 
			@RequestParam(value = "ORDER_RCV_NAME", defaultValue="") String ORDER_RCV_NAME, 
			@RequestParam(value = "ORDER_RCV_ZONCODE", defaultValue="") String ORDER_RCV_ZONCODE,
			@RequestParam(value = "ORDER_RCV_ADDRESS1", defaultValue="") String ORDER_RCV_ADDRESS1, 
			@RequestParam(value = "ORDER_RCV_ADDRESS2", defaultValue="") String ORDER_RCV_ADDRESS2, 
			@RequestParam(value = "ORDER_RCV_PHONE", defaultValue="") String ORDER_RCV_PHONE,
			@RequestParam(value = "ORDER_MEMO", defaultValue="") String ORDER_MEMO, 
			@RequestParam(value = "ORDER_DPRICE", defaultValue="") String ORDER_DPRICE, 
			@RequestParam(value = "ORDER_PRICE", defaultValue="") String ORDER_PRICE,
			@RequestParam(value = "ORDER_PAYTYPE", defaultValue="") String ORDER_PAYTYPE,
			@RequestParam(value = "PROD_COUNT", defaultValue="") String PROD_COUNT,
			@RequestParam(value = "ORDER_STATUS", defaultValue="") String ORDER_STATUS,
			Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();	
		commandMap.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		
		Map<String, Object> lastOrderNum = orderService.selectLastOrderNum(commandMap.getMap());
		
		System.out.println(lastOrderNum);
		
		 
		orderService.insertBorder(commandMap.getMap());
		 
		Map<String, Object> borderMap = new HashMap<String, Object>();
			
		borderMap.putAll(commandMap.getMap());
		borderMap.put("ORDER_NUM", lastOrderNum.get("ORDER_NUM"));
		borderMap.put("PROD_NUM", PROD_NUM); 
		borderMap.put("PROD_COUNT", PROD_COUNT); 
		borderMap.put("ORDER_STATUS", ORDER_STATUS);
			
		String pay = String.valueOf(commandMap.get("ORDER_PAYTYPE"));
		if (pay.equals("????????? ??????")) {
			borderMap.put("ORDER_STATUS", "?????? ?????????");
		} else {
			borderMap.put("ORDER_STATUS", "?????? ?????????");
		}
			
		orderService.insertDorderWithNull(borderMap);
		orderService.updateProdStock(borderMap);
		
		
		return "/orderTable2";
	}
	
	   
	@RequestMapping(value="/orderPay")
	public ModelAndView orderPay(CommandMap commandMap,
			@RequestParam(value = "MEMBER_ID", defaultValue="") String MEMBER_ID,
			@RequestParam(value = "PROD_NUM", defaultValue="") String PROD_NUM, 
			@RequestParam(value = "ORDER_RCV_NAME", defaultValue="") String ORDER_RCV_NAME, 
			@RequestParam(value = "ORDER_RCV_ZONCODE", defaultValue="") String ORDER_RCV_ZONCODE,
			@RequestParam(value = "ORDER_RCV_ADDRESS1", defaultValue="") String ORDER_RCV_ADDRESS1, 
			@RequestParam(value = "ORDER_RCV_ADDRESS2", defaultValue="") String ORDER_RCV_ADDRESS2, 
			@RequestParam(value = "ORDER_RCV_PHONE", defaultValue="") String ORDER_RCV_PHONE,
			@RequestParam(value = "ORDER_MEMO", defaultValue="") String ORDER_MEMO, 
			@RequestParam(value = "ORDER_DPRICE", defaultValue="") String ORDER_DPRICE, 
			@RequestParam(value = "ORDER_PRICE", defaultValue="") String ORDER_PRICE,
			@RequestParam(value = "ORDER_PAYTYPE", defaultValue="") String ORDER_PAYTYPE, 
			@RequestParam(value = "rental_start", defaultValue="") String RENTAL_START, 
			@RequestParam(value = "rental_end", defaultValue="") String RENTAL_END, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/orderPay");
		
		  
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		
		map.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		map.put("rental_start",session.getAttribute("rental_start"));
		map.put("rental_end", session.getAttribute("rental_end"));
		 
		request.setAttribute("rental_start", RENTAL_START);
		request.setAttribute("rental_end", RENTAL_END); 
		
		 
		map.put("map", commandMap.getMap());
		 
		mv.addObject("map", map.get("map"));
		
		   
		System.out.println("mv : " + mv);
		System.out.println("commandMap : " + commandMap.getMap());
		System.out.println("map : " + map);
		
		
		return mv;
	}
	
	@RequestMapping(value="/orderPay2")
	public ModelAndView orderPay2(CommandMap commandMap,
			@RequestParam(value = "MEMBER_ID", defaultValue="") String MEMBER_ID,
			@RequestParam(value = "PROD_NUM", defaultValue="") String PROD_NUM, 
			@RequestParam(value = "ORDER_RCV_NAME", defaultValue="") String ORDER_RCV_NAME, 
			@RequestParam(value = "ORDER_RCV_ZONCODE", defaultValue="") String ORDER_RCV_ZONCODE,
			@RequestParam(value = "ORDER_RCV_ADDRESS1", defaultValue="") String ORDER_RCV_ADDRESS1, 
			@RequestParam(value = "ORDER_RCV_ADDRESS2", defaultValue="") String ORDER_RCV_ADDRESS2, 
			@RequestParam(value = "ORDER_RCV_PHONE", defaultValue="") String ORDER_RCV_PHONE,
			@RequestParam(value = "ORDER_MEMO", defaultValue="") String ORDER_MEMO, 
			@RequestParam(value = "ORDER_DPRICE", defaultValue="") String ORDER_DPRICE, 
			@RequestParam(value = "ORDER_PRICE", defaultValue="") String ORDER_PRICE,
			@RequestParam(value = "ORDER_PAYTYPE", defaultValue="") String ORDER_PAYTYPE,
			@RequestParam(value = "ORDER_NUM", defaultValue="") String ORDER_NUM,
			HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/orderPay2");
		
		Map<String, Object> map = new HashMap<String, Object>();
		HttpSession session = request.getSession();
		 
		map.put("MEMBER_ID", session.getAttribute("session_MEM_ID"));
		
		map.put("map", commandMap.getMap());
		 
		mv.addObject("map", map.get("map"));
		
		   
		System.out.println("mv : " + mv);
		System.out.println("commandMap : " + commandMap.getMap());
		System.out.println("map : " + map);
		
		
		return mv;
	}
	   
	  
	@RequestMapping(value="/orderPaySuccess", method = RequestMethod.GET)
	public String orderPaySuccess(CommandMap commandMap, Model model) throws Exception {
		List<Map<String, Object>> dorderP = orderService.selectLastDorderPurchase(commandMap.getMap());
		List<Map<String, Object>> dorderR = orderService.selectLastDorderRental(commandMap.getMap());
		Map<String, Object> border = orderService.selectLastBorder(commandMap.getMap());
		System.out.println(dorderP);
		System.out.println(dorderR);
		
		Map<String, Object> map = new HashMap<String, Object>();
		String value = String.valueOf(border.get("MEMBER_ID"));
		map.put("MEMBER_ID", value);
		
		Map<String, Object> member = orderService.selectMemberInform(map);
		
		model.addAttribute("dorderP",dorderP);
		model.addAttribute("dorderR",dorderR);
		model.addAttribute("border",border);
		model.addAttribute("member",member);
		
		return "/orderPaySuccess";
	}  
	
	@RequestMapping(value="/orderPayFail", method = RequestMethod.GET)
	public String orderPayFail(Model model) {
		return "/orderPayFail";
	}
	
	@RequestMapping(value="/orderPayFail2", method = RequestMethod.GET)
	public String orderPayFail2(Model model) {
		return "/orderPayFail2";
	}
}