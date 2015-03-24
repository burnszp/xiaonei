package org.enilu.xiaoyou.web.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.admin.AdminUser;
import org.enilu.xiaoyou.service.AdminService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ServerRedirectView;

/**
 * 后台管理首页controller
 * <p>
 * 2014年9月27日
 * 
 * @author burnszp(357252539@qq.com)
 * 
 * 
 */
@IocBean
public class AdminController {
	@Inject
	private AdminService adminService;

	@At("/admin")
	public View index(HttpServletRequest request) {
		AdminUser admin = null;
		try {
			admin = (AdminUser) request.getSession().getAttribute("admin");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (admin == null) {
			return new JspView("/page/admin/login.jsp");
		}
		return new JspView("/page/admin/admin.jsp");

	}

	@At("/admin/login")
	public View login(@Param("uname") String uname, @Param("pwd") String pwd,
			HttpServletRequest request) {
		AdminUser admin = adminService.login(uname, pwd);
		if (admin != null) {
			request.getSession().setAttribute("admin", admin);
			request.setAttribute("admin", admin);
			return new ServerRedirectView("/admin");
		} else {
			request.setAttribute("msg", "用户名或密码错误");
			return new JspView("/page/admin/login.jsp");
		}
	}

	@At("/admin/logout")
	@Ok("redirect:/")
	public void logout(HttpServletRequest request) {
		request.getSession().removeAttribute("admin");

	}
}
