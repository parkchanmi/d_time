package validator;

import model.Member_DTO;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class LoginCommandValidator implements Validator{
	public boolean supports(Class<?> clazz) {
		return Member_DTO.class.isAssignableFrom(clazz);
	}
	public void validate(Object target,Errors errors) {
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_id", "required"); 
		//비어있거나 공백인 경우에 에러코드 추가				//userId검사, errors객체에 required 에러코드 추가
		//required.loginCommand.userId
				//에러코드.객체타입.필드명
				//에러코드.필드명
				//에러코드
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mem_pwd", "required");
		//required.loginCommand.password ->없음
		//required.password ->있음
	}
}
