package com.tn.member.service;

import org.springframework.http.ResponseEntity;

public interface MemberService {
	
	public ResponseEntity<Integer> sendOne(String phone) throws Exception;

}
