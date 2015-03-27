package org.enilu.xiaoyou.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.enilu.xiaoyou.entity.Message;
import org.nutz.dao.Cnd;
import org.nutz.dao.Condition;
import org.nutz.dao.Sqls;
import org.nutz.dao.pager.Pager;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 消息管理service
 * <p>
 * 2014年11月24日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@IocBean
public class MessageService extends GeneralService {

	public List<Message> findNew() {
		List<Message> messageList = (List<Message>) search(
				Message.class,
				Cnd.NEW()
						.wrap("title is not null  order by createtime desc limit 0,20"));
		for (Message msg : messageList) {
			dao.fetchLinks(msg, "user");
		}
		return messageList;
	}

	public List<Message> findHot() {
		// ;
		Sql sql = Sqls
				.create("select replay_id   from fr_message group by replay_id having replay_id is not null order by count(*) desc limit 0,10");
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql)
					throws SQLException {
				List<Long> list = new LinkedList<Long>();
				while (rs.next())
					list.add(rs.getLong("replay_id"));
				return list;
			}
		});
		dao.execute(sql);
		List<Long> idList = sql.getList(Long.class);
		if (idList != null && idList.size() > 0) {
			String sqlStr = "id in(" + idList.get(0);
			for (int i = 1; i < idList.size(); i++) {
				sqlStr += "," + idList.get(i);
			}
			sqlStr += ")";
			List<Message> messageList = search(Message.class, Cnd.wrap(sqlStr));
			for (Message msg : messageList) {
				dao.fetchLinks(msg, "user");
			}

			return messageList;
		}
		return null;
	}

	public Message find(long id) {
		Message msg = dao.fetch(Message.class, id);
		dao.fetchLinks(msg, "user");
		dao.fetchLinks(msg, "group");
		dao.fetchLinks(msg, "msgType");
		dao.fetchLinks(msg, "replayList");
		List<Message> replayList = msg.getReplayList();
		for (Message replay : replayList) {
			dao.fetchLinks(replay, "user");
		}
		return msg;
	}

	public List<Message> searchByPage(Condition condition, Pager pager) {
		List<Message> list = super
				.searchByPage(Message.class, condition, pager);
		for (Message msg : list) {
			dao.fetchLinks(msg, "user");
			dao.fetchLinks(msg, "group");
			dao.fetchLinks(msg, "msgType");
		}
		return list;
	}

}
