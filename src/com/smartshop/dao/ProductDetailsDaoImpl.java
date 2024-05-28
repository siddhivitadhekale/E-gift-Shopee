package com.smartshop.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.sql.*;

import com.smartshop.pojo.ProductCartPojo;
import com.smartshop.pojo.ProductCategoryPojo;
import com.smartshop.pojo.ProductDetailsPojo;
import com.smartshop.pojo.Product_sub_categoryPojo;
import com.smartshop.pojo.TransctionLinePojo;
import com.smartshop.pojo.UserPojo;
import com.smartshop.pojo.ViewPojo;
import com.smartshop.util.MyConnection;

public class ProductDetailsDaoImpl implements ProductDetailsDao{

	@Override
	public List<ProductDetailsPojo> getAllProductDetailsPojo() {

		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details ORDER BY RAND() DESC LIMIT 20");
		
			
			ResultSet rs=ps.executeQuery();
			List<ProductDetailsPojo> listvalue=new ArrayList<ProductDetailsPojo>();
			while(rs.next())
			{
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo();
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_fabrics(rs.getString("Product_fabrics"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				listvalue.add(productDetailsPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
		}
		return null;
	}

	@Override
	public List<ProductDetailsPojo> getAllProductDetailsPojoByCategory(
			String category_code) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details where category_code=?");
			//ps.setInt(1, 1);
			ps.setString(1, category_code);
			ResultSet rs=ps.executeQuery();
			System.out.println("result"+ps);
			List<ProductDetailsPojo> listvalue=new ArrayList<ProductDetailsPojo>();
			while(rs.next())
			{
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo();
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_fabrics(rs.getString("Product_fabrics"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				listvalue.add(productDetailsPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public Map<String, List<ProductCategoryPojo>> getAllProductCategory() {
		// TODO Auto-generated method stub
		Connection  conn=null;
		PreparedStatement ps=null,ps1=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_type");
		
			Map<String, List<ProductCategoryPojo>> typeList=new HashMap<String,List<ProductCategoryPojo>>();
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				String code=rs.getString("code");
				System.out.println("code is"+code);
				String description=rs.getString("description");
				System.out.println("typecode"+code);
				System.out.println("typedescription"+description);
				ps1=conn.prepareStatement("select * from product_category where type_code='"+code+"'");
				List<ProductCategoryPojo> categorylist=new ArrayList<ProductCategoryPojo>();
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					ProductCategoryPojo productCategoryPojo=new ProductCategoryPojo();
					productCategoryPojo.setCode(rs1.getString("code"));
					productCategoryPojo.setDescription(rs1.getString("description"));
					categorylist.add(productCategoryPojo);
				}
				typeList.put(code, categorylist);
			}
			return typeList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ProductDetailsPojo getProductByCode(int pid) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		
		try {
			
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details where product_id=?");
					
			ps.setInt(1, pid);
			
			ResultSet rs=ps.executeQuery();
			
			if(rs.next())
			{
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo(); 
				
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_fabrics(rs.getString("Product_fabrics"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				
				return productDetailsPojo;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public boolean addToCart(ProductCartPojo productCartPojo) {
		System.out.println("jdjs"+productCartPojo.getUsername() + productCartPojo.getProduct_id() + productCartPojo.getPrice());
		// TODO Auto-generated method stub
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into product_cart(product_id,quantity,price,user_name,total_price) values(?,?,?,?,?)");
	
			System.out.println("poojjjaaaaa");
			ps.setInt(1, productCartPojo.getProduct_id());
			ps.setInt(2, productCartPojo.getQuantity());
			ps.setInt(3, productCartPojo.getPrice());
			ps.setString(4, productCartPojo.getUsername());
			
			ps.setInt(5, productCartPojo.getTotal_price());
			
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		
		return false;
	}

	@Override
	public List<Product_sub_categoryPojo> getAllSubCategory(String category_code) {
		// TODO Auto-generated method stub
		Connection  conn=null;
		PreparedStatement ps=null;
		
		try {
			
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_sub_category where category_code=?");
					
			ps.setString(1, category_code);
			
			ResultSet rs=ps.executeQuery();
			List<Product_sub_categoryPojo> listvalue=new ArrayList<Product_sub_categoryPojo>();
			while(rs.next())
			{
				Product_sub_categoryPojo productSubCategoryPojo=new Product_sub_categoryPojo(); 
				productSubCategoryPojo.setCategory_code(rs.getString("category_code"));
				productSubCategoryPojo.setSub_category_code(rs.getString("sub_category_code"));
				productSubCategoryPojo.setSub_category_desc(rs.getString("sub_category_desc"));
				productSubCategoryPojo.setType_code(rs.getString("type_code"));
				listvalue.add(productSubCategoryPojo);
				System.out.println("productSubCategoryP"+(rs.getString("sub_category_desc")));
				
				
			}
			return listvalue;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public List<ProductDetailsPojo> getAllProductDetailsPojoBySubCategory(
			String sub_category_code) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details where product_sub_category=?");
			//ps.setInt(1, 1);
			ps.setString(1, sub_category_code);
			ResultSet rs=ps.executeQuery();
			System.out.println("result"+ps);
			List<ProductDetailsPojo> listvalue=new ArrayList<ProductDetailsPojo>();
			while(rs.next())
			{
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo();
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_fabrics(rs.getString("Product_fabrics"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				listvalue.add(productDetailsPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public boolean deleteProductById(int productId) {
		// TODO Auto-generated method stub
		
		
		Connection  conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("delete from product_cart where id=?");
			
			ps.setInt(1, productId);
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public boolean addToView(ViewPojo viewPojo) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		try {
			conn=MyConnection.getConnectionObj();
			PreparedStatement ps=conn.prepareStatement("insert into view_table(product_id,user_name,date) values(?,?,curdate())");
	
			ps.setInt(1, viewPojo.getProduct_id());
			
			ps.setString(2, viewPojo.getUser_id());
			
			
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				System.out.println("iiiiiiiiiiiiiiiiiiiii");
				return true;
			}
			else
			{
				return false;
			}
			

		}catch (Exception e) {
		e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public List<ProductDetailsPojo> allProductOnPattern(String query) {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		
		try {
			List<ProductDetailsPojo> productList=new ArrayList<ProductDetailsPojo>();
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details WHERE  product_name or product_cat or product_color or product_des LIKE ? '%' ");
			ps.setString(1, query);
			ResultSet rs=ps.executeQuery();
			System.out.println("jjjjj"+ps);
			while(rs.next()){
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo();
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_fabrics(rs.getString("product_fabrics"));
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				
				
				System.out.println("nnnn"+rs.getString("product_name"));
				productList.add(productDetailsPojo);
			}
			return productList;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return null;
	}

	/*@Override
	public Map<String,List<Product_sub_categoryPojo>> getAllsubcategory() {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_sub_category");
			//ps.setInt(1, 1);
		
			ResultSet rs=ps.executeQuery();
			System.out.println("result"+ps);
			List<Product_sub_categoryPojo> listvalue=new ArrayList<Product_sub_categoryPojo>();
			while(rs.next())
			{
				Product_sub_categoryPojo subctegorycategoryPojo=new Product_sub_categoryPojo();
				subctegorycategoryPojo.setCategory_code(rs.getString("category_code"));
				subctegorycategoryPojo.setSub_category_code(rs.getString("sub_category_code"));
				subctegorycategoryPojo.setSub_category_desc(rs.getString("sub_category_desc"));
				subctegorycategoryPojo.setType_code(rs.getString("type_code"));
				
				
				listvalue.add(subctegorycategoryPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}*/

	@Override
	public Map<String,List<Product_sub_categoryPojo>> getAllsubcategory() {
		// TODO Auto-generated method stub
		
		Connection  conn=null;
		PreparedStatement ps=null,ps1=null;
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_category");
		
			Map<String, List<Product_sub_categoryPojo>> typeList=new HashMap<String,List<Product_sub_categoryPojo>>();
			ResultSet rs=ps.executeQuery();
			
			while(rs.next())
			{
				String code=rs.getString("code");
				System.out.println("code"+code);
				String description=rs.getString("description");
				
				System.out.println("typedescription"+description);
				ps1=conn.prepareStatement("select * from product_sub_category where category_code='"+code+"'");
				List<Product_sub_categoryPojo> subcategorylist=new ArrayList<Product_sub_categoryPojo>();
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					Product_sub_categoryPojo product_sub_categoryPojo=new Product_sub_categoryPojo();
					product_sub_categoryPojo.setCategory_code(rs1.getString("category_code"));
					product_sub_categoryPojo.setSub_category_code(rs1.getString("sub_category_code"));
					product_sub_categoryPojo.setSub_category_desc(rs1.getString("sub_category_desc"));
					product_sub_categoryPojo.setType_code(rs1.getString("type_code"));
					subcategorylist.add(product_sub_categoryPojo);
				}
				typeList.put(code, subcategorylist);
			}
			return typeList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public ProductCartPojo getDetails(int productid) {
		// TODO Auto-generated method stub
		
		Connection conn=null;
		PreparedStatement ps=null;
		
		
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_cart where product_id=?");
			
			
			
			ps.setInt(1, productid);
		
			
			ResultSet rs=ps.executeQuery();
			List<UserPojo> userlist=new ArrayList<UserPojo>();
			while(rs.next())
			{
				ProductCartPojo ProductCartPojo=new ProductCartPojo();
				ProductCartPojo.setPrice(rs.getInt("price"));
				ProductCartPojo.setProduct_id(rs.getInt("product_id"));
				ProductCartPojo.setQuantity(rs.getInt("quantity"));
				ProductCartPojo.setTotal_price(rs.getInt("total_price"));
				
				
				return ProductCartPojo;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return null;
	}

	@Override
	public boolean deleteProductByProductId(int productId) {
		// TODO Auto-generated method stub
		Connection  conn=null;
		PreparedStatement ps=null;
		
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("delete from product_cart where product_id=?");
			
			ps.setInt(1, productId);
			
			int i=ps.executeUpdate();
			
			if(i>0)
			{
				return true;
			}
			else
			{
				return false;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return false;
	}

	@Override
	public List<ProductDetailsPojo> getAllProductByApriori(int pid) {
		// TODO Auto-generated method stub
		
		System.out.println("getAllProductByApriori...............");
		
		Connection  conn=null;
		PreparedStatement ps=null;
		try {
			
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details where product_id in(select product_id from transctionline_table where transction_id in(select distinct transction_id from transctionline_table where product_id=?) ) and product_id!=?");
		ps.setInt(1, pid);
		ps.setInt(2, pid);	
			ResultSet rs=ps.executeQuery();
			List<ProductDetailsPojo> listvalue=new ArrayList<ProductDetailsPojo>();
			while(rs.next())
			{
				ProductDetailsPojo productDetailsPojo=new ProductDetailsPojo();
				productDetailsPojo.setProduct_id(rs.getInt("product_id"));
				System.out.println("rs.getIntproduct_id)"+rs.getInt("product_id"));
				productDetailsPojo.setProduct_name(rs.getString("product_name"));
				productDetailsPojo.setProduct_des(rs.getString("product_des"));
				productDetailsPojo.setProduct_price(rs.getInt("product_price"));
				productDetailsPojo.setProduct_cat(rs.getString("product_cat"));
				productDetailsPojo.setProduct_size(rs.getString("Product_size"));
				productDetailsPojo.setProduct_fabrics(rs.getString("Product_fabrics"));
				productDetailsPojo.setProduct_material(rs.getString("product_material"));
				productDetailsPojo.setProduct_color(rs.getString("product_color"));
				productDetailsPojo.setCategory_code(rs.getString("category_code"));
				productDetailsPojo.setProduct_path(rs.getString("product_path"));
				productDetailsPojo.setProduct_sub_category(rs.getString("product_sub_category"));
				listvalue.add(productDetailsPojo);
				
			}
			return listvalue;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<TransctionLinePojo> getAllDistinctProduct() {
		// TODO Auto-generated method stub
		
		System.out.println("getAllDistinctProduct............");
		Connection  conn=null;
		PreparedStatement ps=null;
		PreparedStatement ps1=null;
		//int product_id=0;
		System.out.println("...............");
		try {
			conn=MyConnection.getConnectionObj();
			System.out.println("befor");
			ps=conn.prepareStatement("select distinct product_id from transctionline_table");
			System.out.println("after");
			
			ResultSet rs=ps.executeQuery();
			System.out.println("ps,,,,,,,,"+rs);
			List<TransctionLinePojo> productList=new ArrayList<TransctionLinePojo>();
			while(rs.next())
			{
				System.out.println("in rs..............");
				TransctionLinePojo transctionLinePojo=new TransctionLinePojo();
				transctionLinePojo.setProduct_id(rs.getInt("product_id"));
				System.out.println(rs.getInt("product_id"));
				transctionLinePojo.setPrize(rs.getInt("prize"));
				int product_id=rs.getInt("product_id");
				System.out.println("product_id......"+product_id);
				ps1=conn.prepareStatement("SELECT count( * ) as transction_id FROM transctionline_table WHERE product_id =?");
				ps1.setInt(1,product_id);
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next())
				{
					transctionLinePojo.setTransction_id(rs1.getInt("transction_id"));
				}
				
				productList.add(transctionLinePojo);
				
			}
			return productList;
		} catch (Exception e) {
		}
		
		
		
		
		return null;

		
	}

	@Override
	public ProductCartPojo getdata(int productid) {
		Connection conn=null;
		PreparedStatement ps=null;
		
		
		try {
			conn=MyConnection.getConnectionObj();
			ps=conn.prepareStatement("select * from product_details where product_id=?");
			
			
			
			ps.setInt(1, productid);
		
			
			ResultSet rs=ps.executeQuery();
			List<UserPojo> userlist=new ArrayList<UserPojo>();
			while(rs.next())
			{
				ProductCartPojo ProductCartPojo=new ProductCartPojo();
				ProductCartPojo.setPrice(rs.getInt("product_price"));
				
				
				
				return ProductCartPojo;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	
}
