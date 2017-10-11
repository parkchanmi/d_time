package validator;

import model.Member_DTO;

public interface Authenticator {
	void authenticate(Member_DTO mdto) 
			throws AuthenticationException;
}
