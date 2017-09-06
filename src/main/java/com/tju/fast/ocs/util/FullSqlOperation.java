package com.tju.fast.ocs.util;

import org.sormula.Table;
import org.sormula.operation.ArrayListSelectOperation;
import org.sormula.operation.OperationException;

/**
 * 为完全控制Sormula SELECT sql的生成。
 *
 * @author Xiao Jian
 */
public class FullSqlOperation<R> extends ArrayListSelectOperation<R> {


    public FullSqlOperation(Table<R> table) throws OperationException {
        super(table);
    }

    public FullSqlOperation(Table<R> table, String where) throws OperationException {
        super(table, where);
    }

    @Override
    public String getSql() {
        return super.getSql();
    }

    public void setCustomBaseSql(String sql) {
        super.setBaseSql(sql);
    }
    
    /*
    protected void initBaseSql()
    {
        String tableName = getTable().getQualifiedTableName();
        RowTranslator<R> rowTranslator = getTable().getRowTranslator();
        rowTranslator.setIncludeIdentityColumns(isIncludeIdentityColumns()); // usually true for selects
        String selectColumnPhrase = rowTranslator.createColumnPhrase(); 
        StringBuilder sql = new StringBuilder(selectColumnPhrase.length() + tableName.length() + 50);
        
        sql.append("SELECT ");
        sql.append(selectColumnPhrase);
        sql.append(" FROM ");
        sql.append(tableName);
        
        setBaseSql(sql.toString());
    }
    */
    
    /*
     protected String getSql()
    {
        String sql = getBaseSql();
        
        if (customSql != null)
        {
        	sql += " " + customSql;
        }
        
        AbstractWhereTranslator<R> wt = getWhereTranslator(); 
        if (wt != null)
        {
            wt.setParameters(getParameters());
            sql += " " + wt.createSql();
        }
        
        return sql;
    }
    */
}
