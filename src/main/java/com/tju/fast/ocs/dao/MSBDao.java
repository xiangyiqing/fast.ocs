package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.MSB;
import org.springframework.stereotype.Repository;

@Repository
public class MSBDao extends DAOTemplate<MSB> {

    public MSBDao() {
        super(MSB.class);
    }

}
