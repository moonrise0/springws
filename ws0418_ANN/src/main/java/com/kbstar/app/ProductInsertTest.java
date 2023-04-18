package com.kbstar.app;


import com.kbstar.dto.ProductDTO;
import com.kbstar.frame.MyService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ProductInsertTest {

    public static void main(String[] args) {
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        MyService<String, ProductDTO> service =
                (MyService<String, ProductDTO>) factory.getBean("uservice");

        ProductDTO u = new ProductDTO("id01", 40, 50, "lee");
        service.register(u);


    }
}
