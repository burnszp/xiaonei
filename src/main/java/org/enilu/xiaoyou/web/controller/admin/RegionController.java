package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Region;
import org.enilu.xiaoyou.service.RegionService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 地区管理
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class RegionController {
	@Inject
	private RegionService regionService;

	@At("/admin/region")
	@Ok("jsp:/page/admin/region/province.jsp")
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
		List<Region> list = regionService.searchByPage(Region.class,
				Cnd.where("id", "like", "%0000"), pager);
		int count = regionService.searchCount(Region.class,
				Cnd.where("id", "like", "%0000"));
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

	@At("/admin/region/cities")
	@Ok("jsp:/page/admin/region/cities.jsp")
	public void index(@Param("ps") Integer pageSize,
			@Param("pn") Integer pageNumber, @Param("pid") String provinceId,
			HttpServletRequest request) {
		Pager pager = new Pager();
		if (pageNumber == null) {
			pageNumber = 1;
		}
		if (pageSize == null) {
			pageSize = 10;
		}
		pager.setPageNumber(pageNumber);
		pager.setPageSize(pageSize);
		List<Region> list = regionService.searchByPage(
				Region.class,
				Cnd.where("id", "like", provinceId.substring(0, 2) + "%").and(
						"id", "<>", provinceId), pager);
		int count = regionService.searchCount(
				Region.class,
				Cnd.where("id", "like", provinceId.substring(0, 2) + "%").and(
						"id", "<>", provinceId));
		pager.setRecordCount(count);
		request.setAttribute("pid", provinceId);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}
}
