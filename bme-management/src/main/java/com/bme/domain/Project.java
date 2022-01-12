package com.bme.domain;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Project {
    private Integer id;

    private String name;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date proposalTime;

    private String fileList;

    private String state;

    private Integer jid;

    private String summary;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getProposalTime() {
        return proposalTime;
    }

    public void setProposalTime(Date proposalTime) {
        this.proposalTime = proposalTime;
    }

    public String getFileList() {
        return fileList;
    }

    public void setFileList(String fileList) {
        this.fileList = fileList;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getJid() {
        return jid;
    }

    public void setJid(Integer jid) {
        this.jid = jid;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}