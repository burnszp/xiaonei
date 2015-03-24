package org.enilu.xiaoyou.entity;

import org.nutz.dao.entity.annotation.Column;
import org.nutz.dao.entity.annotation.Id;
import org.nutz.dao.entity.annotation.Table;

/**
 * 地区表
 * <p>
 * 2014年9月29日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@Table("sys_region")
public class Region {
	@Id
	private long id;
	@Column
	private String name;
	@Column
	private String descript;
	@Column
	private String lng;
	@Column
	private String lat;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

}
