package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.service.GroupService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 群组管理
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class GroupController {
	@Inject
	private GroupService groupService;

	@At("/admin/group")
	@Ok("jsp:/page/admin/group.jsp")
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
		List<Group> list = groupService.searchByPage(Group.class, Cnd.NEW(),
				pager);
		int count = groupService.searchCount(Group.class, Cnd.NEW());
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

	@At("/admin/updategroupstatus")
	@Ok("json")
	public boolean updateGroupStatus(@Param("id") long id,
			@Param("status") int status, @Param("msg") String statusMsg) {
		return groupService.updateGroupStatus(id, status, statusMsg);

	}

}
