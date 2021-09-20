package zikcam.member.join;

import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import zikcam.member.join.MemberJoinService;
import zikcam.member.join.MailService;
import zikcam.common.map.CommandMap;
import zikcam.member.join.MailHandler;

@Controller
@RequestMapping("/member")
public class MemberJoinController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	
	@Resource(name="mailService")
	private MailService mailService;
	   
	@Resource(name="memberJoinService")
	private MemberJoinService memberJoinService;
	
	@Inject
	private JavaMailSender mailSender;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	//login
	
	@RequestMapping(value="/join", method = RequestMethod.GET)
	public ModelAndView joinForm(CommandMap commandMap) throws Exception{
		 ModelAndView mv = new ModelAndView();
	      
		 int ran = new Random().nextInt(900000)+1000;
		  
		 mv.setViewName("/joinForm");
		 mv.addObject("random", ran);

		 return mv;
	}
	
	@RequestMapping(value = "/idCheck") //아이디 중복확인
	   public @ResponseBody String idCheck(CommandMap commandMap) throws Exception {
	      
	      System.out.println(commandMap.getMap());
	      
	      String idCheck = String.valueOf(memberJoinService.selectIdCheck(commandMap.getMap()));
	      
	      System.out.println(idCheck);

	      return idCheck;
	   } 
	
	@RequestMapping(value = "/memberVerify")
	   public ModelAndView insertMember(CommandMap commandMap) throws Exception{ //회원가입성공
		   System.out.println(commandMap.getMap());
		   String rawPassword = (String)commandMap.get("MEMBER_PW");
		   String encPassword = passwordEncoder.encode(rawPassword);
		   commandMap.put("MEMBER_PW", encPassword);
		   memberJoinService.insertMember(commandMap.getMap());
		   ModelAndView mv = new ModelAndView("/joinConfirm");
		   return mv;
	   }
	   
	   @RequestMapping(value = "/createEmailAuth", method=RequestMethod.GET)
	   @ResponseBody
	   public boolean createEmailAuth(CommandMap commandMap, 
			   @RequestParam String userEmail, 
			   @RequestParam int random, HttpServletRequest req) throws Exception {
		 //이메일 인증
		   String emailCheck = String.valueOf(memberJoinService.selectEmailCheck(commandMap.getMap()));
		   if(emailCheck.equals("0")) {
			   int ran = new Random().nextInt(900000) + 100000;
			   HttpSession session = req.getSession(true);
			   String authCode = String.valueOf(ran);
			   session.setAttribute("authCode", authCode);
			   session.setAttribute("random", random);
			   String subject = "직캠 회원가입 인증 코드 발급 안내 입니다.";
			   StringBuilder sb = new StringBuilder();
			   sb.append("귀하의 인증 코드는   " + authCode + "   입니다.");
			   return mailService.send(subject, sb.toString(),"kimhj000308@gmail.com", userEmail, null);
		   }else {
			   return false;
		   }
	   }
	   
	   @RequestMapping(value="/emailConfirm", method=RequestMethod.GET)//인증번호확인
	   @ResponseBody
	   public ResponseEntity<String> emailConfirm(
			   @RequestParam String authCode, 
			   @RequestParam String random, HttpSession session){
		   String originalJoinCode = (String) session.getAttribute("authCode");
		   String originalRandom = Integer.toString((Integer) session.getAttribute("random"));
		   if(originalJoinCode.equals(authCode) && originalRandom.equals(random)) { 
			   return new ResponseEntity<String>("complete", HttpStatus.OK);   
		   }else { 
			   return new ResponseEntity<String>("false", HttpStatus.OK);
		   }
	   
	   }

	   @RequestMapping(value = "/authComplete", method = RequestMethod.GET) 
	   public ModelAndView join(CommandMap commandMap) throws Exception { //이메일 인증기능 처리
		  ModelAndView mv = new ModelAndView("/main");
		  
		  return mv; 
		}
	
	@RequestMapping(value="/agreement", method = RequestMethod.GET)
	public String agreement(Model model) {
		return "/agreement";
	}
	
}