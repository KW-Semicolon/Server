<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%
	BufferedReader reader = null;
	String data = null;
	String date = null;
	String time = null;
	
	try{
		
		File bp_file = new File("C:/Users/lamly/Desktop/txt/bp.txt");
		File heart_file = new File("C:/Users/lamly/Desktop/txt/heart.txt");
		File resp_file = new File("C:/Users/lamly/Desktop/txt/resp.txt");
		
		long lastModified = bp_file.lastModified();//The time the bp.txt file was created
		String pattern1 = "yyyy-MM-dd";
		SimpleDateFormat simpleDateFormat1 = new SimpleDateFormat(pattern1);
		Date lastModifiedDate = new Date( lastModified );
		date = new String(simpleDateFormat1.format( lastModifiedDate ));
		
		String pattern2 = "HH:mm";
		SimpleDateFormat simpleDateFormat2 = new SimpleDateFormat(pattern2);
		Date lastModifiedDate2 = new Date( lastModified );
		time = new String(simpleDateFormat2.format( lastModifiedDate2 ));
		
		String bp_filePath = "C:/Users/lamly/Desktop/txt/bp.txt";
		FileInputStream bp_fileStream = null;
		bp_fileStream = new FileInputStream( bp_filePath );
		byte[ ] bp_readBuffer = new byte[bp_fileStream.available()];
		bp_fileStream.read(bp_readBuffer);
        //bp.txt(혈압값 출력데이터 추출)
        
        String heart_filePath = "C:/Users/lamly/Desktop/txt/heart.txt";
		FileInputStream heart_fileStream = null;
		heart_fileStream = new FileInputStream( heart_filePath );
		byte[ ] heart_readBuffer = new byte[heart_fileStream.available()];
		heart_fileStream.read(heart_readBuffer);
        //heart.txt(심박값 출력데이터 추출)
        
        String resp_filePath = "C:/Users/lamly/Desktop/txt/resp.txt";
		FileInputStream resp_fileStream = null;
		resp_fileStream = new FileInputStream( resp_filePath );
		byte[ ] resp_readBuffer = new byte[resp_fileStream.available()];
		resp_fileStream.read(resp_readBuffer);
        //resp.txt(호흡값 출력데이터 추출)
        
        
        data = date + ", "+ time+ ", "+ new String(bp_readBuffer)+", "+ new String(heart_readBuffer)+", "+ new String(resp_readBuffer);
        //data :  웹서버로 전송할 시간+혈압값+심박수+호흡수 데이터
        //", " 을 기준으로 안드로이드 클라이언트에서 파싱 기준값으로 사용
        
        out.println(data);//웹 출력
        
        bp_fileStream.close(); //bp.txt 스트림 닫기
        heart_fileStream.close(); //heart.txt 스트림 닫기
        resp_fileStream.close(); //resp.txt 스트림 닫기
        
        /* bp_file.delete();
        heart_file.delete();
        resp_file.delete();  */
        //파일의 유무로 안드로이드 클라이언트에서 결과값의 저장여부를 결정
	}
	catch(FileNotFoundException fnfe){
		//out.println("Error");
		System.out.println("Error : File does not exist");
	}
	catch(IOException ioe){
		System.out.println("Error : The file cannot be read");
	}
	finally{
		try{
			reader.close(); //파일닫기
		}catch(Exception e){
			
		}
	}
	
	//요청방식을 가져온다.
	String method = request.getMethod();
	System.out.println("요청방식 : " + method);//서버 요청 확인을 위한 시스템 출력문
	request.setCharacterEncoding("utf-8");
%>
