package com.tn.cart.model.vo;

public enum ResponseType { // ���� ���� ������ ���������� 0���� �����ϴ� ���� ������. �迭ó��
	SUCCESS(200), FAIL(400);
	
	private int reslutCode;	
	
	ResponseType(int resultCode) { // enum Ÿ���� ���������ڰ� private �ؾ� �Ѵ�. ���� �տ� ���������ڸ� ���� �ʴ��� private�� ������ ���� ���̴�. 
		this.reslutCode = resultCode;
	}
	
	public int getResultCode() {
		return this.reslutCode;
	}
	
	public String getResultMessage() {
		return this.name(); // name : SUCCESS, FAIL -> int���� ������ �ִ� �̸�(SUCCESS, FAIL�� String���� ��ȯ�ȴ�)
	}
}
