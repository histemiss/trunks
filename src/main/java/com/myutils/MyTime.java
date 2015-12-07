package com.myutils;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MyTime {
	public static String getUniqName() {
		LocalDateTime ts = LocalDateTime.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuuMMddHHmmssnnnnnnnnn");
    	return ts.format(formatter);
	}
}
