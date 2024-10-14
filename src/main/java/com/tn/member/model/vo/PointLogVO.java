package com.tn.member.model.vo;

import java.sql.Timestamp;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@Setter
@ToString
@Builder
public class PointLogVO {
	private int pLogNo;
	private String pWho;
	private Timestamp pWhen;
	private int pWhy;
	private int pScore;
	
	public int getpLogNo() {
		return pLogNo;
	}
	public void setpLogNo(int pLogNo) {
		this.pLogNo = pLogNo;
	}
	public String getpWho() {
		return pWho;
	}
	public void setpWho(String pWho) {
		this.pWho = pWho;
	}
	public Timestamp getpWhen() {
		return pWhen;
	}
	public void setpWhen(Timestamp pWhen) {
		this.pWhen = pWhen;
	}
	public int getpWhy() {
		return pWhy;
	}
	public void setpWhy(int pWhy) {
		this.pWhy = pWhy;
	}
	public int getpScore() {
		return pScore;
	}
	public void setpScore(int pScore) {
		this.pScore = pScore;
	}
	
	
	
	
}
