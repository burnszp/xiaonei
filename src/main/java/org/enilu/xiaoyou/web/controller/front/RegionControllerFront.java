package org.enilu.xiaoyou.web.controller.front;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.Region;
import org.enilu.xiaoyou.service.RegionService;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;

/**
 * 
 * @author burns
 *
 */
@IocBean
public class RegionControllerFront {
	@Inject
	private RegionService regionService;

	@At("/front/regist")
	@Ok("jsp:/page/front/regist.jsp")
	public void index(HttpServletRequest request) {
		List<Region> pList = regionService.search(Region.class,
				Cnd.where("id", "like", "%0000"));
		// Region region = new Region();
		// region.setName("---请选择---");
		// pList.add(region);
		request.setAttribute("pList", pList);
	}

	// @At("/front/checkName")
}
