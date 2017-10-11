package validator;

import model.Member_DTO;
import validator.CommonLogger;

public class MockAuthenticator implements Authenticator{
	
	private CommonLogger commonLogger;
	
	public void setCommonLogger(CommonLogger commonLogger) {
		this.commonLogger=commonLogger;
	}
	
	
	public void authenticate(Member_DTO mdto) //db에서 찾아온 값
			throws AuthenticationException{
		if(mdto==null) { //db에서 값을 가져오지 못해서 null값이 올 경우
			commonLogger.log("인증에러-"+mdto.getMem_id());
			throw new AuthenticationException(); //예외객체 발생
		}
	}

}
