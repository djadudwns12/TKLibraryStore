package com.tn.qa.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.ProductAdminService;
import com.tn.member.model.vo.MemberVO;
import com.tn.qa.model.vo.QAVO;
import com.tn.qa.service.QAService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/qa")
public class QAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QAController.class);
	
	@Autowired
	private QAService qaService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/qaList", method = RequestMethod.GET)
	public void qaHome(HttpSession sess,Model model) {
		
		System.out.println("qa start");
		// 회원정보에서 사용자 id불러오기
		String userId = ((MemberVO)sess.getAttribute("loginMember")).getUserId();
//		logger.info("userId : "+userId);
		// 회원이 남긴 QA정보가지고 오기
		List<QAVO> list = new ArrayList<QAVO>();
		try {
			list = qaService.getQAList(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		logger.info(list.toString());
		model.addAttribute("list", list);
		
		
		
		
	}
	@RequestMapping(value = "/qaDetail",method = RequestMethod.GET)
	public void qaDetail(@RequestParam("qNo") int qNo,Model model) {
		logger.info(qNo+"상세페이지 이동");
		
		try {
			QAVO qa = qaService.getDetail(qNo);
			model.addAttribute("qa", qa);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	public String qaSave(HttpSession sess) {
		// 회원정보에서 사용자 id불러오기
		String userId = ((MemberVO)sess.getAttribute("loginMember")).getUserId();
		// 회원이 남긴 QA정보가지고 오기
//		qaService.getQAList(userId);
		
		return "/admin/home";
	}
}
