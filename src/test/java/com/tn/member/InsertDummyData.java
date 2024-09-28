package com.tn.member;


import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.sql.Date;
import java.util.Random;
import java.util.concurrent.ThreadLocalRandom;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.tn.member.dao.MemberDAO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.service.MemberService;



@RunWith(SpringJUnit4ClassRunner.class)// test패키지에서 SpringContainer에 접근할 수 있도록 함
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}) // 파일의 위치를 제공하여 파일에 접근할 수 있도록
public class InsertDummyData {
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private MemberService service;
	
	
	@Test
	public void insertDummyDataToDB() throws Exception {
		
		for(int i= 0 ; i<300; i++)  {
			Date randomdate = getRandomDate();
			Random rNum = new Random();
			MemberDTO dto = MemberDTO.builder()
				.userId("dummyUser" + i)
				.userPwd("dummy" + i)
				.userName("더미유저" + i)
				.userBirth(randomdate)
				.phoneNum("010-" + rNum.nextInt(9999) + "-" + rNum.nextInt(9999))
				.email("dummyUser" + i + "@email.no")
				.build();
		
//			if (dao.insertNewBoard(dto) == 1) {
////				1-1. 위에서 저장된 게시글의 pk(boardNo)를 가져와야한다(select)
//				int newBoardNo = dao.getMaxBoardNo();
//
////				1-1-1 위에서 가져온 글 번호를 ref컬럼에 update
//				dao.updateBoardRef(newBoardNo);
//			}
		}
		
	}


	private Date getRandomDate() {
		 // 현재 날짜
        LocalDate currentDate = LocalDate.now();

        // 100년 전 날짜
        LocalDate hundredYearsAgo = currentDate.minusYears(100);

        // 범위 내의 날짜를 밀리초로 변환
        long startEpochDay = hundredYearsAgo.toEpochDay();
        long endEpochDay = currentDate.toEpochDay();

        // 랜덤한 날짜 생성
        long randomEpochDay = ThreadLocalRandom.current().nextLong(startEpochDay, endEpochDay);

        // LocalDate로 변환
        LocalDate randomLocalDate = LocalDate.ofEpochDay(randomEpochDay);

        // LocalDate -> java.sql.Date 변환
        return Date.valueOf(randomLocalDate);
	}
}