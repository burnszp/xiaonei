var ioc = {
		
		
    // 数据源
    dataSource : {
        type :"com.alibaba.druid.pool.DruidDataSource",
        events : {
            depose :"close"
        },
        fields : {
            driverClassName : "com.mysql.jdbc.Driver",
            url             : "jdbc:mysql://localhost:3306/xiaoyou",
            username        : "root",
            password        : "root",
            initialSize     : 10,
            maxActive       : 100,
            testOnReturn    : true,
            validationQuery : "select 1"
        }
    },
    // Dao
    dao : {
        type :'org.nutz.dao.impl.NutDao',
        args : [ {refer :"dataSource"}]
    }

};
