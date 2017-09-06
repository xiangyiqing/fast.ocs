package com.tju.fast.ocs.service.impl;

import com.tju.fast.ocs.dao.ProposalDao;
import com.tju.fast.ocs.po.Fastproposal;
import com.tju.fast.ocs.service.IProposalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProposalService extends BaseService<Fastproposal> implements IProposalService {

    ProposalDao propDao;

    @Autowired
    public ProposalService(ProposalDao arg) {
        super(arg);
        this.propDao = arg;
    }

}
