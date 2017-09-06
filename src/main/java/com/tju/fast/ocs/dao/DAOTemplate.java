package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.util.Page;
import org.sormula.Database;
import org.sormula.SormulaException;
import org.sormula.Table;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Collection;
import java.util.List;

/**
 * 仿照Spring JdbcTemplate的设计思路，封装了Database的创建和销毁。
 * <p>
 * 设计初衷：
 * 使用sormula的话，一个database对象会绑定一个数据库连接,直到database被关闭。
 * spring默认Controller是singleton模式，如果database在Controler内共享(作为对象的属性)，, 有两个弊端：
 * 1. database不适合多线程使用,容易出错。
 * 2. Spring上下文中有多少个controller实例，就会有多少个数据库连接被长时间占用。
 * <p>
 * 对于少数需要几个SQL联合完成的一个事务而言，可以手动创建Database对象,
 * 在一个事务內，使用任意多个GenericDAO<R>或是Table<R>对象完成一系列sql操作,
 * 使用示例可参见UserRepository。
 * <p>
 * Sormula Database: Source of Table objects for reading/writing from/to database.
 * For single threaded use  only. Construct new instances for each transaction and/or thread.
 *
 * @author Xiao Jian
 */
public class DAOTemplate<R> {


    @Resource(name = "dataSource")
    private DataSource dataSource;
    private Class<R> rowClass;

    public DAOTemplate(Class<R> rowClass) {
        this.rowClass = rowClass;
    }

    public DAOTemplate(DataSource dataSource, Class<R> rowClass) {
        this.dataSource = dataSource;
        this.rowClass = rowClass;
    }


    public R selectOne(String sql, Object... params) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectOne(sql, params);
        }
    }

    public int batchDelete(String[] ids) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.batchDelete(ids);
        }
    }

    public List<R> query(final String orderClause, final String sql, final Object... params) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.query(orderClause, sql, params);
        }
    }

    public Page<R> queryPage(final int pageNo, final int pageSize, final String orderClause,
                             final String sql, final Object... params) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.queryPage(pageNo, pageSize, orderClause, sql, params);
        }
    }

    public Page<R> queryPage(final int pageNo, final int pageSize, final String orderClause,
                             final String baseSql, final String whereSql, final Object... params) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.queryPage(pageNo, pageSize, orderClause, baseSql, whereSql, params);
        }
    }

    public Page<R> queryCustomPage(int pageIndex, int pageSize, final String sql) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            GenericDAO<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.queryCustomPage(pageIndex, pageSize, sql);
        }
    }

    public int delete(R row) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.delete(row);
        }
    }

    public int delete(Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.delete(parameters);
        }
    }

    public int deleteAll() throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.deleteAll();
        }
    }

    public int deleteAll(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.deleteAll(rows);
        }
    }

    public int deleteAllBatch(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.deleteAllBatch(rows);
        }
    }

    public int insert(R row) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.insert(row);
        }
    }

    public int insertAll(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.insertAll(rows);
        }
    }

    public int insertAllBatch(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.insertAllBatch(rows);
        }
    }

    public int save(R row) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.save(row);
        }
    }

    public int saveAll(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.saveAll(rows);
        }
    }

    public R select(Object... primaryKeys) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.select(primaryKeys);
        }
    }

    public List<R> selectAll() throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectAll();
        }
    }

    public List<R> selectAllCustom(String customSql, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectAllCustom(customSql, parameters);
        }
    }

    public List<R> selectAllWhere(String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectAllWhere(whereConditionName, parameters);
        }
    }

    public List<R> selectAllWhereOrdered(String whereConditionName, String orderByName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectAllWhereOrdered(whereConditionName, orderByName, parameters);
        }
    }

    public <T> T selectAvg(String expression) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectAvg(expression);
        }
    }

    public <T> T selectCount(String expression, String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectCount(expression, whereConditionName, parameters);
        }
    }

    public int selectCount(String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectCount(whereConditionName, parameters);
        }
    }

    public <T> T selectCount(String expression) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectCount(expression);
        }
    }

    public R selectCustom(String customSql, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectCustom(customSql, parameters);
        }
    }

    public <T> T selectMax(String expression, String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectMax(expression, whereConditionName, parameters);
        }
    }

    public <T> T selectMax(String expression) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectMax(expression);
        }
    }

    public <T> T selectMin(String expression, String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectMin(expression);
        }
    }

    public <T> T selectMin(String expression) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectMin(expression);
        }
    }

    public <T> T selectSum(String expression, String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectSum(expression, whereConditionName, parameters);
        }
    }

    public <T> T selectSum(String expression) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectSum(expression);
        }
    }

    public R selectWhere(String whereConditionName, Object... parameters) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.selectWhere(whereConditionName, parameters);
        }
    }

    public int update(R row) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.update(row);
        }
    }

    public int updateAll(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.updateAll(rows);
        }
    }

    public int updateAllBatch(Collection<R> rows) throws SormulaException {
        try (Database db = new Database(this.dataSource)) {
            Table<R> dao = new GenericDAO<R>(db, rowClass);
            return dao.updateAllBatch(rows);
        }
    }
}
