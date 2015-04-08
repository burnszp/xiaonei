package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.College;
import org.enilu.xiaoyou.service.SchoolService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 学校管理
 * <p>
 * 2014年9月26日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class SchoolController {
	@Inject
	private SchoolService schoolService;

	@At("/admin/school")
	@Ok("jsp:/page/admin/school.jsp")
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
		List<College> list = schoolService.searchByPage(College.class,
				Cnd.NEW(), pager);
		int count = schoolService.searchCount(College.class, Cnd.NEW());
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

	@At("/admin/schoolcollect")
	@Ok("redirect:/admin/school")
	public void collect() {
		schoolService.collect();
	}
}
