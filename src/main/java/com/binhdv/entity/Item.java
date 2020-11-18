package com.binhdv.entity;

import org.springframework.web.bind.annotation.CrossOrigin;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @OneToOne
    private Book book;

    @Column(name = "quantity")
    private int quantity;

    @Column(name = "totalprice")
    private int totalprice;

    @Column(name = "status")
    private int status;

    @Column(name = "placedTime")
    private Date placedTime;

    @Column(name = "shippedTime")
    private int shippedTime;

    @Column(name = "deliveredTime")
    private Date deliveredTime;

    @Column(name = "cancelTime")
    private Date cancelTime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(int totalprice) {
        this.totalprice = totalprice;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getPlacedTime() {
        return placedTime;
    }

    public void setPlacedTime(Date placedTime) {
        this.placedTime = placedTime;
    }

    public int getShippedTime() {
        return shippedTime;
    }

    public void setShippedTime(int shippedTime) {
        this.shippedTime = shippedTime;
    }

    public Date getDeliveredTime() {
        return deliveredTime;
    }

    public void setDeliveredTime(Date deliveredTime) {
        this.deliveredTime = deliveredTime;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }
}
