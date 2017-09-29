package spring.service;

import spring.common.CommonLogger;

public class MockAuthenticator implements Authenticator{
	
	private CommonLogger commonLogger;
	
	public void setCommonLogger(CommonLogger commonLogger) {
		this.commonLogger=commonLogger;
	}
	
	
	public void authenticate(LoginCommand loginCommand) //폼에서 입력된값
			throws AuthenticationException{
		if(!loginCommand.getUserId().equals(loginCommand.getPassword())) { //값이 다르면
			commonLogger.log("인증에러-"+loginCommand.getUserId());
			throw new AuthenticationException(); //예외객체 발생
		}
	}

}
