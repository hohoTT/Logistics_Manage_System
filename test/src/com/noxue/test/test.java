package com.noxue.test;

import net.sf.json.JSONObject;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		JSONObject json = new JSONObject();
		JSONObject jsons = new JSONObject();
		
		json.put("id", 1);
		json.put("user", "admin");
		json.put("msg", "你好你好大家好");

		jsons.put("m", json);
		jsons.put("m1", json);
		System.out.println(jsons.toString());
		
	}

}
