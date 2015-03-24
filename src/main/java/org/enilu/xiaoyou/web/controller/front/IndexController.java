package org.enilu.xiaoyou.web.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.service.GroupService;
import org.enilu.xiaoyou.service.InitService;
import org.enilu.xiaoyou.service.MessageService;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * 首页管理
 * <p>
 * 2014年11月26日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class IndexController {
	@Inject
	private GroupService groupService;
	@Inject
	private MessageService messageService;
	@Inject
	private InitService initService;

	@At("/")
	@Ok("jsp:/page/front/index.jsp")
	public void index(HttpServletRequest request) {
		initService.init();
		// 最热的四个群组
		List<Group> hotGroupList = groupService.findHot();
		// 最新的四个群组
		List<Group> newGroupList = groupService.findNew();
		// 最新的帖子（测试查的所有前6个)
		List<Message> newMessageList = messageService.findNew();
		List<Message> hotMessageList = messageService.findHot();
		request.setAttribute("hotGroupList", hotGroupList);
		request.setAttribute("newGroupList", newGroupList);
		request.setAttribute("newMessageList", newMessageList);
		request.setAttribute("hotMessageList", hotMessageList);
	}

}
