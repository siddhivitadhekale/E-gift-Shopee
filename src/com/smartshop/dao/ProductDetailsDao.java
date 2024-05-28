package com.smartshop.dao;

import java.util.List;
import java.util.Map;

import com.smartshop.pojo.ProductCartPojo;
import com.smartshop.pojo.ProductCategoryPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.Product_sub_categoryPojo;
import com.smartshop.pojo.TransctionLinePojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;

public interface ProductDetailsDao {

	public List<ProductDetailsPojo> getAllProductDetailsPojo();
	public List<ProductDetailsPojo> getAllProductDetailsPojoByCategory(String category_code);
	
	public Map<String,List<ProductCategoryPojo>> getAllProductCategory();
	public List<Product_sub_categoryPojo>  getAllSubCategory(String category_code);
	public List<ProductDetailsPojo> getAllProductDetailsPojoBySubCategory(String sub_category_code);
	
	public ProductDetailsPojo getProductByCode(int pid);
	
	public boolean addToCart(ProductCartPojo productCartPojo);
	
	public boolean deleteProductById(int productId);
	
	public boolean addToView(ViewPojo viewPojo);
	
	public List<ProductDetailsPojo> allProductOnPattern(String query);
	
	//public List<Product_sub_categoryPojo> getAllsubcategory();
	
	public Map<String,List<Product_sub_categoryPojo>> getAllsubcategory();
	
	public ProductCartPojo getDetails(int productid);
	
	public boolean deleteProductByProductId(int productId);
	
	
	
	public List<ProductDetailsPojo> getAllProductByApriori(int pid);
	public ProductCartPojo getdata(int productid);
	
	public List<TransctionLinePojo> getAllDistinctProduct();
	
}
