package com.railway.exceptions;

public class CommonUserException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	private final String errCode;
	private final String errMsg;

	public String getErrCode() {
		return errCode;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public CommonUserException(String errCode, String errMsg) {
		this.errCode = errCode;
		this.errMsg = errMsg;
	}
}
