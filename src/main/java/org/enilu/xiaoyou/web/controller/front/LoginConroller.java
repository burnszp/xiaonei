package org.enilu.xiaoyou.web.controller.front;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.User;
import org.enilu.xiaoyou.service.UserService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ServerRedirectView;

/**
 * 用户管理controller
 * <p>
 * 2014年9月27日
 * 
 * @author burnszp(357252539@qq.com)
 * 
 */
@IocBean
public class LoginConroller {
	@Inject
	private UserService userService;

	@At("/login")
	public View login(@Param("uname") String uname, @Param("pwd") String pwd,
			HttpServletRequest request) {
		User user = userService.login(uname, pwd);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			request.setAttribute("user", user);
			return new ServerRedirectView("/");
		} else {
			request.setAttribute("msg", "用户名或密码错误");
			return new JspView("/page/front/login.jsp");
		}
	}

	@At("/logout")
	@Ok("redirect:/")
	public void logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");

	}

}
