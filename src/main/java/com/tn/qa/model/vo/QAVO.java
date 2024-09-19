package com.tn.qa.model.vo;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
public class QAVO {
	int qNo;
	String qWriter;
	String qTitle;
	java.sql.Date qDate;
	String qContent;
	String qAnswer;
	String qType;	
}
