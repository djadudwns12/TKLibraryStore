package com.tn.member.service;

import java.util.List;
import java.util.Map;

import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.MyAddressDTO;
import com.tn.member.model.dto.RegisterDTO;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.MyAddressVO;

@Service
public interface MemberService {

	List<Map<String, String>> getMember();
	
	// 회원수정페이지에 접속한 회원정보를 불러오는 메서드
	MemberVO getEditMemberInfo(String userId) throws Exception;
	
	// 회원수정페이지에서 수정된 회원정보를 저장하는 메서드
	boolean saveEditInfo(MemberDTO editMember) throws Exception;
	
	// 로그인 시키는 메서드
	MemberVO loginMember(String userId, String userPwd) throws Exception;
	
	// 회원탈퇴
	boolean deleteMember(String userId) throws Exception;
	

  public ResponseEntity<Integer> sendOne(String phone) throws Exception;


//-----------------------------------------박근영-------------------------------------------------
	// 회원정보 저장 메서드
	boolean registerMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception;
	// 중복아이디 비교 메서드
	boolean compareId(String tmpUserId) throws Exception;
//-----------------------------------------박근영-------------------------------------------------

//-----------------------------------------김가윤-------------------------------------------------
	
	// 회원의 주소록을 가져오는 메서드
	List<MyAddressVO> getAddressList(String userId) throws Exception;

	// addressId를 이용해 해당 row를 가져오기
	MyAddressVO selectById(int addressId) throws Exception;

	// 수정할 주소 내용을 객체에 담아서 보내기
	boolean modifyUpdateAddress(MyAddressDTO addressDTO) throws Exception;

	// 배송지 추가
	boolean insertAddress(MyAddressDTO addressDTO) throws Exception;




}
