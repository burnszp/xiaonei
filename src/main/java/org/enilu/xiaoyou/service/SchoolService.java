package org.enilu.xiaoyou.service;

import org.enilu.xiaoyou.entity.College;
import org.enilu.xiaoyou.entity.Region;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.nutz.dao.Cnd;
import org.nutz.ioc.loader.annotation.IocBean;

/**
 * 学校管理service
 * <p>
 * 2014年9月29日
 * <p>
 * 
 * @author enilu(82552623@qq.com)
 * 
 * 
 */
@IocBean
public class SchoolService extends GeneralService {
	/**
	 * 清空学员信息
	 */
	public void clear() {
		delete("college", Cnd.NEW());
	}

	public void collect() {

		String url = "http://edu.sina.com.cn/gaokao/2014-08-08/1903430534.shtml";
		try {
			Document doc = Jsoup.connect(url).timeout(100000).get();
			Elements es = doc.getElementsByTag("tbody").get(0)
					.getElementsByTag("a");
			for (Element e : es) {

				Document doc2 = Jsoup.connect(e.attr("href")).timeout(100000)
						.get();
				Elements es2 = doc2.getElementsByTag("tbody").get(0).children();
				for (int i = 2; i < es2.size(); i++) {
					Element e2 = es2.get(i);
					Elements es3 = e2.children();
					College c = new College();
					c.setCname(es3.get(1).text().trim());
					Region r = findByCondition(Region.class, "name", es3.get(3)
							.text().trim());
					c.setAddrCode(r != null ? r.getId() : null);
					c.setAddr(es3.get(3).text().trim());
					save(c);
				}

			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}

	}
}
