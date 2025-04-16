package com.beauty.skincare.dao;

import com.beauty.skincare.model.Product;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;
import java.util.List;

public class ProductDAO {

    EntityManager em;

    public ProductDAO() {
        em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
    }

    public void insertProduct(String pName, double pPrice, String pDesc, int stock, String category, byte[] imageBytes) {
        em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        Product p = new Product();
        p.setName(pName);
        p.setPrice(pPrice);
        p.setDescription(pDesc);
        p.setStock(stock);
        p.setCategory(category);
        p.setImage(imageBytes);

        em.getTransaction().begin();
        em.persist(p);
        em.getTransaction().commit();
        em.close();
    }
    
    public Product getProductByID(int id)
    {
        em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        Product p= em.find(Product.class, id);
        em.close();
        return p;
    }

    public List<Product> getAllProducts() {
        em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
        List<Product> list= em.createQuery("SELECT p from Product p ",Product.class).getResultList();
        em.close();
        return list;
        
    }

    public boolean removeProduct(int id) {
           em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
     
        try
        {
        Product p=em.find(Product.class, id);
        em.getTransaction().begin();
        em.remove(p);
        em.getTransaction().commit();
        em.close();
        return true;
        }
        catch(Exception e)
        {
            em.close();
            return false;
        }
          
    }

    public void updateProduct(int id, String pName, double pPrice, String pDesc, int stock, String category, byte[] imageBytes) {
      em = Persistence.createEntityManagerFactory("beauty_skincare_PU").createEntityManager();
      
        Product p = em.find(Product.class, id);
    
    if (p != null) {
        em.getTransaction().begin();

        p.setName(pName);
        p.setPrice(pPrice);
        p.setDescription(pDesc);
        p.setStock(stock);
        p.setCategory(category);

        if (imageBytes != null) {
            p.setImage(imageBytes);
        }

        em.getTransaction().commit();
        em.close();
    }
}

}
