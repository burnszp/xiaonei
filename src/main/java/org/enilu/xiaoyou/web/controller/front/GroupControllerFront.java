package org.enilu.xiaoyou.web.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.entity.User;
import org.enilu.xiaoyou.service.GroupService;
import org.enilu.xiaoyou.service.MessageService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.View;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;
import org.nutz.mvc.view.JspView;
import org.nutz.mvc.view.ServerRedirectView;
import org.nutz.mvc.view.ViewWrapper;

/**
 * descript
 * <p>
 * 2015年3月1日
 * <p>
 * 
 * @author burnszp(357252539@qq.com)
 * 
 * 
 */
@IocBean
public class GroupControllerFront {
	@Inject
	private GroupService groupService;
	@Inject
	private MessageService messageService;

	@At("/group/detail")
	@Ok("jsp:/page/front/group/detail.jsp")
	public void showGroupDetail(@Param("gid") Long gid,
			HttpServletRequest request) {
		String msg = request.getParameter("msg");
		if ("joinfirst".equals(msg)) {
			request.setAttribute("msg", "请先申请加入该群组");
		}
		Group group = groupService.find(gid);
		Object obj = request.getSession().getAttribute("user");
		boolean inGroup = false;
		if (obj != null) {
			User user = (User) obj;
			inGroup = groupService.checkIfInGroup(user.getId(), gid);
		}
		request.setAttribute("inGroup", inGroup == true ? 1 : 0);

		List<User> userList = groupService.findAllUserByGroupId(gid);
		Pager pager = new Pager();
		pager.setPageNumber(1);
		pager.setPageSize(10);
		List<Message> messageList = messageService.searchByPage(

		Cnd.where("gid", "=", gid).and("replayId", "=", 0).desc("createtime"),
				pager);
		request.setAttribute("messageList", messageList);
		request.setAttribute("group", group);
		request.setAttribute("userList", userList);
	}

	@At("/group/list")
	@Ok("jsp:/page/front/group/list.jsp")
	public List<Group> list(HttpServletRequest request) {
		List<Group> groupList = groupService.search(Group.class, Cnd.NEW()
				.desc("createtime"));
		return groupList;
	}

	@At("/group/getmsg")
	@Ok("json")
	public List<Message> getMsg(@Param("gid") Long gid,
			@Param("page") Integer pageNumber) {
		Pager pager = new Pager();
		pager.setPageNumber(pageNumber);
		pager.setPageSize(10);
		List<Message> messageList = messageService.searchByPage(
				Cnd.where("gid", "=", gid).and("replayId", "=", 0)
						.desc("createtime"), pager);
		return messageList;
	}

	/**
	 * 申请加入指定群组
	 * 
	 * @param gid
	 * @param request
	 */
	@At("/group/join")
	public View join(@Param("gid") Long gid, HttpServletRequest request) {
		Object user = request.getSession().getAttribute("user");
		if (user == null) {
			// 跳转至登录页面
			return new JspView("/page/front/login.jsp");
		}
		groupService.join(gid, ((User) user).getId());
		return new ViewWrapper(new ServerRedirectView("/group/detail?gid="
				+ gid), null);

	}

	/**
	 * 退出某个群组
	 * 
	 * @param gid
	 * @param request
	 */
	@At("/group/quit")
	public View quit(@Param("gid") Long gid, HttpServletRequest request) {
		User user = (User) request.getSession().getAttribute("user");
		groupService.quit(gid, user.getId());
		return new ViewWrapper(new ServerRedirectView("/group/detail?gid="
				+ gid), null);
	}

	/**
	 * 解散群组
	 * 
	 * @param gid
	 * @param request
	 * @return
	 */
	@At("/group/jiesan")
	public View jieSan(@Param("gid") Long gid, HttpServletRequest request) {

		Group group = groupService.find(gid);
		group.setStatus(Group.STATUS_JIESAN);
		try {
			groupService.update(group);
		} catch (Exception e) {

		}
		return new ViewWrapper(new ServerRedirectView("/profile"), null);
	}
}
