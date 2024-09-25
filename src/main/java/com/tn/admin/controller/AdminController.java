package com.tn.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
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
import com.tn.admin.model.vo.MyResponseWithData;
import com.tn.admin.model.vo.MyResponseWithoutData;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.ProductAdminService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	@Autowired
	private ProductAdminService pService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
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
	
	@RequestMapping(value ="/upfiles" ,method = RequestMethod.POST, produces = "application/json; charset=UTF-8;")
	//쪼개져서온 'file' 파일을 재조립해주는 인터페이스 MultipartFile, @RequestParam로 save
	public ResponseEntity<MyResponseWithoutData> saveBoardFile(@RequestParam("file") MultipartFile file, HttpServletRequest request) {	
		System.out.println("파일 전송됨, 이제 저장해야함");
		
		ResponseEntity<MyResponseWithoutData> result = null;
		
		
		
		try {
			BoardUpFilesVODTO fileInfo = fileSave(file, request);
			
			//System.out.println("저장된 파일의 정보 : " + fileInfo.toString());
			
			
			// 7월 17일 가장 먼저 해야 할 코드 : front에서 업로드한 파일을 지웠을 때 백엔드에서도 지워야 한다.
			this.uploadFileList.add(fileInfo);
			System.out.println("====================================");
			System.out.println("현재 파일리스트에 있는 파일들");
			for(BoardUpFilesVODTO f : this.uploadFileList) {
				System.out.println(f.toString());
			}
			System.out.println("====================================");
			
			String tmp = null;
			if (fileInfo.getThumbFileName() != null) {
				tmp = fileInfo.getThumbFileName();
			}else {
				tmp = fileInfo.getNewFileName().substring(fileInfo.getNewFileName().lastIndexOf(File.separator)+1);
			}
			
			// 예) \2024\07\17\50.htm File.separator+1은 5의 위치이고 substring으로 자른다  
			//String tmp = fileInfo.getNewFileName().substring(fileInfo.getNewFileName().lastIndexOf(File.separator)+1);
			
			MyResponseWithoutData mrw = MyResponseWithoutData.builder()
				.code(200)
				.msg("success")
				.newFileName(tmp)
				.build();
			
			result = new ResponseEntity<MyResponseWithoutData>(mrw, HttpStatus.OK);
		} catch (IOException e) {
			
			e.printStackTrace();
			result = new ResponseEntity<>(HttpStatus.NOT_ACCEPTABLE);
		}
			
		return result;
	}
	
}
