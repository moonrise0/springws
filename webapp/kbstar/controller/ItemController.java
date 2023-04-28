package com.kbstar.controller;


import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import java.util.List;



@Controller
@RequestMapping("/item")
public class ItemController {
    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());

 @Autowired
    ItemService service;

    String dir = "item/";
    //127.0.0.1/item 하면 밑에게 호출.
   @RequestMapping("")
    public String main(Model model){
       model.addAttribute("left", dir+"left");
       model.addAttribute("center", dir+"center");
       return "index";
    }

    @RequestMapping("/add")
    public String add(Model model){
        model.addAttribute("left", dir+"left");
        model.addAttribute("center", dir+"add");
        return "index";
    }



    @RequestMapping("/all")
    public String all(Model model) {
        List<Item> list = null;
        try {
            list = service.getall();
            for(Item obj:list){
                logger.info(obj.toString());
            }

        } catch (Exception e) {
            logger.info("시스템 장애입니다.");
            e.printStackTrace();
        }
        model.addAttribute("allItem", list);
        model.addAttribute("left", dir + "left");
        model.addAttribute("center", dir + "all");
        return "index";
    }


    }



//
//        list.add(new Item(100,"pants1",1000,"a.jpg",SYSDATE));
//        list.add(new Item(101,"pants2",2000,"b.jpg",SYSDATE));
//        list.add(new Item(102,"pants3",3000,"c.jpg",SYSDATE));
//        list.add(new Item(103,"pants4",4000,"d.jpg",SYSDATE));
//        list.add(new Item(104,"pants5",5000,"e.jpg",SYSDATE));