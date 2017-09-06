package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.Euser;
import org.sormula.SormulaException;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDao extends DAOTemplate<Euser> {

    public UserDao() {
        super(Euser.class);
    }

    public Euser login(String username, String pwd) throws SormulaException {
        List<Euser> u = query(null, "where username = ? and password = ? and status != '0' ", new Object[]{username, pwd});
        return u != null ? (u.size() > 0 ? u.get(0) : null) : null;
    }

    public boolean isAvailable(String username) throws SormulaException {
        //List<Euser> u = query(null,"where username = ?", new Object[]{username});
        //return u==null||u.size()==0;
        return selectCount("where username = ?", new Object[]{username}) == 0;
    }

    @Override
    public int save(Euser row) throws SormulaException {
        Integer num = selectMax("userid");
        row.setUserid(num + 1);
        return super.save(row);
    }

}
