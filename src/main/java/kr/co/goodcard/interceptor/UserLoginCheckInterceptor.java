package kr.co.goodcard.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.goodcard.annotation.UserLoginCheck;
import kr.co.goodcard.vo.Member;

public class UserLoginCheckInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object handler) throws Exception {

		try {
			if (!(handler instanceof HandlerMethod)) {
				return true;
			}

			UserLoginCheck sessionCheck =
					((HandlerMethod) handler).getMethodAnnotation(UserLoginCheck.class);

			if (sessionCheck == null) {
				return true;
			}

			// 그 외에는 어노테이션이 있는 경우인데
			// 이는 세션이 등록되어(loginUser) 그냥 가도 되는경우와
			HttpSession session = request.getSession();
			Member loginUser = (Member) session.getAttribute("loginUser");
			if (loginUser != null && loginUser.getType().equals("U")) {
				return true;
			}

			// 로그인해야하는 경우(로그인 페이지로 sendRedirect) 로 분기가 나뉜다.
			response.sendRedirect(request.getContextPath() + "/member/login.do");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}
}
