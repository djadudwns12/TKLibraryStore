package com.tn.admin.utils;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Base64;
import java.util.Calendar;

import javax.imageio.ImageIO;

import java.lang.*; //생략 (java.lang 패키지는 기본 패키지이다)

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Mode;
import org.springframework.http.converter.BufferedImageHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.tn.admin.model.vo.BoardUpFileVODTO;


@Component		
public class FileProcess {
	
	// 회원가입시 업로드된 유저 프로필 이미지를 저장하는 메서드
	public void saveUserProfileFile(byte[] upfile, String realPath, String fileName) throws IOException {
		File saveFile = new File(realPath + File.separator + fileName);
		FileUtils.writeByteArrayToFile(saveFile, upfile);
	}
	
	// file을 realPath에 저장하는 메서드
	public BoardUpFileVODTO saveFileToRealPath(byte[] upfile, String realPath, String contentType, String originalFileName, long fileSize) throws IOException {
		
		BoardUpFileVODTO result = null;
		
		//파일이 실제 저장되는 경로 realPath + "/년/월/일" 경로
		//String[] ymd = makeCalendarPath(realPath);
		//makeDirectory(realPath,ymd);
		
		String saveFilePath = realPath;
		makeDirectory(realPath);
		
		String newFileName = null;
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		
		if(fileSize > 0) {
			// 중복된게 있을시에는 true 반환 -> renameFileName
			// 중복된게 없을 시에는 그대로
			if(checkFileExist(saveFilePath, originalFileName)){
				newFileName = renameFileName(originalFileName);
			}else {
				newFileName = originalFileName;
			}
			
			File saveFile = new File(saveFilePath + File.separator + newFileName);
			FileUtils.writeByteArrayToFile(saveFile, upfile);			//실제 파일 저장
			
			//이미지 파일임 -> 썸네일 이미지, base64문자열을 만들고 이미지와 함께 저장해야 한다.
			//책 이미지를 base64로 인코딩하지 못할시 썸네일 이미지도 생성해야한다 miniproject의 FileProcess참고
			//String thumbImgName = makeTumbNailImage(saveFilePath, newFileName);
				
				//base64 문자열로 encoding
				//이진수(binary) 데이터를 Text로 바꾸는 인코딩의 하나로써 
				//이진수 데이터를 ASCII(아스키코드) 영역의 문자로만 이루어진 문자열로 바꾸는 인코딩 방식이다.
				//장점 : 파일을 별도로 저장할 공간이 필요하지 않다. 
				//단점 : 파일을 저장하는 것보다 크기가 더 크다
				//		 인코딩 디코딩에 따른 부하가 걸린다.
				//숙제 : base64Str로 인코딩한 문자열을 다시 디코딩해보기
				
				//용량이 큰 이미지는 문자열로 만들지 못한다 -> 썸네일 이미지만 base64로 처리할것
				String base64Str = makeBase64String(saveFilePath + File.separator + newFileName);
				System.out.println("=========================================================");
				System.out.println(new StringBuffer(base64Str));
				System.out.println("=========================================================");
				
				result = BoardUpFileVODTO.builder()
						
						.fileName(newFileName)
						.base64Img(base64Str)
						.build();
				
				System.out.println(result.toString());
			
		}
		
		//저장된 파일의 정보를 담은 객체
		return result;
	}

	private void makeDirectory(String realPath) {
		if (!new File(realPath).exists()) {
				
				File tmp = new File(realPath); 
					tmp.mkdir();
				
			}
		}

	
		
	

	private String makeBase64String(String thumbNailFileName) throws IOException {
		String result = null;
		
		// 썸네일 파일의 경로로 File 객체 생성
		File thumb = new File(thumbNailFileName);
		// File 객체가 가리키는 파일을 읽어와 byte[]로
		byte[] upfile =  FileUtils.readFileToByteArray(thumb);
		// 인코딩
		result = Base64.getEncoder().encodeToString(upfile);

		return result;
	}


	// 파일 이름 바꾸는 메서드
	// 예 : originalFileName_timestamp.확장자
	private String renameFileName(String originalFileName) {

		String timestamp = System.currentTimeMillis() + "";
		// originalFileName.lastIndexOf(".") : .의 위치를 int 반환
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		String fileNameWithOutExt = originalFileName.substring(0, originalFileName.lastIndexOf("."));

		String newFileName = fileNameWithOutExt + "_" + timestamp + "." + ext;

		System.out.println("기존 파일 이름 : " + originalFileName);
		System.out.println("새로운 파일 이름 : " + newFileName);

		return newFileName;
	}

	// originalFileName이 saveFilePath에 존재 하는지 안하는지..(파일 중복 여부)
	// 중복된 파일이 있다면 true, 없다면 false
	private boolean checkFileExist(String saveFilePath, String originalFileName) {
		File tmp = new File(saveFilePath);

		boolean isFind = false;

		for (String name : tmp.list()) {
			if (name.equals(originalFileName)) {
				System.out.println("이름이 같은게 있다");
				isFind = true;
				break;
			}
		}

		if (!isFind) {
			System.out.println("이름이 같은 파일이 없는 상태");
		}

		return isFind;
	}




}
