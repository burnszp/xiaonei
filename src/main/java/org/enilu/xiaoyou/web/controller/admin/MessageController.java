package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.service.MessageService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 消息管理
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class MessageController {
	@Inject
	private MessageService messageService;

	@At("/admin/message")
	@Ok("jsp:/page/admin/message/message.jsp")
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
		List<Message> list = messageService.searchByPage(Message.class,
				Cnd.where("replayId", "=", 0), pager);
		int count = messageService.searchCount(Message.class,
				Cnd.where("replayId", "=", 0));
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

}
