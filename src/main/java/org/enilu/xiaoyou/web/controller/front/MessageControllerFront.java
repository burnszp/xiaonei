package org.enilu.xiaoyou.web.controller.front;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.entity.MsgType;
import org.enilu.xiaoyou.entity.User;
import org.enilu.xiaoyou.service.GroupService;
import org.enilu.xiaoyou.service.MessageService;
import org.enilu.xiaoyou.service.MsgTypeService;
import org.nutz.dao.Cnd;
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
 * 2015年3月8日
 * <p>
 * 
 * @author burnszp(357252539@qq.com)
 * 
 * 
 */
@IocBean
public class MessageControllerFront {
	@Inject
	private MessageService messageService;

	@Inject
	private GroupService groupService;
	@Inject
	private MsgTypeService msgTypeService;

	@At("/message/message_detail")
	@Ok("jsp:/page/Front/message/message_detail.jsp")
	public void showMessageDetail(HttpServletRequest request) {
		String mid = request.getParameter("id");
		Message message = messageService.find(Long.parseLong(mid));
		request.setAttribute("message", message);
	}

	@At("/message/addreplay")
	@Ok("json")
	public Object getMsg(@Param("::msg.") Message message,
			HttpServletRequest request) throws Exception {
		message.setCreatetime(new Date());

		try {
			User user = (User) request.getSession().getAttribute("user");
			if (user == null) {
				return "error:请先登录再回复";
			}
			message.setUid(user.getId());
			messageService.save(message);
			message.setUser(user);
		} catch (Exception e) {
			return null;
		}

		return message;
	}

	@At("/message/add")
	public View toAdd(@Param("gid") Long gid, HttpServletRequest request) {
		Object user = request.getSession().getAttribute("user");
		if (user == null) {
			// 跳转至登录页面
			return new JspView("/page/front/login.jsp");
		}
		// 判断当前登录用户是否是gid群组的，如果不是，跳转至该群组页面，提醒申请加入
		boolean flag = groupService.checkIfInGroup(((User) user).getId(), gid);
		if (!flag) {
			return new ViewWrapper(new ServerRedirectView("/group/detail?gid="
					+ gid + "&msg=" + "joinfirst"), null);
		}
		List<MsgType> typeList = msgTypeService
				.search(MsgType.class, Cnd.NEW());
		request.setAttribute("typeList", typeList);
		request.setAttribute("gid", gid);
		return new JspView("/page/front/message/message_form.jsp");
	}

	@At("/message/save")
	public View save(@Param("::msg.") Message msg, HttpServletRequest request)
			throws Exception {
		msg.setCreatetime(new Date());
		User user = (User) request.getSession().getAttribute("user");
		msg.setUid(user.getId());
		messageService.save(msg);
		return new ViewWrapper(new ServerRedirectView(
				"/message/message_detail?id=" + msg.getId()), null);
	}
}
