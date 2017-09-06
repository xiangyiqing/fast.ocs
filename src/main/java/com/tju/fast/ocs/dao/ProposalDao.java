package com.tju.fast.ocs.dao;

import com.tju.fast.ocs.po.Fastproposal;
import org.springframework.stereotype.Repository;

@Repository
public class ProposalDao extends DAOTemplate<Fastproposal> {

    public ProposalDao() {
        super(Fastproposal.class);
    }

}
