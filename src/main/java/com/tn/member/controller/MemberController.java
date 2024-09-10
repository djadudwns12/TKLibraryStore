package com.tn.member.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.member.model.vo.MemberVO;
import com.tn.member.service.MemberService;
import com.tn.member.service.SendMailService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	MemberService mService;
	

//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		
//		//test.getMember();
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		
//		
//		
//		
//		return "index";
//	}
	
	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 6.
	 * @method_name : getMemberInfo
	 * @param :String userId(로그인 기능 구현 이후 세션에서 로그인 정보 받아와서 파라미터로 받을 예정)
	 * @param :Model model
	 * @return : memberVO
	 * @throws : 
	 * @description : 회원정보수정을 위해 회원정보를 불러오는 메서드, 
	*/
	@RequestMapping(value="/edit")
	public void getEditMemeberInfo(Model model) {
		String userId = "dooly"; // 로그인 기능 구현 이후에.....
		try {
			MemberVO editMemberInfo = mService.getEditMemberInfo(userId);
			System.out.println(editMemberInfo.toString());
			model.addAttribute("editMemberInfo", editMemberInfo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 9.
	 * @method_name : saveEditInfo
	 * @param :
	 * @param :
	 * @return :
	 * @throws : 
	 * @description : 
	*/
	@RequestMapping(value="/mypage")
	public void saveEditInfo(MemberVO editMember, RedirectAttributes redirectAttributes) {
		System.out.println("수정내용을 저장");
		try {
			mService.saveEditInfo(editMember);
			redirectAttributes.addAttribute("status", "editSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addAttribute("status", "editFail");
		}
		
	}
	
	@RequestMapping("/sendAuthMail")
	public ResponseEntity<String> sendAuthMail(@RequestParam("tmpEmail") String tmpEmail, HttpSession session) {
//		System.out.println("Member Controller : " + tmpEmail + "로 인증메일을 보냅니다.");
		String authCode = UUID.randomUUID().toString();
		System.out.println("인증코드 : " + authCode);
		try {
			new SendMailService().sendMail(tmpEmail, authCode);
			return new ResponseEntity<String>("emailAuthSuccess", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("emailAuthFail", HttpStatus.BAD_REQUEST);
		}
	
	}
}
