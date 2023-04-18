package com.kbstar.dto;

public class ProductDTO {
    private String id;
    private int price;
    private int quantity;
    private String name;

    public ProductDTO() {
    }

    public ProductDTO(String id, int price, int quantity, String name) {
        this.id = id;
        this.price = price;
        this.quantity = quantity;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "ProductDTO{" +
                "id='" + id + '\'' +
                ", price='" + price + '\'' +
                ", quantity='" + quantity + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}
