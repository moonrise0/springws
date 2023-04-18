package com.kbstar.dao;

import com.kbstar.dto.ProductDTO;
import com.kbstar.frame.MyDao;

import java.util.List;

public class ProductMySQLDAO implements MyDao<String, ProductDTO> {
    @Override
    public void insert(ProductDTO productDTO) {
        System.out.println("MySQL Inserted:"+productDTO);
    }

    @Override
    public void delete(String s) {

    }

    @Override
    public void update(ProductDTO productDTO) {

    }

    @Override
    public ProductDTO select(String s) {
        return null;
    }

    @Override
    public List<ProductDTO> select() {
        return null;
    }
}
