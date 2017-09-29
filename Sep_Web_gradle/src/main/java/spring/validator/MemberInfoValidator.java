package spring.validator;



import org.springframework.validation.Errors;
import spring.model.Address;
import spring.model.MemberInfo;


public class MemberInfoValidator {
	public boolean supports(Class<?> clazz) {
		return MemberInfo.class.isAssignableFrom(clazz);
	}
	public void validate(Object target, Errors errors) {
		MemberInfo memberInfo = (MemberInfo)target;
		if(memberInfo.getId()==null || memberInfo.getId().trim().isEmpty()) {
			errors.rejectValue("id", "required");//에러가 발생했다. (에러발생한 필드위치,에러코드)
		}
		if(memberInfo.getName()==null || memberInfo.getName().trim().isEmpty()) {
			errors.rejectValue("name", "required");
		}
		Address address = memberInfo.getAddress();
		if(address==null) {
			errors.rejectValue("address", "required");
		}
		if(address!=null) {
			errors.pushNestedPath("address");
			try {
				if(address.getZipcode()==null||address.getZipcode().trim().isEmpty()) {
					errors.rejectValue("zipcode", "required");//에러가 발생했다.
				}
				if(address.getAddress1()==null||address.getAddress1().trim().isEmpty()) {
					errors.rejectValue("address1", "required");
				}
			} finally {
				errors.popNestedPath();
			}
		}
	}

}
