package org.enilu.xiaoyou.entity;

import java.util.Date;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.One;
import org.nutz.dao.entity.annotation.Table;

/**
 * 群组实体
 * <p>
 * 2014年11月24日
 * 
 * @author enilu(82552623@qq.com)
 *         <p>
 */
@Table("fr_group")
public class Group {
	public static final int STATUS_HUODONG = 1;
	public static final int STATUS_GUANBI = 2;
	public static final int STATUS_JIESAN = 3;
	@Id
	private long id;
	@Column
	private String gname;
	@Column
	private String descript;
	@Column
	private int status;// 群组状态：1：活动小组；2：已关闭,3:已解散
	@Column("college")
	private Long collegeId;// 所属学校Id
	@One(target = College.class, field = "collegeId")
	private College college;
	@Column("addr_code")
	private Long addrCode;// 学校所属地区编号
	@One(target = Region.class, field = "addrCode")
	private Region region;
	@Column
	private Date createtime;// 群组创建时间
	@Column("creator_id")
	private Long creatorId;// 创建者id
	@One(target = User.class, field = "creatorId")
	private User creator;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public Region getRegion() {
		return region;
	}

	public void setRegion(Region region) {
		this.region = region;
	}

	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Long getAddrCode() {
		return addrCode;
	}

	public void setAddrCode(Long addrCode) {
		this.addrCode = addrCode;
	}

	public Long getCreatorId() {
		return creatorId;
	}

	public void setCreatorId(Long creatorId) {
		this.creatorId = creatorId;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

}
