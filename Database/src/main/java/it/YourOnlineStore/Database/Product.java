package it.YourOnlineStore.Database;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.*;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Integer productId;

    private String productName;
    private Float cost;
    private Integer disponibiliy;
    private String description;
    private String imageUrl;

    public Integer getProductId() {return this.productId;}

    public String getProductName(){return this.productName;}
    public void setProductName(String productName){this.productName = productName;}

    public Float getCost(){return this.cost;}
    public void setCost(Float cost){this.cost = cost;}

    public Integer getDisponibiliy(){return this.disponibiliy;}
    public void setDisponibiliy(Integer disponibility) {this.disponibiliy = disponibility;}

    public String getImageUrl(){return this.imageUrl;}
    public void setImage(String imageUrl){
        this.imageUrl = imageUrl;
    }

    public String getDescription(){return this.description;}
    public void setDescription(String description){this.description = description;}
    public void buy(){this.disponibiliy-=1;}
}
