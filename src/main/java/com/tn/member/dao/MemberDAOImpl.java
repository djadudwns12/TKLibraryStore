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
import com.tn.member.model.vo.PointLogVO;

@Repository
public class MemberDAOImpl implements MemberDAO  {


	@Autowired
	private SqlSession sess;
	
	private String NS = "com.tn.mapper.memberMapper";
	
	public List<Map<String, String>> getMember() {
		// TODO Auto-generated method stub
		// System.out.println("asdasd");
		List<Map<String, String>> aa = sess.selectList(NS+".getMember");
		// System.out.println(sess.selectList(NS+".getMember"));
		return aa;
	}
	
	public MemberVO getMember(String userId, String userPwd) throws Exception {
		Map<String, String> loginMember = new HashMap<>();
		
		loginMember.put("userId", userId);
		loginMember.put("userPwd", userPwd);
	
		return sess.selectOne(NS+".getLoginMember", loginMember);
	}	

	//=============================최미설========================================//
	@Override
	public MemberVO getEditMemberInfo(String userId) throws Exception {

		return sess.selectOne(NS + ".getEditMemberInfo", userId);
	}

	@Override
	public int updateEditMember(MemberVO editMember) throws Exception {

		return sess.update(NS + ".updateEditMember", editMember);
	}

	@Override
	public int saveEditImg(ImgFileVODTO fileInfo, String userId) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("fileName", fileInfo.getNewFileName());
		params.put("base64Img", fileInfo.getBase64Img());
		params.put("userId", userId);
		
		return sess.update(NS + ".saveEditImg",params);
	}
	
	@Override
	public int saveEditPwd(String userPwd, String userId) throws Exception {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("userPwd", userPwd);
		params.put("userId", userId);
		return sess.update(NS + ".saveEditPwd", params);
	}
	
	@Override
	public int deleteMember(String userId) throws Exception {
		
		return sess.update(NS + ".deleteMember", userId);
	}
	

	@Override
	public int recordUnregister(String userId) throws Exception {
		return sess.insert(NS + ".recordUnregister", userId);
	}

	
	@Override
	public void validateAccount(String userId) throws Exception {

		sess.update(NS + ".validateAccount", userId);
	}
	
	@Override
	public void removeUnregiTable(String userId) {

		sess.delete(NS + ".removeUnregiTable", userId);
	}
	//=============================최미설========================================//

	
//-----------------------------------------박근영-------------------------------------------------
	//박근영
	@Override
	public int insertMember(RegisterDTO registerDTO, ImgFileVODTO fileInfo) throws Exception {
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
	public int insertAddress(RegisterDTO registerDTO, String address) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("registerDTO", registerDTO);
		paramMap.put("address", address);
		return sess.insert(NS + ".insertRegisterAddress", paramMap);
	}

	

//-----------------------------------------박근영-------------------------------------------------

//-----------------------------------------엄영준-------------------------------------------------
	@Override
	public int mergeIntoVisitHistor() {
		// TODO Auto-generated method stub
		return sess.insert(NS + ".mergeIntoVisitHistor");
	}
	
	@Override
	public List<PointLogVO> selectPointLog(MemberDTO loginMember) throws Exception {
		// TODO Auto-generated method stub
		return sess.selectList(NS + ".selectPointLog",loginMember);
	}
//-----------------------------------------엄영준-------------------------------------------------
	
	
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
		// System.out.println("addressDTO : " + addressDTO.toString());
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

	@Override
	public int getPointRate(String userId) throws Exception {
		
		return sess.selectOne(NS + ".getPointRate", userId);
	}






	
	
}
