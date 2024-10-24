package com.tn.admin.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.TopPublisherVO;
import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.MyResponseWithData;
import com.tn.admin.model.vo.MyResponseWithoutData;
import com.tn.admin.model.vo.OrderDeliveryVO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.model.vo.RestockVO;
import com.tn.admin.model.vo.SalesVO;
import com.tn.admin.service.MemberAdminService;
import com.tn.admin.service.OrderDeliveryService;
import com.tn.admin.service.ProductAdminService;
import com.tn.qa.model.vo.QAVO;
import com.tn.qa.service.QAService;

import com.tn.util.BookFileProcess;

import com.tn.member.model.vo.MemberVO;
import com.tn.member.service.MemberService;
import com.tn.order.model.vo.OrderVO;
import com.tn.order.service.OrderService;
import com.tn.review.model.VO.ReviewVO;
import com.tn.review.service.ReviewService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private ProductAdminService pService;

	@Autowired
	private QAService qaService;

	@Autowired
	private MemberAdminService mService;

	@Autowired
	private ReviewService rService;

	@Autowired
	private OrderService oService;

	@Autowired
	private BookFileProcess fileProcess;

	@Autowired
	private OrderDeliveryService odService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "/admin/home";
	}
	// ================================================= 한준형
	// ===========================================================

	@RequestMapping("/productAdmin")
	// response 객체를 사용할 시에는 반환값 void를 사용해선 안된다. freshAttribute 관련문제
	public String productAdmin(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize,
			@RequestParam(value = "ra", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria, HttpServletRequest request, HttpServletResponse response) {
		
		
		// System.out.println( searchCriteria.toString()+ "을 검색하자");
		PagingInfoDTO dto = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();
		// System.out.println(dto.getPagingSize() + "페이징정보?" + dto.getPageNo());
		Map<String, Object> result = null;

		try {
			result = pService.listAll(dto, searchCriteria, sortBy);
			PagingInfo pi = (PagingInfo) result.get("pagingInfo");
			List<ProductVO> list = (List<ProductVO>) result.get("productList");
			// System.out.println(pi.toString());
			
			
		
			// 검색어가 존재하고, 제목을 검색했을 때만 쿠키에 저장.
			if(searchCriteria.getSearchWord() != null && searchCriteria.getSearchType().equals("title")) {
				
				
				String searchWord = searchCriteria.getSearchWord();
							
				try {
		            // 기존 쿠키 확인
		            Cookie[] cookies = request.getCookies();
		            String searchHistory = "";

		            if (cookies != null) {
		                for (Cookie cookie : cookies) {
		                    if ("recentSearch".equals(cookie.getName())) {
		                        searchHistory = URLDecoder.decode(cookie.getValue(), "UTF-8");
		                        System.out.println("검색 전 " +searchHistory);
		                    }
		                }
		            }

		            // 검색어를 쿠키 값에 추가 (중복 체크)
		            
		            
		            List<String> historyList = new ArrayList<>(List.of(searchHistory.split(",")));
		            
					if(historyList.contains(searchWord)) {
		            	
						historyList.remove(searchWord);
										   
					}

		            historyList.add(0, searchWord); // 가장 앞에 추가
		                
		            	            
		            // 최대 5개의 검색어만 유지
		            if (historyList.size() > 5) {
		                historyList = historyList.subList(0, 5);
		            }

		            for(String L : historyList) {
		            	System.out.println("historyList 에 있는 키워드 검색 후 : "  +L);
		            }
		            // 쿠키에 기록
		            Cookie searchCookie = new Cookie("recentSearch", URLEncoder.encode(String.join(",", historyList), "UTF-8"));
		            searchCookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유효 기간: 7일
		            response.addCookie(searchCookie);
		            
		            
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
				
				
				
			}
			
			model.addAttribute("productList", list); // 데이터 바인딩
			model.addAttribute("pagingInfo", pi);
			model.addAttribute("search", searchCriteria);
			model.addAttribute("ra",sortBy);
		} catch (Exception e) {

			e.printStackTrace();
			model.addAttribute("exception", "error");
		}
		
		return "admin/productAdmin";
	}
		
		
		
		

	// 재입고 목록 페이지로 이동
	@RequestMapping("/restockList")
	public String restockList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize, SearchCriteriaDTO searchCriteria,
			Model model) {

		PagingInfoDTO dto = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();
		// System.out.println(dto.getPagingSize() + "페이징정보?" + dto.getPageNo());
		Map<String, Object> result = null;

		try {
			result = pService.restockList(dto, searchCriteria);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PagingInfo pi = (PagingInfo) result.get("pagingInfo");
		List<RestockVO> list = (List<RestockVO>) result.get("restockList");

		model.addAttribute("restockList", list); // 데이터 바인딩
		model.addAttribute("pagingInfo", pi);

		return "/admin/restockList";
	}

	@RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
	public ResponseEntity<MyResponseWithData> deleteProduct(@RequestParam(value = "delNo") int[] arr) {

		ResponseEntity<MyResponseWithData> result = null;
		try {

			if (pService.deleteProduct(arr) > 0) {
				result = new ResponseEntity(MyResponseWithData.success(), HttpStatus.OK);
			} else {
				result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	@RequestMapping(value = "/soldOutProduct", method = RequestMethod.POST)
	public ResponseEntity<MyResponseWithData> soldOutProduct(@RequestParam(value = "soldOutNo") int[] arr) {

		ResponseEntity<MyResponseWithData> result = null;
		try {

			if (pService.soldOutProduct(arr) > 0) {
				result = new ResponseEntity(MyResponseWithData.success(), HttpStatus.OK);
			} else {
				result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return result;
	}

	@RequestMapping("/modifyProduct")
	public String modifyProduct(@RequestParam("bookNo") int bookNo, Model model) {
		ProductVO product = null;
		try {
			product = pService.read(bookNo);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// System.out.println(product.toString());
		model.addAttribute("product", product);
		return "admin/modifyAdmin";
	}

	@RequestMapping(value = "/upfile", method = RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	// 쪼개져서온 'file' 파일을 재조립해주는 인터페이스 MultipartFile, @RequestParam로 save
	public ResponseEntity<MyResponseWithoutData> saveBoardFile(@RequestParam("file") MultipartFile file,
			@RequestParam("bookNo") int bookNo, HttpServletRequest request) {
		System.out.println(bookNo);
		System.out.println("파일 전송됨, 이제 저장해야함");

		ResponseEntity<MyResponseWithoutData> result = null;

		try {
			BoardUpFileVODTO fileInfo = fileSave(file, request);
			System.out.println("저장된 파일의 정보 : " + fileInfo.toString());
			if (pService.saveImgInfo(fileInfo, bookNo) > 0) {
				MyResponseWithoutData mrw = MyResponseWithoutData.builder().code(200).msg("success").build();

				result = new ResponseEntity<MyResponseWithoutData>(mrw, HttpStatus.OK);
			}

		} catch (Exception e) {

			e.printStackTrace();
			result = new ResponseEntity<MyResponseWithoutData>(HttpStatus.NOT_ACCEPTABLE);
		}

		return result;
	}

	@RequestMapping(value = "/modifySave", method = RequestMethod.POST)
	public String modifySave(ProductVO product, RedirectAttributes redirectAttributes) {
		System.out.println(product.toString());
		try {
			if (pService.modifyProduct(product) > 0) {
				redirectAttributes.addAttribute("status", "success");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirectAttributes.addAttribute("status", "fail");
		}

		//return "redirect:/admin/modifyProduct?bookNo=" + product.getBookNo();
		return "redirect:/admin/productAdmin";
	}

	private BoardUpFileVODTO fileSave(MultipartFile file, HttpServletRequest request) throws IOException {
		// 파일의 기본정보 가져옴
		String contentType = file.getContentType();
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();

		byte[] upfile = file.getBytes();
		System.out.println(originalFileName);
		// 세션 : getSession(),서블릿 정보 : getServletContext() , 경로 : getRealPath()
		System.out.println(
				"서버의 실제 물리적 경로 : " + request.getSession().getServletContext().getRealPath("/resources/bookImgs"));

		String realPath = request.getSession().getServletContext().getRealPath("/resources/bookImgs");

		// 실제 파일 저장 (이름변경, base64, thumbnail)
		BoardUpFileVODTO fileInfo = fileProcess.saveFileToRealPath(upfile, realPath, contentType, originalFileName,
				fileSize);
		return fileInfo;
	}

	@GetMapping("/popularKeywords")
	@ResponseBody
	public List<String> getPopularKeywords(@RequestParam(value = "limit", defaultValue = "10") int limit) {
		List<String> kewords = null;

		try {
			kewords = pService.getPopularKeywords(limit);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kewords;
	}

	@GetMapping("/searchRecommend")
	@ResponseBody
	public Map<String, Object> searchRecommend(@RequestParam("searchWord") String searchWord) {
		Map<String, Object> response = new HashMap<>();
		List<String> rcSearch = null;
		try {
			rcSearch = pService.searchRecommend(searchWord);

			if (pService.searchRecommend(searchWord).size() > 0) {
				// 검색어가 포함된 상품이 있다
				response.put("msg", "isPresent");
				response.put("data", rcSearch);
			} else {
				// 검색어가 포함된 상품이 없다
				response.put("msg", "notPresent");
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

		return response;
	}

	// 찜 기능 테스트

	@PostMapping("/zzimAdd")
	public ResponseEntity<String> addZzim(@RequestParam("userId") String userId, @RequestParam("bookNo") int bookNo) {

		try {
			if (pService.addZzim(userId, bookNo)) { // zzim 테이블에 삽입
				return new ResponseEntity<>("찜 추가 성공", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("찜 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {

			e.printStackTrace();
			return new ResponseEntity<>("찜 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@PostMapping("/zzimRemove")
	public ResponseEntity<String> removeZzim(@RequestParam("userId") String userId,
			@RequestParam("bookNo") int bookNo) {

		try {
			if (pService.removeZzim(userId, bookNo)) { // zzim 테이블에 삽입
				return new ResponseEntity<>("찜 추가 성공", HttpStatus.OK);
			} else {
				return new ResponseEntity<>("찜 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
			}
		} catch (Exception e) {

			e.printStackTrace();
			return new ResponseEntity<>("찜 추가 실패", HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@PostMapping("/zzimCheck")
	public ResponseEntity<String> checkZzim(@RequestParam("userId") String userId,
			@RequestParam("bookNo") Long bookNo) {
		boolean isZzim = false;
		try {
			if (isZzim = pService.checkZzim(userId, bookNo)) {
				return new ResponseEntity<>("성공", HttpStatus.OK);
			}
		} catch (Exception e) {

			e.printStackTrace();
			return new ResponseEntity<>("실패", HttpStatus.INTERNAL_SERVER_ERROR);
		} // 이미 찜했는지 확인

		System.out.println("isZzim의 값 ===========" + isZzim);
		return new ResponseEntity<>("없음", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@PostMapping("/zzimCount")
	public ResponseEntity<String> zzimCount(@RequestParam("userId") String userId) {
		String zzimCount = "";
		try {
			zzimCount = pService.getZzimCount(userId);
			return new ResponseEntity<>(zzimCount, HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();

		}
		System.out.println("zzimCount의 값 ===========" + zzimCount);
		return new ResponseEntity<>("없음", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// ----------------------------------------네이버 책검색

	@RequestMapping("/bookSearch")
	public String showBookSearch() {
		return "/bookSearch";
	}

	@RequestMapping(value = "/searchBook", produces = "application/json; charset=utf-8;")
	public @ResponseBody String searchBook(@RequestParam("searchValue") String query) {
		System.out.println(query + "책을 검색하자");

		String clientId = "A9ocfghRQUMc_xDTTgQG"; // 애플리케이션 클라이언트 아이디
		String clientSecret = "Jot71p0hsd"; // 애플리케이션 클라이언트 시크릿

		String text = null;
		try {
			text = URLEncoder.encode(query, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패", e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/book.json?query=" + text; // JSON 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);

		String responseBody = get(apiURL, requestHeaders); // 응답된 json

		System.out.println(responseBody);

		return responseBody;
	}

	private String get(String apiURL, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiURL);
		try {
			con.setRequestMethod("GET"); // 통신방식 : GET

			// Map<String, String>(api서버에 접속하기위한 id, pwd)를 반복하기 위해 Map.entry<K,V>를 사용
			// 반복하며 request객체의 속성에 넣어줌
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode(); // api서버에 접속하여 응답코드를 얻어옴

			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream()); // api서버가 응답하는 2진데이터를 얻어와 readBody() 호출 input은 내 컴퓨터의 기준에서임(들어온다)
			} else { // 오류 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect(); // api 서버 접속 해제 (finally로 실패했을 경우에도 끊는다.)
		}

	}

	private String readBody(InputStream body) {
		// InputStreamReader는 1byte씩 읽는다
		// BufferedReader를 사용하기 위해 데이터를 우선 읽어준다.

		InputStreamReader streamReader = null;
		try {
			streamReader = new InputStreamReader(body, "UTF-8");
		} catch (UnsupportedEncodingException e1) {

			e1.printStackTrace();
		}

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder(); // StringBuilder 객체 생성(속도가 빠르다고 함)

			String line;
			while ((line = lineReader.readLine()) != null) { // 데이터의 끝이 아닐동안 반복하면서 읽음
				responseBody.append(line);
			}

			return responseBody.toString(); // json문자열 반환
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
		}
	}

	// apiURL 주소로 부터 그 조소의 서버에 접속 할 수 있는 connection객체를 얻어서 반환해주는
	private HttpURLConnection connect(String apiURL) {

		try {
			URL url = new URL(apiURL); // 문자열로 된 서보의 주소를 URL객체로 만듦
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiURL, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiURL, e);
		}

	}

	// ---------------------------------------------------책검색 끝

	// 재입고

	@PostMapping("/restock")
	public ResponseEntity<String> restockBook(@RequestBody Map<String, Object> requestData) {
		// 요청으로부터 받은 데이터
		String title = (String) requestData.get("title");
		String author = (String) requestData.get("author");
		String image = (String) requestData.get("image");
		String timestamp = (String) requestData.get("timestamp");
		String restockNo = "";
		RestockVO restockBook = new RestockVO(restockNo, title, author, image, timestamp);

		try {
			if (pService.insertRestockBook(restockBook) > 0) {
				return new ResponseEntity<>("성공", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

		return new ResponseEntity<>("실패", HttpStatus.INTERNAL_SERVER_ERROR);
	}

	// 차트 구현

	@GetMapping("/bookChart")
	@ResponseBody
	public List<ProductVO> getTopBooks() {

		List<ProductVO> book = null;
		try {
			book = pService.getTopBooks();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return book;
	}

	@GetMapping("/publisherChart")
	@ResponseBody
	public List<TopPublisherVO> publisherChart() {

		List<TopPublisherVO> publisher = null;
		try {
			publisher = pService.getTopPublisher();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return publisher;
	}

	@GetMapping("/salesChart")
	@ResponseBody
	public List<SalesVO> salesChart() {

		List<SalesVO> sales = null;
		try {
			sales = pService.getSales();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sales;
	}

	@PostMapping(value = "/uploadExcel", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String uploadExcel(@RequestParam("file") MultipartFile excelFile) {
		try {
			pService.saveExcelData(excelFile); // 엑셀 파일 처리 후 DB 저장

			return "파일 저장에 성공했습니다.";
		} catch (Exception e) {
			e.printStackTrace();

			return "파일 저장에 실패했습니다. 양식을 확인해주세요.";
		}

	}

	// ================================================= 한준형
	// ===========================================================

	// ===================================================최미설===========================================================//
	// 회원관리페이지
	@RequestMapping("/memberadmin")
	public void memberList(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize,
			@RequestParam(value = "sortBy", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria) {
		Map<String, Object> memberList = null;

		PagingInfoDTO pDTO = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();

		List<MemberVO> list = null;
		Map<String, Object> result = null;
		try {
			result = mService.getAllMember(pDTO, searchCriteria, sortBy);
			list = (List<MemberVO>) result.get("memberList");
			PagingInfo pi = (PagingInfo) result.get("pagingInfo");

			model.addAttribute("pagingInfo", pi); // 데이터 바인딩
			model.addAttribute("memberList", list); // 데이터 바인딩
			model.addAttribute("search", searchCriteria); // 데이터 바인딩
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 회원관리페이지-회원정보상세보기
	@RequestMapping("/memberDetail")
	public String memberDetail(@RequestParam("userId") String userId, Model model) {
		MemberVO memberDetail; // 회원정보
		List<OrderVO> recentOrder = null; // 최근주문내역
		List<ReviewVO> recentReview = null; // 최근리뷰
		try {
			memberDetail = mService.getMemberInfo(userId);
			recentOrder = mService.getRecentOrder(userId);
			recentReview = rService.getRecentReviewForAdmin(userId);
			model.addAttribute("memberDetail", memberDetail);
			model.addAttribute("recentOrder", recentOrder);
			model.addAttribute("recentReview", recentReview);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/memberDetail";
	}

	// 탈퇴한 회원목록
	@RequestMapping("/unregimember")
	public void unregisterMember(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize,
			@RequestParam(value = "sortBy", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria) {
		Map<String, Object> unregiMemberList = null;

		PagingInfoDTO pDTO = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();

		List<MemberVO> list = null;
		Map<String, Object> result = null;
		try {
			result = mService.getUnregiMember(pDTO, searchCriteria, sortBy);
			list = (List<MemberVO>) result.get("unregiMemberList");
			PagingInfo pi = (PagingInfo) result.get("pagingInfo");

			model.addAttribute("pagingInfo", pi); // 데이터 바인딩
			model.addAttribute("unregiMemberList", list); // 데이터 바인딩
			model.addAttribute("search", searchCriteria); // 데이터 바인딩
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 회원정보 삭제
	@RequestMapping(value = "/removeMemberInfo", method = RequestMethod.POST, produces = "application/text; charset=UTF-8;")
	@ResponseBody

	@Transactional
	public String removeMemberInfo (@RequestBody String[] deletedMembers) {
		
		try {
			if (deletedMembers.length > 0) {
				System.out.println("선택회원삭제 : " + deletedMembers.toString());
				for (String deletedMember : deletedMembers) {
					// 리뷰삭제
					rService.removeUndefinedReview(deletedMember);
					// 문의글 삭제
					qaService.removeUndefinedQA(deletedMember);
					// 결제내역 업데이트
					oService.updateUnregisterInfo(deletedMember);
					// 사진 삭제
					String imgPath = mService.getMemberInfo(deletedMember).getUserImg();
					mService.removeImg(imgPath); 
					// 회원정보 삭제
					mService.removeMemberInfo(deletedMember);


				}
			} else {
				System.out.println("회원삭제 실패");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}

	// ===================================================최미설===========================================================//

	@RequestMapping("/registProduct")
	public String registProduct() {

		return "admin/registProduct";
	}

	@RequestMapping(value = "/registSave", method = RequestMethod.POST)
	public String registSave(ProductVO product, @RequestParam("bookImgfile") MultipartFile bookImgfile,
			RedirectAttributes redirectAttributes, HttpServletRequest request) {
		System.out.println(product.toString());
		try {
			BoardUpFileVODTO fileInfo = fileSave(bookImgfile, request);
			if (pService.registSave(product, fileInfo) > 0) {
				redirectAttributes.addAttribute("status", "success");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirectAttributes.addAttribute("status", "fail");
		}

		return "redirect:/admin/productAdmin";
	}

	// 엄영준(start)
	// =============================================================================================================
	// 관리자 페이지 qa게시판
	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 10. 1.
	 * @클래스명 : tnbookstore
	 * @메서드명 : qaAnswerView
	 * @param
	 * @param
	 * @return : String
	 * @throws
	 * @description : 관리자페이지의 qa게시판으로 이동하는 메서드
	 *
	 */
	@RequestMapping("/qaAnswerView")
	public String qaAnswerView(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize,
			@RequestParam(value = "ra", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria) {

		// 페이징 정보를 가지고 있는 DTO
		PagingInfoDTO dto = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();
		Map<String, Object> result = null;

		List<QAVO> list = new ArrayList<QAVO>();
		try {
			result = qaService.getAllQAList(dto, searchCriteria, sortBy);

			PagingInfo pi = (PagingInfo) result.get("pagingInfo");
			list = (List<QAVO>) result.get("list");
			// System.out.println(pi.toString());

			model.addAttribute("productList", list); // 데이터 바인딩
			model.addAttribute("pagingInfo", pi);
			model.addAttribute("search", searchCriteria);
			model.addAttribute("ra", sortBy);

			model.addAttribute("qaList", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/admin/qaAnswerView";
	}

	/**
	 * @작성자 : 엄영준
	 * @작성일 : 2024. 10. 1.
	 * @클래스명 : tnbookstore
	 * @메서드명 : qaAnswer
	 * @param
	 * @param
	 * @return : void
	 * @throws
	 * @description admin/qaAnswer.jsp로 이동시키는 메서드
	 *
	 */
	@RequestMapping("/qaAnswer")
	public void qaAnswer(@RequestParam("qNo") int qNo, Model model) {
		try {
			QAVO qa = qaService.getDetail(qNo);
			model.addAttribute("qa", qa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@RequestMapping("/qaAnswerSave")
	public String qaAnswerSave(QAVO qa, Model model) {
		String returnPage = "redirect:/admin/qaAnswer";
		try {
			int result = qaService.qaAnswerSave(qa);

			if (result == 1) {
				model.addAttribute("status", "success");
				returnPage = "redirect:/admin/qaAnswerView";
			} else {
				model.addAttribute("status", "fail");
			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("status", "fail");
		}

		return returnPage;

	}

	@RequestMapping("/getVisitorHistory")
	public ResponseEntity<Map<String, Object>> getVisitorHistory() {
		Map<String, Object> resultMap = new HashMap<String, Object>();

		ResponseEntity<Map<String, Object>> result = null;

		try {
			resultMap = mService.getVisitorHistory();
			result = new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;

	}

	// 엄영준(end)
	// =============================================================================================================

// -----------------------------------------박근영-------------------------------------------------

	@RequestMapping("/orderDelivery")
	public String orderDelivery() {
		// 리퀘스트 파라미터로 기본 정보만 넘김
		return "redirect:/admin/orderDeliveryAdmin";
	}

	@RequestMapping("/orderDeliveryAdmin")
	public String orderDeliveryAdmin(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize,
			@RequestParam(value = "ra", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println(pageNo + "페이징 확인" + pagingSize + "서치" + searchCriteria + "알에이" + sortBy);
		PagingInfoDTO dto = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();
		Map<String, Object> result = null;

		try {
			// 페이징된 주문 목록 가져오기
			result = odService.listAllOrderDelivery(dto, searchCriteria, sortBy);
			PagingInfo pi = (PagingInfo) result.get("pagingInfo");

			List<OrderDeliveryVO> orderList = (List<OrderDeliveryVO>) result.get("orderList");
			System.out.println("보내기전 확인" + pi + "오더리스트도 확인 :" + orderList);

			model.addAttribute("odInfo", orderList); // 페이징된 주문 목록 데이터 바인딩
			model.addAttribute("pagingInfo", pi);
			model.addAttribute("search", searchCriteria);
			model.addAttribute("ra", sortBy);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("exception", "error");
		}

		return "/admin/orderDeliveryAdmin";
	}

	@RequestMapping("/cancelOrders")
	public ResponseEntity<String> cancelOrders(@RequestBody List<String> orderNos) {
		System.out.println("진입 확인 cancelOrders" + orderNos);
		try {
			odService.cancelOrder(orderNos);

			return new ResponseEntity<String>("취소 성공", HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<String>("취소 실패", HttpStatus.NOT_ACCEPTABLE);
		}

	}

// -----------------------------------------박근영-------------------------------------------------

}
