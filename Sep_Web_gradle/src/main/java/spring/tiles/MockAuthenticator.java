package spring.tiles;

public class MockAuthenticator implements Authenticator {

	@Override
	public void authenticate(String id, String password) {
		if (!id.equals("test")) {
			throw new AuthenticationException("invalid id "+id);
		}
	}

}