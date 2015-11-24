package Bean;

import java.io.Serializable;
import java.util.ArrayList;

public class ProductBean implements Serializable{
    
    private String productId;
    private String groupOfProduct;
    private String productImage;
    private String nameBag;
    private String price;
    private String description1;
    private String description2;
    private String description3;
    private String description4;
    private int amount;
    
    private static ArrayList<ProductBean> clothList = new ArrayList<>();
    
    public String getProductId() {
        return productId;
    }
    public void setProductId(String productId) {
        this.productId = productId;
    }   
    public String getGroupOfProduct() {
        return groupOfProduct;
    }
    public void setGroupOfProduct(String groupOfProduct) {
        this.groupOfProduct = groupOfProduct;
    }
    public String getProductImage() {
        String tmp = productImage.replace("IMG-file/", "");
        return tmp;
    }
    public String getProductImageFull() {
        return productImage;
    }
    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }
    public String getNameBag() {
        return nameBag;
    }
    public void setNameBag(String nameBag) {
        this.nameBag = nameBag;
    }
    public String getPrice() {
        return price;
    }
    public void setPrice(String price) {
        this.price = price;
    }
    public String getDescription1() {
        return description1;
    }
    public void setDescription1(String description1) {
        this.description1 = description1;
    }
    public String getDescription2() {
        return description2;
    }
    public void setDescription2(String description2) {
        this.description2 = description2;
    }
    public String getDescription3() {
        return description3;
    }
    public void setDescription3(String description3) {
        this.description3 = description3;
    }
    public String getDescription4() {
        return description4;
    }
    public void setDescription4(String description4) {
        this.description4 = description4;
    }
    public String increaseAmount() {
        this.amount = this.amount +1;
        int tmp = this.amount;
        return Integer.toString(tmp);
    }
    public int getAmount() {
        return this.amount;
    }
    
    public ProductBean() {
        this.amount = 0;
    }
    
    public ProductBean(String productId, String groupOfProduct, String productImage,String nameBag, String price, String description1, String description2, String description3, String description4) {
        this.productId = productId;
        this.groupOfProduct = groupOfProduct;
        this.productImage = productImage;
        this.nameBag = nameBag;
        this.price = price;
        this.description1 = description1;
        this.description2 = description2;
        this.description3 = description3;
        this.description4 = description4;
        this.amount = 0;
    }
    
    public static void addNewProduct(String productId, String groupOfProduct, String productImage,String nameBag, String price, String description1, String description2, String description3, String description4) {
        clothList.add(new ProductBean(productId,groupOfProduct,productImage,nameBag,price,description1,description2,description3,description4));
    }
   
    public static ArrayList<ProductBean> getAllProducts() {
        return clothList;
    }

}

