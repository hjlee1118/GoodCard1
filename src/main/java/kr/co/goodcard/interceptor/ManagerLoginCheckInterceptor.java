package kr.co.goodcard.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.goodcard.annotation.ManagerLoginCheck;
import kr.co.goodcard.vo.Member;


public class ManagerLoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {

		try {
			// 스프링 3.0부터 인터셉터가 넘겨받는 클래스가 HandlerMethod형으로 변경되었음
			// 일부 핸들러의 경우 다른 클래스의 객체가 넘어오는 경우가 있으므로 검사를 해야한다고 한다.
			// (거의 선검사 해주는 것이 좋다고 함)
			if (!(handler instanceof HandlerMethod)) {
				return true;
			}

			ManagerLoginCheck sessionCheck =
					((HandlerMethod) handler).getMethodAnnotation(ManagerLoginCheck.class);

			// 세션체크 어노테이션이 없으면 보낸다.
			if (sessionCheck == null) {
				return true;
			}

			// 그 외에는 어노테이션이 있는 경우인데
			// 이는 세션이 등록되어(loginUser) 그냥 가도 되는경우와
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getType().equals("O")) {
				return true;
			}

			// 로그인해야하는 경우(로그인 페이지로 sendRedirect) 로 분기가 나뉜다.
			response.sendRedirect(request.getContextPath() + "/manage.do");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}
