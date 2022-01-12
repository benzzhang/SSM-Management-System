package com.bme.dao;

import com.bme.domain.Journal;

import java.util.List;

public interface JournalMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Journal record);

    int insertSelective(Journal record);

    List<Journal> selectAll();

    List<Journal> selectByCondition(Journal journal);

    Journal selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Journal record);

    int updateByPrimaryKey(Journal record);
}