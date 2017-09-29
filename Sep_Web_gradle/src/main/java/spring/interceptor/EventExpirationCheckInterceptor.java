package spring.interceptor;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
		
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class EventExpirationCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,HttpServletResponse response, Object handler) throws Exception{
		if(checkEvent(request)&&checkEventExpiration()) {
			displayEventExpirationPage(request,response);
			return false;//컨트롤러 실행x
		}
		return true; //컨트롤러 실행
	}
	private boolean checkEvent(HttpServletRequest request) {
		System.out.println(request.getContextPath());
		return request.getRequestURI().equals(request.getContextPath()+"/event/list.do");
		
	}
	private boolean checkEventExpiration() {
		Calendar calendar = Calendar.getInstance();
		calendar.set(2018,01,01);
		Date now = new Date();
		return now.after(calendar.getTime());
		//calendar에 저장된 날짜가 오늘보다 이전날짜이면 false 이후날짜이면 true
	}
	private void displayEventExpirationPage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		response.sendRedirect("eventExpired.do");
	}
}
