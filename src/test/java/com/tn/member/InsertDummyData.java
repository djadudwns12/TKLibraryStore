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

import com.tn.admin.dao.MemberAdminDAO;
import com.tn.member.dao.MemberDAO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.service.MemberService;



@RunWith(SpringJUnit4ClassRunner.class)// test패키지에서 SpringContainer에 접근할 수 있도록 함
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"}) // 파일의 위치를 제공하여 파일에 접근할 수 있도록
public class InsertDummyData {
	@Autowired
	private MemberAdminDAO dao;
		
	@Test
	public void insertDummyDataToDB() throws Exception {
		
		for(int i= 0 ; i<100; i++)  {
			Date randomdate = getRandomDate();
			Random rNum = new Random();
			MemberDTO dto = MemberDTO.builder()
				.userId("dummy" + i)
				.userPwd("dummy" + i)
				.userName("더미" + i)
				.userBirth(randomdate)
				.phoneNum("010-" + rNum.nextInt(9999) + "-" + rNum.nextInt(9999))
				.email("dummy" + i + "@email.no")
				.userImg("noImage.png")
				.build();
			// dao.insertDummyMember(dto);
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