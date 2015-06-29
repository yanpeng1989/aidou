/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.aidou.tool;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class Test {

    public static int add(int a, int b) {
        return a + b;
    }

    public static void main(String[] args) {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmm");
        String dateString = formatter.format(currentTime);
        System.out.println(dateString);
    }

}
