package com.tn.admin.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.MyResponseWithData;

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
		
	
	
}
