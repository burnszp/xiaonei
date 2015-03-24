package org.enilu.xiaoyou.web.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.enilu.xiaoyou.entity.MsgType;
import org.enilu.xiaoyou.service.MsgTypeService;
import org.nutz.dao.Cnd;
import org.nutz.dao.pager.Pager;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.ioc.loader.annotation.IocBean;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

/**
 * 消息类型管理
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 */
@IocBean
public class MsgTypeController {
	@Inject
	private MsgTypeService msgTypeService;

	/**
	 * 显示所有的帖子类型
	 * 
	 * @param pageSize
	 * @param pageNumber
	 * @param request
	 */
	@At("/admin/msgtype")
	@Ok("jsp:/page/admin/msgtype/msgtype.jsp")
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
		List<MsgType> list = msgTypeService.searchByPage(MsgType.class,
				Cnd.NEW(), pager);
		int count = msgTypeService.searchCount(MsgType.class, Cnd.NEW());
		pager.setRecordCount(count);
		request.setAttribute("pager", pager);
		request.setAttribute("list", list);
	}

	@At("admin/msgtypeform")
	@Ok("jsp:/page/admin/msgtype/msgTypeForm.jsp")
	public MsgType form(@Param("id") Long id) {
		MsgType msgType = msgTypeService.find(id, MsgType.class);
		return msgType;
	}

	/**
	 * 根据帖子类型id批量删除帖子类型
	 * 
	 * @param id
	 *            用户id列表，eg:1,2,3,4,5
	 */
	@At("/admin/msgtype/delete")
	@Ok("redirect:/admin/msgtype")
	public void remove(@Param("ids") String ids) {
		if (ids != null) {
			String[] idArr = ids.split(",");
			for (String id : idArr) {
				if (id != null && !"".equals(id.trim())) {
					msgTypeService.delById(Long.valueOf(id), MsgType.class);
				}
			}
		}
	}

	@At("/admin/msgtype/save")
	@Ok("redirect:/admin/msgtype")
	public void save(@Param("::msgtype.") MsgType msgType) throws Exception {
		if (msgType.getId() == null) {
			msgTypeService.save(msgType);
		} else {
			msgTypeService.update(msgType);
		}
	}

}
