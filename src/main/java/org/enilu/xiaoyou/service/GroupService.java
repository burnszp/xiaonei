package org.enilu.xiaoyou.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.enilu.xiaoyou.entity.Group;
import org.enilu.xiaoyou.entity.Message;
import org.enilu.xiaoyou.entity.MsgBox;
import org.enilu.xiaoyou.entity.User;
import org.nutz.dao.Cnd;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 群组管理service
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@IocBean
public class GroupService extends GeneralService {
	/**
	 * 更新群组状态
	 * 
	 * @param id
	 *            id
	 * @param status
	 *            要更改为的状态
	 * @param statusMsg
	 *            更改群组原因
	 */
	public boolean updateGroupStatus(long id, int status, String statusMsg) {
		Group entity = find(id, Group.class);
		entity.setStatus(status);
		String operate = "";
		switch (status) {
		case Group.STATUS_GUANBI:
			operate = "关闭";
			break;
		case Group.STATUS_HUODONG:
			operate = "恢复活动：";
			break;
		case Group.STATUS_JIESAN:
			operate = "解散";
			break;

		}
		try {
			update(entity);
			entity.getCreator();
			MsgBox msg = new MsgBox();
			msg.setSendUser("系统管理员");
			msg.setDescript(operate + "群组：【" + entity.getGname() + "】备注："
					+ statusMsg);
			msg.setSendDate(new Date());
			msg.setIfRead(MsgBox.NO_READ);
			msg.setReceiveUser(entity.getCreatorId());
			save(msg);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;

	}

	/**
	 * 查询最新12条活跃度最高的小组
	 * 
	 * @return
	 */
	public List<Group> findHot() {

		return (List<Group>) search(
				Group.class,

				Cnd.wrap("WHERE status="
						+ Group.STATUS_HUODONG
						+ " and id IN(select gid from fr_message GROUP BY gid ORDER BY count(*) DESC) order by id  limit 0,4"));

	}

	/**
	 * 查询最近创建的的小组
	 * 
	 * @return
	 */
	public List<Group> findNew() {

		return (List<Group>) search(
				Group.class,

				Cnd.wrap("where status=" + Group.STATUS_HUODONG
						+ " order by createtime desc limit 0,4"));

	}

	public List<User> findAllUserByGroupId(Long gid) {
		return (List<User>) search(
				User.class,
				Cnd.wrap("where id in(select fr_user_id from fr_user_group where fr_group_id="
						+ gid + ")"));
	}

	public List<Message> findMessagesByGroupId(String gid) {
		return (List<Message>) search(Message.class, Cnd.NEW()
				.wrap("where 1=1"));
	}

	public Group find(Long gid) {
		Group group = dao.fetch(Group.class, gid);
		dao.fetchLinks(group, "college");
		dao.fetchLinks(group, "region");
		return group;
	}

	/**
	 * 判断用户是否加入指定的群组
	 * 
	 * @param uid
	 *            用户id
	 * @param gid
	 *            群组id
	 * @return
	 */
	public boolean checkIfInGroup(Long uid, Long gid) {
		Sql sql = Sqls
				.create("select * from fr_user_group where fr_group_id=@gid and fr_user_id=@uid");
		sql.params().set("uid", uid);
		sql.params().set("gid", gid);

		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql)
					throws SQLException {
				List<Long> list = new LinkedList<Long>();
				while (rs.next())
					list.add(rs.getLong("id"));
				return list;
			}
		});
		dao.execute(sql);
		List<Long> idList = sql.getList(Long.class);
		if (idList != null && idList.size() > 0) {
			return true;
		}
		return false;
	}

	/**
	 * 用户加入某个群组
	 * 
	 * @param gid
	 *            群组id
	 * @param uid
	 *            用户id
	 */
	public void join(Long gid, Long uid) {
		Sql sql = Sqls
				.create("insert into fr_user_group(fr_group_id,fr_user_id) values(@gid,@uid)");
		sql.params().set("gid", gid).set("uid", uid);
		dao.execute(sql);

	}

	public void quit(Long gid, Long uid) {
		Sql sql = Sqls
				.create("delete from fr_user_group where fr_group_id =@gid and fr_user_id=@uid");
		sql.params().set("gid", gid).set("uid", uid);
		dao.execute(sql);

	}

	public List<Group> findLinks(List<Group> list) {
		for (Group g : list) {
			dao.fetchLinks(g, "college");
			dao.fetchLinks(g, "region");
		}
		return list;
	}
}
