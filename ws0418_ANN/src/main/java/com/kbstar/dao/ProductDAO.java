package com.kbstar.dao;

import com.kbstar.dto.ProductDTO;

import com.kbstar.frame.MyDao;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;


@Repository("udao")
public class ProductDAO implements MyDao<String, ProductDTO>{

    @Override
    public void insert(ProductDTO productDTO) {
        System.out.println("Inserted Oracle:"+ productDTO);
    }

    @Override
    public void delete(String s) {
        System.out.println("deleted Oracle:"+ s);
    }

    @Override
    public void update(ProductDTO productDTO) {
        System.out.println("Updated Oracle:"+ productDTO);
    }

    @Override
    public ProductDTO select(String s) {
        ProductDTO product = null;
       product = new ProductDTO(s, 250,25, "이말숙");
       return product;

    }

    @Override
    public List<ProductDTO> select() {
      List<ProductDTO> list = new ArrayList<>();
        list.add(new ProductDTO( "id01", 250,25, "이말숙"));
        list.add(new ProductDTO( "id02", 210,20, "이고"));
        list.add(new ProductDTO( "id03", 220,27, "아길"));
      return list;
    }
}
