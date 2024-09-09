package com.tn.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.member.model.vo.MemberVO;
import com.tn.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
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
	
	@RequestMapping(value="/mypage")
	public void saveEditInfo() {
		System.out.println("수정내용을 저장해보자");

	}
	
	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 9. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : loginPage
	 * @param
	 * @param
	 * @return : void
	 * @throws 
	 * @description : 로그인 페이지로 이동하는 메서드
	 *
	 */
	@RequestMapping("/loginPage")
	public void loginPage() {
		System.out.println("로그인 페이지로 이동");
	}
	
	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 9. 9. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : login
	 * @param
	 * @param
	 * @return : void
	 * @throws 
	 * @description : 회원을 로그인 시키는 메서드
	 *
	 */
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public void login(@RequestParam("userId") String userId , @RequestParam("userPwd") String userPwd) {
		System.out.println(userId+": "+ userPwd);
		// 로그인 시키는 메서드
		try {
			MemberVO loginMember = mService.loginMember(userId,userPwd);
			System.out.println(loginMember);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
