package org.enilu.xiaoyou.web.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.entity.MsgBox;
import org.enilu.xiaoyou.entity.Region;
import org.enilu.xiaoyou.entity.User;
import org.enilu.xiaoyou.service.GroupService;
import org.enilu.xiaoyou.service.MessageService;
import org.enilu.xiaoyou.service.MsgBoxService;
import org.enilu.xiaoyou.service.RegionService;
import org.enilu.xiaoyou.service.UserService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;

/**
 * 用户管理controller
 * <p>
 * 2014年9月27日
 * 
 * @author burnszp(357252539@qq.com)
 * 
 */
@IocBean
public class UserControllerFront {
	@Inject
	private UserService userService;
	@Inject
	private RegionService regionService;
	@Inject
	private GroupService groupService;
	@Inject
	private MessageService messageService;

	@Inject
	private MsgBoxService msgBoxService;

	@At("/front/regist")
	@Ok("jsp:/page/front/regist.jsp")
	public void regist(HttpServletRequest request) {
		List<Region> list = regionService.queryProvince();
		request.setAttribute("regions", list);
	}

	/**
	 * 检查帐号是否唯一
	 * 
	 * @param userName
	 * @return
	 */
	@At("/front/checkname")
	@Ok("json")
	public boolean checkName(@Param("name") String userName) {
		User user = userService.findByCondition(User.class, "uname", userName);
		if (user == null) {
			return true;
		}
		return false;
	}

	@At("/front/querycity")
	@Ok("json")
	public List<Region> queryCityByProvince(@Param("pid") Long pid) {
		return regionService.queryCityByPid(pid);

	}

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

	@At("/user/")
	@Ok("jsp:/page/front/login.jsp")
	public void reg(@Param("::user.") User user) throws Exception {
		userService.save(user);
	}

	/**
	 * 个人中心
	 * 
	 * @param request
	 */
	@At("/profile")
	public View profile(HttpServletRequest request) {
		User user = null;
		try {
			user = (User) request.getSession().getAttribute("user");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (user == null) {
			return new JspView("/page/front/login.jsp");
		}
		request.setAttribute("user", user);
		List<Group> groupList = groupService
				.searchBySql(
						Group.class,
						"select * from fr_group where id in (select fr_group_id from fr_user_group where fr_user_id="
								+ user.getId() + ")");
		groupService.findLinks(groupList);
		request.setAttribute("groupList", groupList);
		List<Message> msgList = messageService.search(Message.class,
				Cnd.where("uid", "=", user.getId()).and("replayId", "=", 0));

		request.setAttribute("msgList", msgList);
		List<MsgBox> msgBoxList = msgBoxService.query(user.getId());
		request.setAttribute("msgBoxList", msgBoxList);
		return new JspView("/page/front/profile.jsp");
	}

	/**
	 * 个人中心
	 * 
	 * @param request
	 */
	@At("/profilet")
	public View profile(@Param("uid") Long uid, HttpServletRequest request) {
		User user = userService.find(uid, User.class);
		request.setAttribute("user", user);
		List<Group> groupList = groupService
				.searchBySql(
						Group.class,
						"select * from fr_group where id in (select fr_group_id from fr_user_group where fr_user_id="
								+ user.getId() + ")");
		groupService.findLinks(groupList);
		request.setAttribute("groupList", groupList);
		List<Message> msgList = messageService.search(Message.class,
				Cnd.where("uid", "=", user.getId()).and("replayId", "=", 0));

		request.setAttribute("msgList", msgList);
		return new JspView("/page/front/otherprofile.jsp");
	}

	/**
	 * 验证旧密码是否正确
	 * 
	 * @param oldPwd
	 *            旧密码
	 * @param request
	 * @return
	 */
	@At("/user/checkoldpwd")
	@Ok("json")
	public boolean checkOldPwd(@Param("oldPwd") String oldPwd,
			HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		if (user.getPwd().equals(oldPwd)) {
			return true;
		}
		return false;
	}

	/**
	 * 修改密码
	 * 
	 * @param pwd
	 * @param rePwd
	 * @param request
	 */
	@At("/user/changepwd")
	@Ok("redirect:/profile")
	public void ChangePwd(@Param("pwd") String pwd, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		user.setPwd(pwd);
		try {
			userService.update(user);
		} catch (Exception e) {
		}
	}

	@At("/profile/update")
	@Ok("jsp:/page/front/user/userForm.jsp")
	public User form(HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		return user;
	}

	@At("user/update")
	@Ok("redirect:/profile")
	public void save(@Param("::user.") User param, HttpServletRequest request)
			throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		user.setNickName(param.getNickName());
		user.setRealName(param.getRealName());
		user.setEmail(param.getEmail());
		user.setTel(param.getTel());
		user.setQq(param.getQq());
		userService.update(user);
	}
}
