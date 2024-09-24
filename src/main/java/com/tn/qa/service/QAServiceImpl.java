package com.tn.qa.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tn.admin.model.vo.SearchCriteriaDTO;
import com.tn.admin.model.vo.PagingInfo;
import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.admin.model.vo.ProductVO;
import com.tn.admin.service.ProductAdminService;
import com.tn.qa.dao.QADAO;
import com.tn.qa.model.vo.QAVO;

@Service
public class QAServiceImpl implements QAService {

	@Autowired
	private QADAO QADao;
	
	@Override
	public List<QAVO> getQAList(String userId) throws Exception {
		// TODO Auto-generated method stub
		return QADao.selectQAList(userId);
	}

	@Override
	public QAVO getDetail(int qNo) throws Exception {
		// TODO Auto-generated method stub
		return QADao.selectQADetail(qNo);
	}

	
	
}
