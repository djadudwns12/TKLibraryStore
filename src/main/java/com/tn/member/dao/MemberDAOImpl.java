package com.tn.member.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.tn.member.model.dto.MemberDTO;
import com.tn.member.model.dto.MyAddressDTO;
import com.tn.member.model.dto.RegisterDTO;
import com.tn.member.model.vo.ImgFileVODTO;
import com.tn.member.model.vo.MemberVO;
import com.tn.member.model.vo.MyAddressVO;


@Repository
public class MemberDAOImpl implements MemberDAO  {


	@Autowired
	private SqlSession sess;
	
	private String NS = "com.tn.mapper.memberMapper";
	
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		System.out.println("asdasd");
		List<Map<String, String>> aa = sess.selectList(NS+".getMember");
		System.out.println(sess.selectList(NS+".getMember"));
		return aa;
	}

	@Override
	public MemberVO getEditMemberInfo(String userId) throws Exception {

		return sess.selectOne(NS + ".getEditMemberInfo", userId);
	}

	@Override
	public int updateEditMember(MemberDTO editMember) throws Exception {
		
		return sess.update(NS + ".updateEditMember", editMember);
	}
	
	public MemberVO getMember(String userId, String userPwd) throws Exception {
		Map<String, String> loginMember = new HashMap<>();
		
		loginMember.put("userId", userId);
		loginMember.put("userPwd", userPwd);
	
		return sess.selectOne(NS+".getLoginMember", loginMember);
	}


	@Override
	public int deleteMember(String userId) throws Exception {
		
		return sess.delete(NS + ".deleteMember", userId);
	}



	
//-----------------------------------------박근영-------------------------------------------------
	//박근영
	@Override
	public int insertMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("registerDTO", registerDTO);
		paramMap.put("fileInfo", fileInfo);
		return sess.insert(NS + ".insertRegisterMember", paramMap);
	}
	//박근영
	@Override
	public int selectId(String tmpUserId) throws Exception {
		return sess.selectOne(NS + ".selectCompareId", tmpUserId);
	}
	//박근영
	@Override
	public int insertAddress(RegisterDTO registerDTO, String address) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("registerDTO", registerDTO);
		paramMap.put("address", address);
		return sess.insert(NS + ".insertRegisterAddress", paramMap);
	}

//-----------------------------------------박근영-------------------------------------------------
	
	
//-----------------------------------------김가윤-------------------------------------------------

	@Override
	public List<MyAddressVO> getAddressList(String userId) throws Exception {
		
		return sess.selectList(NS + ".getAddressList", userId);
	}

	@Override
	public MyAddressVO selectById(int addressId) throws Exception {
		
		return sess.selectOne(NS + ".selectByAddressId", addressId);
	}

	@Override
	public int modifyAddress(MyAddressDTO addressDTO) throws Exception {
		System.out.println("addressDTO : " + addressDTO.toString());
		return sess.update(NS + ".modifyAddress", addressDTO);
	}

	@Override
	public int updateOtherIsDefault(String userId) throws Exception {
		
		return sess.update(NS + ".updateOtherIsDefault", userId);
	}

	@Override
	public int insertNewAddress(MyAddressDTO addressDTO) throws Exception {
		
		return sess.insert(NS + ".insertNewAddress", addressDTO);
	}

	@Override
	public int updateInsertIsDefault(String userId) throws Exception {
		
		return sess.update(NS + ".updateInsertIsDefault", userId);
	}

	@Override
	public int removeAddress(int addressId) throws Exception {
		
		return sess.delete(NS + ".removeAddress", addressId);
	}


	
	
}
