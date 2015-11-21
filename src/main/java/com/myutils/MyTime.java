package com.myutils;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MyTime {
	public static String getUniqName() {
		LocalDateTime ts = LocalDateTime.now();
    	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("uuuuMMddHHmmssnnnnnnnnn");
    	return ts.format(formatter);
	}
	
	public static void main(String[] args) {
		Path path = Paths.get("c:/a/b/c");
		System.out.println(path.getFileName().toString());
	}
}
