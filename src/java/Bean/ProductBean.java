package Bean;

import java.io.Serializable;
import java.util.ArrayList;
import LocaleFiles.*;
import java.util.ResourceBundle;

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
    private Language lang;
    private int amount;
    
    public String getLang(){return lang.getLanguage();}
    public void setLang(String l){
        lang = Language.getByCode(l);
    }
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
    
    public ProductBean(String productId, String language) {
        setLang(language);
        ResourceBundle resourceBundle = lang.getLocaleFile();
        this.productId = productId;
        this.groupOfProduct = resourceBundle.getString("Type"+ productId);
        this.productImage = resourceBundle.getString("ProductImage"+ productId);
        this.nameBag = resourceBundle.getString("NameBag" + productId);
        this.price = resourceBundle.getString("Price" + productId) ;
        this.description1 = resourceBundle.getString("Description1"+ productId);
        this.description2 = resourceBundle.getString("Description2"+ productId);
        this.description3 = resourceBundle.getString("Description3"+ productId);
        this.description4 = resourceBundle.getString("Description4"+ productId);
        this.amount = 0;
    }

}

