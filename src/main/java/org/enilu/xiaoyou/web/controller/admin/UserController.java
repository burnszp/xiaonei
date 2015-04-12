package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.User;
import org.enilu.xiaoyou.service.UserService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 用户管理controller
 * <p>
 * 2014年9月27日
 * 
 * @author burnszp(357252539@qq.com)
 * 
 */
@IocBean
public class UserController {
	@Inject
	private UserService userService;

	@At("/admin/user")
	@Ok("jsp:/page/admin/user/user.jsp")
	public void index(@Param("ps") Integer pageSize,
			@Param("pn") Integer pageNumber, HttpServletRequest request) {
		Pager pager = new Pager();
		if (pageNumber == null) {
			pageNumber = 1;
		}
		if (pageSize == null) {
			pageSize = 10;
		}
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		List<User> list = userService
				.searchByPage(User.class, Cnd.NEW(), pager);
		int count = userService.searchCount(User.class, Cnd.NEW());
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

	/**
	 * 查看用户
	 * 
	 * @param id
	 *            用户id
	 * @return
	 */
	@At("/admin/userform")
	@Ok("jsp:/page/admin/user/userForm.jsp")
	public User form(@Param("id") Long id) {
		User user = userService.find(id, User.class);
		return user;
	}

	/**
	 * 根据用户id列表批量删除用户
	 * 
	 * @param ids
	 *            用户id列表,例：1,2,3,4,5,
	 */
	@At("/admin/userdel")
	@Ok("redirect:/admin/user")
	public void remove(@Param("ids") String ids) {
		if (ids != null) {
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (id != null && !"".equals(id.trim())) {
					userService.delById(Long.valueOf(id), User.class);
				}
			}
		}
	}

}
