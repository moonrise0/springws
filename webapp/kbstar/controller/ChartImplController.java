package com.kbstar.controller;



import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Random;

@RestController
public class ChartImplController {
    @RequestMapping("/chart02")
    public Object chart02(){

        JSONObject jo = new JSONObject();


        JSONArray jaCnt = new JSONArray();
        for(int i=1; i<=12 ; i++) {
            Random r = new Random();
            int cnt = r.nextInt(10000)+1;
            jaCnt.add(cnt);
        }

        JSONArray jaYear = new JSONArray();
        for(int i=2011; i<=2023; i++){
            jaYear.add(i);
        }

        jo.put("category",jaYear);
        jo.put("datas",jaCnt);
        //{'category':[], 'datas':[]}
        return jo;
    }
    @RequestMapping("/chart0301")
    public Object chart0301() {
        JSONArray ja = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random r = new Random();
            int num = r.nextInt(20) + 1;
            JSONArray jadate = new JSONArray();
            jadate.add("data" + num);
            jadate.add(num);
            ja.add(jadate);

        }


        return ja;
    }

    @RequestMapping("/chart0302")
    public Object chart0302() {
        JSONArray ka = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random r = new Random();
            int num = r.nextInt(20) + 1;
            JSONArray kadate = new JSONArray();
            kadate.add("data" + num);
            kadate.add(num);
            ka.add(kadate);

        }


        return ka;
    }

    @RequestMapping("/chart0303")
    public Object chart0303() {
        JSONArray wa = new JSONArray();
        for (int i = 1; i <= 5; i++) {
            Random r = new Random();
            int num = r.nextInt(20) + 1;
            JSONArray wadate = new JSONArray();
            wadate.add("data" + num);
            wadate.add(num);
            wa.add(wadate);

        }


        return wa;
    }

}
