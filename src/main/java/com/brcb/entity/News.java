package com.brcb.entity;

import java.io.Serializable;
import java.util.Date;

public class News implements Serializable {
    private String id;

    private String title;

    private String author;

    private Date date;

    private String type_id;

    private String digest;

    private String text;

    private String pig_path;

    public String getPig_path() {
        return pig_path;
    }

    public void setPig_path(String pig_path) {
        this.pig_path = pig_path;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getType_id() {
        return type_id;
    }

    public void setType_id(String type_id) {
        this.type_id = type_id;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    @Override
    public String toString() {
        return "News{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", date=" + date +
                ", type_id='" + type_id + '\'' +
                ", digest='" + digest + '\'' +
                ", text='" + text + '\'' +
                ", pig_path='" + pig_path + '\'' +
                '}';
    }
}