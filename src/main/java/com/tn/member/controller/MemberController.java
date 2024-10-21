package com.tn.member.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
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

import org.aspectj.weaver.ast.Or;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.MyResponseWithoutData;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.ProductAdminService;
import com.tn.booklist.model.vo.BooklistVO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.RegisterDTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.MyAddressVO;
import com.tn.member.model.dto.MyAddressDTO;
import com.tn.member.model.vo.PointLogVO;
import com.tn.member.model.vo.ProfileResponseWithoutData;
import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.service.MemberService;
import com.tn.member.service.SendMailService;
import com.tn.order.model.vo.OrderBookVO;
import com.tn.order.model.vo.OrderVO;
import com.tn.order.service.OrderService;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.tn.util.ProfileFileProcess;
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
	@Autowired
	private OrderService oService;
	@Autowired
	private ProductAdminService pService;
	
	@Autowired
	private ProfileFileProcess fileProcess;
	
// -------------------------------- 김가윤 --------------------------------
	
	@RequestMapping("/address")
	public String bringAddress(Model model, HttpSession session) {
		String userId = ((MemberVO)session.getAttribute("loginMember")).getUserId();
		
		try {
			List<MyAddressVO> list = mService.getAddressList(userId);
			
			model.addAttribute("address", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/member/address";
	}
	
	@RequestMapping("/insertAddress")
	public void goInsertAddress() {
		
	}
	
	@RequestMapping("/modifyAddress")
	public String modifyAddress(Model model, @RequestParam("addressId") int addressId) {
		// 수정 페이지에 addressId로 기존 정보 가져오기
		try {
			MyAddressVO address = mService.selectById(addressId);
			
			model.addAttribute("address", address);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "/member/modifyAddress";
	}
	
	@PostMapping(value="/insertNewAddress", produces = "application/text; charset=UTF-8;")
	public ResponseEntity<String> insertAddress(@RequestBody MyAddressDTO addressDTO, HttpSession session) {
		// 세션에서 로그인된 사용자의 정보 가져오기
	    MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	    System.out.println("배송지 목록을 수정하려는 유저의 아이디 : " + loginMember.getUserId());
	    
	    // addressDTO에 userId 설정
	    addressDTO.setUserId(loginMember.getUserId());
	    
	    try {
	        mService.insertAddress(addressDTO);

	        System.out.println("추가할 주소 내용 : " + addressDTO.toString());
	        return ResponseEntity.ok("추가 완료.");
	       
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 로그 출력
	        // 예외 발생 시 500 서버 오류 응답
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("추가 실패");
	    }
	}
	
	@PostMapping(value="/saveModifyAddress", produces = "application/text; charset=UTF-8;")
	public ResponseEntity<String> saveModifyAddress(@RequestBody MyAddressDTO addressDTO, HttpSession session) {
		
		// 세션에서 로그인된 사용자의 정보 가져오기
	    MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	    System.out.println("배송지 목록을 수정하려는 유저의 아이디 : " + loginMember.getUserId());
	    
	    // addressDTO에 userId 설정
	    addressDTO.setUserId(loginMember.getUserId());
		
	    try {
	        mService.modifyUpdateAddress(addressDTO);

	        System.out.println("수정할 주소 내용 : " + addressDTO.toString());
	        return ResponseEntity.ok("수정되었습니다.");
	       
	    } catch (Exception e) {
	        e.printStackTrace(); // 예외 로그 출력
	        // 예외 발생 시 500 서버 오류 응답
	        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("수정 실패");
	    }
	}
	
	@PostMapping(value="/removeAddr", produces = "application/text; charset=UTF-8;")
	public ResponseEntity<String> removeAddr(@RequestParam("addressId") int addressId) {
		
		try {
			mService.removeAddress(addressId);
			
			return ResponseEntity.ok("삭제 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("주소 삭제 실패");
		}
	}
	

// -------------------------------- 김가윤 --------------------------------

	
//	-------------------------------------------------------------(엄영준) Start-----------------------------------------------------------------------------------
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
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void login(@RequestParam("userId") String userId, @RequestParam("userPwd") String userPwd, 
			HttpSession session,Model model) {
		System.out.println(userId + ": " + userPwd);
		// 로그인 시키는 메서드
		try {
			MemberVO loginMember = mService.loginMember(userId, userPwd);

			if (loginMember != null) {
				System.out.println(loginMember);
				// 로그인 한 유저 세션에 저장하기
				session.setAttribute("loginMember", loginMember);
				model.addAttribute("status", "loginSuccess");
				// 방문자 수에 추가하는 메서드
				boolean addVisitHistory =  mService.addVisitHistory();
				System.out.println("방문자 추가 성공여부 : "+ addVisitHistory);
				
			} else { // 로그인 실패시
				System.out.println("로그인 실패");
				model.addAttribute("status", "loginFail");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
		System.out.println("로그아웃 이전의 세션값 : " + session.getId());

		if (session.getAttribute("loginMember") != null) {
			// 세션에 저장했던 값들을 지우고,
			session.removeAttribute("loginMember");
			// 세션 무효화
			session.invalidate();
		}

		System.out.println("로그아웃 이후의 세션값 : " + session.getId()); // 로그아웃 한다고 세션이 사라지지는 않는다. 세션의 값만 무효화

		return "redirect:/";
	}
//	/**
//	 * @작성자 : 엄영준
//	 * @작성일 : 2024. 9. 27. 
//	 * @클래스명 : tnbookstore
//	 * @메서드명 : gotomyPage
//	 * @param
//	 * @param
//	 * @return : void
//	 * @throws 
//	 * @description : 마이페이지로 이동하는 메서드
//	 *
//	 */
//	@RequestMapping("/myPage")
//	public void gotoMyPage(Model model,HttpSession sess) {
//		model.addAttribute("loginMember", (MemberVO)sess.getAttribute("loginMember"));
//	}
	@RequestMapping("/OrderStatus")
	public String OrderStatus(HttpSession sess,Model model) {
		
		try {
			// 회원의 정보 불러오기
			MemberVO loginMember = (MemberVO) sess.getAttribute("loginMember");
			// 회원이 주문한 목록을 불러오는 메서드
			List<OrderVO> orderList =oService.getOrderList(MemberDTO.builder().userId(loginMember.getUserId()).build());
			
			System.out.println(orderList.toString());
			
			model.addAttribute("orderList", orderList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return "/member/OrderStatus";
	}
	
	
//-------------------------------------------------------------(엄영준) END-----------------------------------------------------------------------------------

	@RequestMapping(value = "/mypage")
	public String myPage(MemberDTO loginMember,Model model,HttpSession sess) {

		try {
			
			
			loginMember.setUserId(((MemberVO)sess.getAttribute("loginMember")).getUserId());
			// 회원정보를 불러오는 부분? 근데 왜 세션에서 불러옴? 뷰단에서 세션을 불러도될것으로 보임
			model.addAttribute("loginMember", (MemberVO) sess.getAttribute("loginMember"));
			
			// 회원의 주문목록을 불러오는 메서드
			List<OrderBookVO> list = oService.getRecentOrderList(loginMember);
			
			// 회원의 찜목록을 불러오는 메서드
			List<BooklistVO> zzimList = pService.getZzimList(loginMember);
			
			// 회원의 포인트 적립내역을 가지고 오는 메서드
			List<PointLogVO> pointList = mService.getPointLog(loginMember);
			
			
			
			System.out.println(list);
			System.out.println(zzimList);
			
			//model.addAttribute("orderList", list);
			model.addAttribute("orderList", list);
			model.addAttribute("zzimList", zzimList);
			model.addAttribute("pointList", pointList);
			model.addAttribute("status", "editSuccess");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "/member/mypage";

	}
//-------------------------------------------------------------(엄영준) END-----------------------------------------------------------------------------------


	// -----------------------------------------최미설-------------------------------------------------

	// 회원정보 불러오기
	@RequestMapping("/edit")
	public void getEditMember(HttpServletRequest request) {
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
//		MemberVO loginMember = mService.getEditMemberInfo(((MemberVO)ses.getAttribute("loginMember")).getUserId()); // HttpSession ses
		String userId = loginMember.getUserId();
		try {
			MemberVO editMember = mService.getEditMemberInfo(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	// 회원정보 수정 > 저장
	@RequestMapping("/saveMemberEdit")
	public String modifyInfoSave (MemberVO editMember, RedirectAttributes redirectAttributes) {
		try {
			if(mService.saveEditInfo(editMember)) {
				redirectAttributes.addAttribute("editStatus", "success");
				return "/member/mypage";
			}
		} catch (Exception e) {
			redirectAttributes.addAttribute("editStatus", "fail");
			e.printStackTrace();
		}
		return "redirect:/member/edit";
	}
	
	// 회원 이미지 변경>저장	// 쪼개져서온 'file' 파일을 재조립해주는 인터페이스 MultipartFile, @RequestParam로 save
	@RequestMapping(value = "/profileImgEdit", method = RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	public ResponseEntity<MyResponseWithoutData> saveMemberWithFile(@RequestParam(value="file", required = false) MultipartFile file,
			@RequestParam(value="userId", required = false)String userId, HttpServletRequest request) {
		ResponseEntity<MyResponseWithoutData> result = null;

		try {
			ImgFileVODTO fileInfo = fileSave(file, userId, request);
			if (mService.saveEditImg(fileInfo, userId)) {
				MyResponseWithoutData mrw = MyResponseWithoutData.builder()
						.code(200)
						.msg("success")
						.build();
				result = new ResponseEntity<MyResponseWithoutData>(mrw, HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<MyResponseWithoutData>(HttpStatus.NOT_ACCEPTABLE);
		}

		return result;
	}	

	// 회원 비밀번호 저장
	@RequestMapping(value="/pwdChange", method = RequestMethod.POST, produces = "application/text; charset=UTF-8;") 
	@ResponseBody
//	public void savePwdChange (@RequestParam(value="userPwd")String userPwd, @RequestParam(value="userId")String userId){
	public String savePwdChange (@RequestBody Map<String, String> userInfo){
		System.out.println(userInfo);
		String userPwd = userInfo.get("userPwd");
		String userId = userInfo.get("userId");
		System.out.println("비번, 아이디 : " + userPwd + ", " + userId);
		try {
			mService.saveEditPwd(userPwd, userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
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
	public ResponseEntity<String> checkAuthMail(@RequestParam("userAuthCode") String userAuthCode,
			HttpSession session) {
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



	@RequestMapping("/deletemember")
	public void deleteMember() {
	}
	
	@RequestMapping("/deleteconfirm")
	public String deleteMember(HttpSession ses) {
		System.out.println("MemberController deleteMember() : " + ses.getAttribute("loginMember"));
		// 회원수정페이지 하단에 '회원탈퇴 버튼을 눌러서 페이지 이동
		// 회원탈퇴 페이지에서 안내문 하단의 체크박스 체크 후 버튼을 누르면 회원탈퇴 처리
		try {
			MemberVO memberVO = (MemberVO)ses.getAttribute("loginMember");
			String userId = memberVO.getUserId();
			if(oService.checkRemainOrder(userId)) {
				System.out.println("MemberController deleteMember() : " + userId + "회원정보 삭제요청..");
				mService.deleteMember(userId);
				logout(ses); // 로그아웃 및 세션에 저장된 회원정보 무효화
				return "redirect:/";
			}
			
		} catch (Exception e) {
			e.printStackTrace(); 
			return "redirect:/member/loginPage";
		}
		return "redirect:/";
	}
	
	
// -----------------------------------------박근영-------------------------------------------------
	@PostMapping(value = "/checkedDupl")
	public ResponseEntity<String> checkedDupl(@RequestParam(value = "tmpUserId") String tmpUserId){
		ResponseEntity<String> result = null;
		try {
			if(mService.compareId(tmpUserId)) {
				result = new ResponseEntity<String>("duplicate", HttpStatus.OK);
				
			} else {
				result = new ResponseEntity<String>("notDuplicate", HttpStatus.OK);
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = new ResponseEntity<String>(HttpStatus.NOT_ACCEPTABLE);
		}
		
		
		
		return result;
		
	}
	
	//박근영
	@PostMapping(value = "/register")
	public ResponseEntity<Void> register(
	        @RequestParam(value = "imgFile", required = false) MultipartFile imgFile, // 파일 처리
	        HttpServletRequest request, // request 객체로 전송된 파일 접근
	        @ModelAttribute RegisterDTO registerDTO) { // 일반 폼 필드 수신
		
		String userId = registerDTO.getUserId();
		ResponseEntity<Void> result = null;

		try {
			if(imgFile != null && !imgFile.isEmpty()) {
			ImgFileVODTO fileInfo = fileSave(imgFile, userId, request);
			
			if(mService.registerMember(registerDTO, fileInfo)) {
				result = new ResponseEntity<Void>(HttpStatus.OK);
			}
			
		}
			
			System.out.println("결과를 보냅니다 파일 저장 완료");
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = new ResponseEntity<Void>(HttpStatus.NOT_ACCEPTABLE);
		}

		return result;
	}
	
	//박근영
	private ImgFileVODTO fileSave(MultipartFile imgFile, String userId, HttpServletRequest request) { // 파일의 기본정보 가져옴 
		
		String originalFileName = imgFile.getOriginalFilename();
		System.out.println("여긴는" + originalFileName);
		ImgFileVODTO fileInfo = null;
		byte[] upfile;
		try {
			upfile = imgFile.getBytes();
			// 파일의 실제 데이터를 읽어옴
			String realPath = request.getSession().getServletContext().getRealPath("/resources/profileImgs");
			
			fileInfo = fileProcess.saveFileToRealPath(upfile, realPath, userId, originalFileName); 
			
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return fileInfo; 
	}
	  
	 //박근영
	@RequestMapping(value = "/register")
	public String registerMember() {

		return "register";
	}

	//박근영
	@RequestMapping(value = "/coolsms", method = RequestMethod.POST)
	public ResponseEntity<Integer> coolSms(@RequestParam("phone") String phone) {
		System.out.println("컨트롤 확인");
		try {
			return mService.sendOne(phone);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(-1); // -1로 에러 표시
		}

	}

	//박근영
	@RequestMapping(value = "/getAddr")
	public void getAddrApi(HttpServletRequest req, HttpServletResponse response) {
		try {
			// 요청변수 설정
			String currentPage = "1";
			String countPerPage = "10";
			String resultType = "json";
			String confmKey = PropertiesTask.getPropertiesValue("jusoConfmKey"); // IOException 발생 가능
			String keyword = req.getParameter("keyword");

			// API 호출 URL 정보 설정
			String apiUrl = "https://business.juso.go.kr/addrlink/addrLinkApi.do?currentPage=" + currentPage
					+ "&countPerPage=" + countPerPage + "&keyword=" + URLEncoder.encode(keyword, "UTF-8") + "&confmKey="
					+ confmKey + "&resultType=" + resultType;

			URL url = new URL(apiUrl);
			BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			String tempStr = null;
			while ((tempStr = br.readLine()) != null) {
				sb.append(tempStr); // 응답결과 JSON 저장
			}
			br.close();
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/xml");
			response.getWriter().write(sb.toString()); // 응답결과 반환
		} catch (IOException e) {
			e.printStackTrace(); // IOException을 처리
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 에러 상태를 반환
		}
	}

// -----------------------------------------박근영-------------------------------------------------

}
