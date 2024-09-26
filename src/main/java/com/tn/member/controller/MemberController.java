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





import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;


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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.ProfileResponseWithoutData;
import com.tn.member.model.vo.ProfileUpImgVODTO;
import com.tn.member.service.MemberService;
import com.tn.member.service.SendMailService;


import org.springframework.web.bind.annotation.PostMapping;


import com.tn.util.PropertiesTask;

import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService mService;
	
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
	public void login(@RequestParam("userId") String userId , @RequestParam("userPwd") String userPwd,HttpSession session) {
		System.out.println(userId+": "+ userPwd);
		// 로그인 시키는 메서드
		try {
			MemberVO loginMember = mService.loginMember(userId,userPwd);
			
			if(loginMember != null) {
				System.out.println(loginMember);
				// 로그인 한 유저 세션에 저장하기
				session.setAttribute("loginMember", loginMember);
			}
			else { // 로그인 실패시 
				System.out.println("로그인 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	

	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 6.
	 * @method_name : getMemberInfo
	 * @param :String userId(로그인 기능 구현 이후 세션에서 로그인 정보 받아와서 파라미터로 받을 예정)
	 * @param :Model model
	 * @return : memberVO
	 * @throws : 
	 * @description : 회원정보수정을 위해 회원정보를 불러오는 메서드
	*/
	
	@RequestMapping(value="/edit")
	public void getEditMemeberInfo(Model model) { // @RequestParam("userId") String userId
		String userId = "dooly"; // 회원정보수정 페이지 완료하면 로그인 정보 가져오기!
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
	 * @클래스명 : MemberController
	 * @메서드명 : saveEditInfo
	 * @param : MemberDTO, RedirectAttributes
	 * @return : void
	 * @throws 
	 * @description : 회원정보수정 페이지에서 수정된 정보를 저장하는 메서드
	 *
	 */
	@RequestMapping(value="/mypage")
	public void saveEditInfo(MemberDTO editMember, RedirectAttributes redirectAttributes) {
		
		try {
			mService.saveEditInfo(editMember);
			redirectAttributes.addAttribute("status", "editSuccess");
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addAttribute("status", "editFail");
		}
		
	}
	
	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 9. 
	 * @클래스명 : MemberController
	 * @메서드명 : sendAuthMail
	 * @param : @RequestParam("tmpEmail") String, HttpSession
	 * @return : ResponseEntity<String>
	 * @throws 
	 * @description : 회원정보수정 페이지에서 이메일인증을 위해 인증코드를 생성하고 메일을 보내는 메서드
	 */
	@RequestMapping("/sendAuthMail")
	public ResponseEntity<String> sendAuthMail(@RequestParam("tmpEmail") String tmpEmail, HttpSession session) {
		String authCode = UUID.randomUUID().toString();
		try {
//			new SendMailService().sendMail(tmpEmail, authCode); // 이메일 전송 메서드 구현 완료... 
			session.setAttribute("emailAuthCode", authCode);
			System.out.println("인증코드 : " + authCode);
			return new ResponseEntity<String>("emailAuthSend", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("emailSendFail", HttpStatus.BAD_REQUEST);
		}
	
	}
	
	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 9. 
	 * @클래스명 : MemberController
	 * @메서드명 : checkAuthMail
	 * @param : @RequestParam("userAuthCode")String, HttpSession
	 * @return : ResponseEntity<String>
	 * @throws 
	 * @description : 회원정보수정 페이지에서 이메일인증코드를 확인하는 메서드
	 */
	@RequestMapping("/checkEmailAuthCode")
	public ResponseEntity<String> checkAuthMail(@RequestParam("userAuthCode")String userAuthCode, HttpSession session) {
		String result = "fail";
		if (session.getAttribute("emailAuthCode") != null) {
			String sesAuthCode = (String) session.getAttribute("emailAuthCode");
			if (userAuthCode.equals(sesAuthCode)) {
				result = "success";
				session.removeAttribute("authCode");
			}
		}
		return new ResponseEntity<String>(result, HttpStatus.OK);
		
	}
	/**
	 * @작성자 : 최미설
	 * @작성일 : 2024. 9. 25. 
	 * @클래스명 : MemberController
	 * @메서드명 : clearCode
	 * @param : HttpSession session
	 * @return : ResponseEntity<String>
	 * @description : 이메일인증시간이 만료되면 세션의 코드를 지우는 메서드
	 */
	@RequestMapping("/clearAuthCode")
	public ResponseEntity<String> clearCode(HttpSession session) {
		if (session.getAttribute("emailAuthCode") != null) {
			session.removeAttribute("emailAuthCode"); // attribute 속성을 지운다...
		}

		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/**
	 * @작성자 : 802-10
	 * @작성일 : 2024. 9. 9. 
	 * @클래스명 : tnbookstore
	 * @메서드명 : logout
	 * @param
	 * @param
	 * @return : void
	 * @throws 
	 * @description : 로그아웃시키는 메서드
	 *
	 */
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃 이전의 세션값 : "+session.getId());
		
		if(session.getAttribute("loginMember") != null) {
			// 세션에 저장했던 값들을 지우고, 
			session.removeAttribute("loginMember");
			// 세션 무효화
			session.invalidate();
		}
		
		System.out.println("로그아웃 이후의 세션값 : "+session.getId()); // 로그아웃 한다고 세션이 사라지지는 않는다. 세션의 값만 무효화
		
		return "redirect:/";
  }
	
	
	


	
// -----------------------------------------박근영-------------------------------------------------
	
	
	/*
	 * @RequestMapping(value = "/upfiles", method = RequestMethod.POST, produces =
	 * "application/json; charset=UTF-8;") public
	 * ResponseEntity<ProfileResponseWithoutData>
	 * saveBoardFile(@RequestParam("file") MultipartFile file, HttpServletRequest
	 * request) { System.out.println("파일 전송됨... 이제 저장해야 함......");
	 * 
	 * ResponseEntity<ProfileResponseWithoutData> result = null;
	 * 
	 * try { ProfileUpImgVODTO fileInfo = fileSave(file, request);
	 * 
	 * this.uploadFileList.add(fileInfo);
	 * 
	 * // 7월 17일 가장 먼저 해야 할 코드 : front에서 업로드한 파일을 지웠을때 백엔드에서도 지워야 한다.
	 * System.out.println(
	 * "=================================================================");
	 * System.out.println("현재 파일리스트에 있는 파일들"); for (UpProfileImgVODTO f :
	 * this.uploadFileList) { System.out.println(f.toString()); }
	 * System.out.println(
	 * "=================================================================");
	 * 
	 * String tmp = null; if (fileInfo.getThumbFileName() != null) { // 이미지 tmp =
	 * fileInfo.getThumbFileName(); } else { tmp =
	 * fileInfo.getNewFileName().substring(fileInfo.getNewFileName().lastIndexOf(
	 * File.separator) + 1); }
	 * 
	 * ProfileResponseWithoutData mrw =
	 * ProfileResponseWithoutData.builder().code(200).msg("success").newFileName(
	 * tmp) .build();
	 * 
	 * // 저장된 새로운 파일이름을 json으로 return 시키도록 하자... result = new
	 * ResponseEntity<ProfileResponseWithoutData>(mrw, HttpStatus.OK);
	 * 
	 * } catch (IOException e) { e.printStackTrace();
	 * 
	 * result = new
	 * ResponseEntity<ProfileResponseWithoutData>(HttpStatus.NOT_ACCEPTABLE);
	 * 
	 * }
	 * 
	 * return result;
	 * 
	 * }
	 * 
	 * private ProfileUpImgVODTO fileSave(MultipartFile file, HttpServletRequest
	 * request) throws IOException { // 파일의 기본정보 가져옴 String contentType =
	 * file.getContentType(); String originalFileName = file.getOriginalFilename();
	 * 
	 * byte[] upfile = file.getBytes(); // 파일의 실제 데이터를 읽어옴
	 * 
	 * String realPath =
	 * request.getSession().getServletContext().getRealPath("/resources/profileImgs"
	 * );
	 * 
	 * // 실제파일 저장(이름변경, base64, thumbnail) ProfileUpImgVODTO fileInfo =
	 * fileProcess.saveFileToRealPath(upfile, realPath, contentType,
	 * originalFileName); return fileInfo; }
	 */
	
	
	
	@RequestMapping(value="/register")
	   public String registerMember() {
		
			return "register";
		}
	
	
	@RequestMapping(value = "/coolsms" , method = RequestMethod.POST)
	public ResponseEntity<Integer> coolSms(@RequestParam("phone") String phone) {
		System.out.println("컨트롤 확인");
		try {
			return mService.sendOne(phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			 return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1);  // -1로 에러 표시
		}

	}
	
	@RequestMapping(value="/getAddr") 
	public void getAddrApi(HttpServletRequest req, HttpServletResponse response){ 
	    try {
	        // 요청변수 설정 
	        String currentPage = "1"; 
	        String countPerPage = "10"; 
	        String resultType = "json"; 
	        String confmKey = PropertiesTask.getPropertiesValue("jusoConfmKey");  // IOException 발생 가능
	        String keyword = req.getParameter("keyword"); 

	        // API 호출 URL 정보 설정 
	        String apiUrl = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage +
	                        "&countPerPage=" + countPerPage + 
	                        "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + 
	                        "&confmKey=" + confmKey + 
	                        "&resultType=" + resultType; 

	        URL url = new URL(apiUrl);  
	        BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8")); 
	        StringBuffer sb = new StringBuffer(); 
	        String tempStr = null; 
	        while ((tempStr = br.readLine()) != null) { 
	            sb.append(tempStr);  // 응답결과 JSON 저장  
	        } 
	        br.close(); 
	        response.setCharacterEncoding("UTF-8"); 
	        response.setContentType("text/xml"); 
	        response.getWriter().write(sb.toString()); // 응답결과 반환 
	    } catch (IOException e) {
	        e.printStackTrace();  // IOException을 처리
	        response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);  // 에러 상태를 반환
	    }
	}
	
	// -----------------------------------------박근영-------------------------------------------------
	
	
	
	
	
	
	

}
