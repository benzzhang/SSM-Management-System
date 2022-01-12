package com.bme.service;

import com.bme.domain.Journal;

import java.util.List;

public interface JournalService {
    List<Journal> getJournalList();
    List<Journal> getJournalListByCondition(Journal journal);
    int journalDel(Integer id);
    int journalUpdate(Journal journal);
    int journalAdd(Journal journal);
    Journal getJournalById(Integer id);
}
