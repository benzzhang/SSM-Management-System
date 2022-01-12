package com.bme.domain;

public class Journal {
    private Integer id;

    private String name;

    private String publisher;

    private Float impactFactor;

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

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public Float getImpactFactor() {
        return impactFactor;
    }

    public void setImpactFactor(Float impactFactor) {
        this.impactFactor = impactFactor;
    }
}