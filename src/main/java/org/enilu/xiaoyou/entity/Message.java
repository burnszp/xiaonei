package org.enilu.xiaoyou.entity;

import java.util.Date;
import java.util.List;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Many;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

/**
 * 消息实体
 * <p>
 * 2014年11月24日
 * 
 * @author enilu(82552623@qq.com)
 *         <p>
 */
@Table("fr_message")
public class Message {
	@Id
	private long id;
	@Column
	private String title;
	@Column
	private String descript;
	@Column
	private Date createtime;
	@Column
	private int status;
	@Column
	private long tid;
	@One(target = MsgType.class, field = "tid")
	private MsgType msgType;
	@Column
	private long uid;
	@One(target = User.class, field = "uid")
	private User user;// 文章分类
	@Column
	private long gid;
	@One(target = Group.class, field = "gid")
	private Group group;
	@Column("replay_id")
	private long replayId;
	@Many(target = Message.class, field = "replayId")
	private List<Message> replayList;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public long getTid() {
		return tid;
	}

	public void setTid(long tid) {
		this.tid = tid;
	}

	public MsgType getMsgType() {
		return msgType;
	}

	public void setMsgType(MsgType msgType) {
		this.msgType = msgType;
	}

	public long getUid() {
		return uid;
	}

	public void setUid(long uid) {
		this.uid = uid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getReplayId() {
		return replayId;
	}

	public void setReplayId(long replayId) {
		this.replayId = replayId;
	}

	public long getGid() {
		return gid;
	}

	public void setGid(long gid) {
		this.gid = gid;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public List<Message> getReplayList() {
		return replayList;
	}

	public void setReplayList(List<Message> replayList) {
		this.replayList = replayList;
	}

}
