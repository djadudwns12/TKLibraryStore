package com.tn.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tn.admin.model.vo.PagingInfoDTO;
import com.tn.member.dao.MemberDAO;

import com.tn.member.dao.MemberDAOImpl;
import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.MyAddressDTO;
import com.tn.member.model.dto.RegisterDTO;
import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.MyAddressVO;
import com.tn.member.model.vo.PointLogVO;

import java.io.IOException;
import java.util.Random;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import com.tn.util.PropertiesTask;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO dao;

	final DefaultMessageService messageService;

	public MemberServiceImpl() throws IOException {
		this.messageService = NurigoApp.INSTANCE.initialize(PropertiesTask.getPropertiesValue("coolSmsKey"),
				PropertiesTask.getPropertiesValue("coolSmsSecret"), "https://api.coolsms.co.kr");
	}

	@Override
	@Transactional(readOnly = true)
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		return dao.getMember();
	}

// ========================================최미설===============================================//
	@Override
	public MemberVO getEditMemberInfo(String userId) throws Exception {

		return dao.getEditMemberInfo(userId);
	}

	@Override
	public boolean saveEditInfo(MemberVO editMember) throws Exception {
		boolean result = false;
		if (dao.updateEditMember(editMember) == 1) {
			result = true;
		}
		return result;
	}

	@Override
	public boolean saveEditImg(ImgFileVODTO fileInfo, String userId) throws Exception {
		boolean result = false;
		if(dao.saveEditImg(fileInfo, userId) == 1) {
			result=true;
		}
		return result; 
	}
	
	@Override
	public boolean saveEditPwd(String userPwd, String userId) throws Exception {
		boolean result = false;
		if(dao.saveEditPwd(userPwd, userId) == 1) {
			result=true;
		}
		return result;
		
	}
	
	@Override
	public boolean deleteMember(String userId) throws Exception {
		boolean result = false;
		if (dao.deleteMember(userId) == 1) {
			if(dao.recordUnregister(userId) == 1) {
				result = true;
			}
		}
		return result;
	}

	@Override
	public MemberVO loginMember(String userId, String userPwd) throws Exception {

		return dao.getMember(userId, userPwd);
	}
	
	@Override
	public void validateAccount(String userId) throws Exception {
		// isDelete='N'
		dao.validateAccount(userId);
		// Unregister 테이블에서 삭제
		dao.removeUnregiTable(userId);
	}
	
// ========================================최미설===============================================//

//-----------------------------------------박근영-------------------------------------------------
	// 박근영
	@Override
	public ResponseEntity<Integer> sendOne(String phone) throws Exception {
		System.out.println("샌드원 확인");
		Message message = new Message();
		message.setFrom("010-3888-9567");
		message.setTo(phone);

		int code = createCode();
		message.setText("떡잎서점 - 회원가입 인증번호는(" + code + ")입니다. 정확히 입력해 주세요.");
		SingleMessageSentResponse response = this.messageService.sendOne(new SingleMessageSendingRequest(message));
		System.out.println(response);

		if (response.getStatusCode().equals("2000")) {
			return new ResponseEntity<Integer>(code, HttpStatus.OK);
		} else {

			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	// 박근영
	private int createCode() {
		// 간단한 예시로 6자리 숫자 코드 생성
		// 0.0(포함)부터 1.0(제외)
		// int code = (int) (Math.random() * 900000) + 100000;
		Random random = new Random();
		// 0부터 899,999
		int code = 100000 + random.nextInt(900000);
		return code;
	}

	@Override
	@Transactional(rollbackFor = Exception.class) // 모든 예외 발생 시 롤백하도록 설정
	public boolean registerMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception {
		boolean result = false;
		String address = registerDTO.getKeyword() + " " + registerDTO.getAddressDetail();
		if (dao.insertMember(registerDTO, fileInfo) == 1 && dao.insertAddress(registerDTO, address) == 1) {
			result = true;
		} else {
			result = false;
		}

		return result;
	}

	// 박근영
	@Override
	public boolean compareId(String tmpUserId) throws Exception {
		boolean result = false;
		if (dao.selectId(tmpUserId) == 1) {
			result = true;
		}

		return result;
	}

	



//-----------------------------------------박근영-------------------------------------------------

//-----------------------------------------엄영준-------------------------------------------------
	@Override
	public boolean addVisitHistory() throws Exception {
		
		if(dao.mergeIntoVisitHistor() > 0) {
			return true;
		}else {
			return false;
		}	
	}
	
	@Override
	public List<PointLogVO> getPointLog(MemberDTO loginMember) throws Exception {
		
		return dao.selectPointLog(loginMember);
	}
//-----------------------------------------엄영준-------------------------------------------------
		
//-----------------------------------------김가윤-------------------------------------------------
	@Override
	public List<MyAddressVO> getAddressList(String userId) throws Exception {

		List<MyAddressVO> list = dao.getAddressList(userId);

		return list;
	}

	@Override
	public MyAddressVO selectById(int addressId) throws Exception {
		
		return dao.selectById(addressId);
	}

	@Override
	public boolean modifyUpdateAddress(MyAddressDTO addressDTO) throws Exception {
		
		// keyword와 addressDetail을 결합하여 하나의 주소로 처리
	    String address = addressDTO.getKeyword() + ", " + addressDTO.getAddressDetail();
		
	    // 결합된 주소를 addressDTO에 설정
	    addressDTO.setAddress(address);
	    
	    // isDefault가 'N'일 경우 다른 주소의 isDefault를 'Y'로 업데이트
	    if ("N".equals(addressDTO.getIsDefault())) {
	        // 이곳에서 userId를 이용하여 다른 주소의 isDefault를 업데이트하는 메서드를 호출
	        dao.updateOtherIsDefault(addressDTO.getUserId());
	    }
	    
	    int result = dao.modifyAddress(addressDTO);

	    // 업데이트 성공 여부에 따른 반환값 처리
	    return result > 0;
	}

	@Override
	public boolean insertAddress(MyAddressDTO addressDTO) throws Exception {
		
		boolean result = false;
		
		// keyword와 addressDetail을 결합하여 하나의 주소로 처리
	    String address = addressDTO.getKeyword() + ", " + addressDTO.getAddressDetail();
	    // 결합된 주소를 addressDTO에 설정
	    addressDTO.setAddress(address);
		
	    // isDefault가 'N'일 경우 다른 주소의 isDefault를 'Y'로 업데이트
	    if ("N".equals(addressDTO.getIsDefault())) {
	        // 이곳에서 userId를 이용하여 다른 주소의 isDefault를 업데이트하는 메서드를 호출
	        dao.updateInsertIsDefault(addressDTO.getUserId());
	    }
	    
		if(dao.insertNewAddress(addressDTO) == 1) {
			result = true;
		} else {
			result = false;
		}
		
		
		
		return result;
	}

	@Override
	public boolean removeAddress(int addressId) throws Exception {
		
		boolean result = false;
		
		if(dao.removeAddress(addressId) == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}



}
