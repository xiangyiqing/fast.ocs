package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.util.FullSqlOperation;
import com.tju.fast.ocs.util.Page;
import com.tju.fast.ocs.util.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.sormula.Database;
import org.sormula.SormulaException;
import org.sormula.Table;
import org.sormula.operation.SelectCountOperation;
import org.sormula.translator.RowTranslator;

import java.util.List;

/**
 * 扩展了Sormula的Table类，主要增加了分页检索功能
 * <p>
 * Note: 有些操作需要根据使用的数据库产品量身定制
 *
 * @author Xiao Jian
 */
public class GenericDAO<R> extends Table<R> {

    final static Logger logger = LoggerFactory.getLogger(GenericDAO.class);

    public GenericDAO(Database db, Class<R> type) throws SormulaException {
        super(db, type);
    }

    /**
     * 删除实体对象集合
     */
    public int batchDelete(String[] ids) throws SormulaException {
        int count = 0;
        for (String id : ids) {
            int i = delete(id);
            count = count + i;
        }
        return count;
    }

    public R selectOne(String sql, Object... params) throws SormulaException {
        List<R> l = selectAllCustom(sql, params);
        if (l != null && l.size() > 0)
            return l.get(0);
        else return null;
    }

    /**
     * 根据查询语句分页
     *
     * @param <T>         泛型参数
     * @param pageNo      当前页数
     * @param pageSize    每页容量
     * @param orderClause 排序子句
     * @param sql         查询语句
     * @param params      查询参数
     * @return 分页结果集
     * @throws SormulaException
     */
    public Page<R> queryPage(final int pageNo, final int pageSize, final String orderClause,
                             final String sql, final Object... params) throws SormulaException {
        return this.queryPostgreSQLPage(pageNo, pageSize, orderClause, sql, params);
    }

    /**
     * 查询语句
     *
     * @param <T>         泛型参数
     * @param orderClause 排序子句
     * @param sql         查询语句
     * @param params      查询参数
     * @return 结果集
     * @throws SormulaException
     */
    public List<R> query(final String orderClause, final String sql, final Object... params) throws SormulaException {
        return this.queryPostgreSQL(orderClause, sql, params);
    }

    /**
     * PostgreSQL定制分页
     */
    private Page<R> queryPostgreSQLPage(final int pageNo, final int pageSize, final String orderClause,
                                        final String sql, final Object... params) throws SormulaException {
        SelectCountOperation<R> counter = new SelectCountOperation<R>(this);
        counter.setCustomSql(sql); //PostgreSQL: order by clause can't occurs in a aggregate function
        counter.execute();
        final int totalCount = counter.readCount();
        if (totalCount < 1) {
            return new Page<R>();
        }

        final int startIndex = (pageNo - 1) * pageSize;
        String qsql = (sql == null ? "" : sql) + (orderClause == null ? "" : orderClause) + " LIMIT " + pageSize + " OFFSET " + startIndex; //仅限于postgresql语法
        logger.debug("page sql : {}", qsql);
        List<R> result = selectAllCustom(qsql, params);
        return new Page<R>(totalCount, pageNo, pageSize, result);
    }

    /**
     * PostgreSQL
     */
    private List<R> queryPostgreSQL(final String orderClause,
                                    final String sql, final Object... params) throws SormulaException {
        String qsql = StringUtils.isEmpty(orderClause) ? sql : sql + " " + orderClause;
        logger.debug("page sql : {}", qsql);
        List<R> result = selectAllCustom(qsql, params);
        return result;
    }


    public String getColumnPhrase() {
        RowTranslator<R> rowTranslator = this.getRowTranslator();
        return rowTranslator.createColumnPhrase();
    }

    /**
     * 定制分页
     *
     * @param pageIndex 页序号
     * @param pageSize  页行数
     * @param sql       完整的SQL语句
     * @return
     * @throws SormulaException
     */
    public Page<R> queryCustomPage(int pageIndex, int pageSize, final String sql) throws SormulaException {
        SelectCountOperation<R> counter = new SelectCountOperation<R>(this);
        String whereSql = "";
        counter.setCustomSql(whereSql);
        counter.execute();
        int totalCount = counter.readCount();
        counter.close();
        if (totalCount < 1) {
            return new Page<R>();
        }
        FullSqlOperation<R> operation = new FullSqlOperation<>(this, "");
        operation.setCustomBaseSql(sql);
        List<R> result = operation.selectAll(sql);
        operation.close();
        return new Page<R>(totalCount, pageIndex, pageSize, result);
    }

    public int selectCount(final String sql, final Object... params) throws SormulaException {
        SelectCountOperation<R> counter = new SelectCountOperation<R>(this);
        String whereSql = "";
        counter.setCustomSql(whereSql);
        counter.execute();
        int totalCount = counter.readCount();
        counter.close();
        return totalCount;
    }
}
