package com.bme.service.impl;

import com.bme.dao.JournalMapper;
import com.bme.domain.Journal;
import com.bme.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JournalServiceImpl implements JournalService {

    @Autowired
    private JournalMapper journalMapper;

    @Override
    public List<Journal> getJournalList() {
        return journalMapper.selectAll();
    }

    @Override
    public List<Journal> getJournalListByCondition(Journal journal) {
        return journalMapper.selectByCondition(journal);
    }

    @Override
    public int journalDel(Integer id) {
        return journalMapper.deleteByPrimaryKey(id);
    }

    @Override
    public int journalUpdate(Journal journal) {
        return journalMapper.updateByPrimaryKeySelective(journal);
    }

    @Override
    public int journalAdd(Journal journal) {
        return journalMapper.insertSelective(journal);
    }

    @Override
    public Journal getJournalById(Integer id) {
        return journalMapper.selectByPrimaryKey(id);
    }
}
