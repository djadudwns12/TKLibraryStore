package com.tn.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.BoardUpFileVODTO;
import com.tn.admin.model.vo.MyResponseWithData;
import com.tn.admin.model.vo.MyResponseWithoutData;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.MemberAdminService;
import com.tn.admin.service.ProductAdminService;
import com.tn.admin.utils.FileProcess;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.service.MemberService;
import com.tn.order.model.vo.OrderVO;
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
	private MemberAdminService mService;
	@Autowired
	private ReviewService rService;
	
	@Autowired
	private FileProcess fileProcess;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {		
		return "/admin/home";
	}
	
	@RequestMapping("/productAdmin")
	public void productAdmin(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize, 
			@RequestParam(value="ra", defaultValue = "default") String sortBy, SearchCriteriaDTO searchCriteria) {
		
		//System.out.println( searchCriteria.toString()+ "을 검색하자");
		PagingInfoDTO dto = PagingInfoDTO.builder().pageNo(pageNo).pagingSize(pagingSize).build();
		//System.out.println(dto.getPagingSize() +  "페이징정보?" + dto.getPageNo());
		Map<String, Object> result = null;
		
		try {			
				result = pService.listAll(dto, searchCriteria, sortBy); 
				PagingInfo pi = (PagingInfo) result.get("pagingInfo");			
				List<ProductVO> list = (List<ProductVO>) result.get("productList");
				//System.out.println(pi.toString());
				
				model.addAttribute("productList", list); // 데이터 바인딩
				model.addAttribute("pagingInfo", pi);
				model.addAttribute("search", searchCriteria);
			} catch (Exception e) {
			
			e.printStackTrace();
			model.addAttribute("exception", "error");
			} 
		}
	
	@RequestMapping(value="/deleteProduct", method=RequestMethod.POST)
	public ResponseEntity<MyResponseWithData> deleteProduct(@RequestParam(value="delNo") int[] arr) {
		
		ResponseEntity<MyResponseWithData> result = null;
		try {
			
			if(pService.deleteProduct(arr)>0) {
				result = new ResponseEntity(MyResponseWithData.success(), HttpStatus.OK);
			} else {
				result = new ResponseEntity(MyResponseWithData.fail(), HttpStatus.BAD_REQUEST);
			}
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		return result;
	}
	
	@RequestMapping(value="/soldOutProduct", method=RequestMethod.POST)
	public ResponseEntity<MyResponseWithData> soldOutProduct(@RequestParam(value="soldOutNo") int[] arr) {
		
		ResponseEntity<MyResponseWithData> result = null;
		try {
			
			if(pService.soldOutProduct(arr)>0) {
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
		System.out.println(product.toString());
		model.addAttribute("product",product);
		return "admin/modifyAdmin";
	}
	
	@RequestMapping(value ="/upfile" ,method = RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	//쪼개져서온 'file' 파일을 재조립해주는 인터페이스 MultipartFile, @RequestParam로 save
	public ResponseEntity<MyResponseWithoutData> saveBoardFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {	
		System.out.println("파일 전송됨, 이제 저장해야함");
		
		ResponseEntity<MyResponseWithoutData> result = null;
		
		try {
			System.out.println(Arrays.toString(file.getBytes()));
			
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		try {
			BoardUpFileVODTO fileInfo = fileSave(file, request);
			System.out.println("저장된 파일의 정보 : " + fileInfo.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
//		try {
//			BoardUpFileVODTO fileInfo = fileSave(file, request);
//											
//			MyResponseWithoutData mrw = MyResponseWithoutData.builder()
//				.code(200)
//				.msg("success")
//				.newFileName(tmp)
//				.build();
//			
//			result = new ResponseEntity<MyResponseWithoutData>(mrw, HttpStatus.OK);
//		} catch (IOException e) {
//			
//			e.printStackTrace();
//			result = new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
//		}
			
		return null;
	}
	
	private BoardUpFileVODTO fileSave(MultipartFile file, HttpServletRequest request) throws IOException {
		//파일의 기본정보 가져옴
		String contentType = file.getContentType();
		String originalFileName = file.getOriginalFilename();
		long fileSize = file.getSize();
		
		byte[] upfile = file.getBytes();
		
		//세션 : getSession(),서블릿 정보 : getServletContext() , 경로 : getRealPath()
		System.out.println("서버의 실제 물리적 경로 : " + request.getSession().getServletContext().getRealPath("/resources/boardUpFiles"));
		
		String realPath = request.getSession().getServletContext().getRealPath("/resources/boardUpFiles");
		
		// 실제 파일 저장 (이름변경, base64, thumbnail)
		BoardUpFileVODTO fileInfo = fileProcess.saveFileToRealPath(upfile, realPath, contentType, originalFileName, fileSize);
		return fileInfo;
	}
	//========================================최미설===================================//
	// 회원관리페이지
	@RequestMapping("/memberadmin")
	public void memberList(Model model, @RequestParam(value = "pageNo", defaultValue = "1") int pageNo,
			@RequestParam(value = "pagingSize", defaultValue = "10") int pagingSize, @RequestParam(value="sortBy", defaultValue = "default") String sortBy,
			SearchCriteriaDTO searchCriteria) {
		Map<String, Object> memberList = null;

		PagingInfoDTO pDTO = PagingInfoDTO.builder()
				.pageNo(pageNo)
				.pagingSize(pagingSize)
				.build(); 
		
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
		System.out.println("MemberAdminController : " + result.toString());
		
	}
	
	// 회원관리페이지-회원정보상세보기
	@RequestMapping("/memberDetail")
	public String memberDetail(@RequestParam("userId")String userId, Model model) {
		System.out.println("일단 서비스단에는 오네요.....");
		MemberVO memberDetail; // 회원정보
		List<OrderVO> recentOrder = null; // 최근주문내역
		List<ReviewVO> recentReview = null; // 최근리뷰
		try {
			memberDetail = mService.getMemberInfo(userId);
			recentOrder = mService.getRecentOrder(userId);
			recentReview = rService.getRecentReview(userId);
			model.addAttribute("memberDetail", memberDetail);
			model.addAttribute("recentOrder", recentOrder);
			model.addAttribute("recentReview", recentReview);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/memberDetail";
	}
	
	

}
