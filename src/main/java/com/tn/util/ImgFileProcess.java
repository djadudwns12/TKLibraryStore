package com.tn.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.util.Base64;
// import java.lang.*;  // 생략  (java.lang 패키지는 기본 패키지이다)

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Mode;
import org.springframework.stereotype.Component;

import com.tn.member.model.vo.ImgFileVODTO;

@Component
public class ImgFileProcess{
	


	public ImgFileVODTO saveFileToRealPath(byte[] upfile, String realPath, String userId, String originalFileName) throws IOException {
		ImgFileVODTO result = null;
		System.out.println(realPath);
		String newFileName = null;
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
		newFileName = userId + "." + ext;
		File saveFile = new File(realPath + File.separator + newFileName);
		System.out.println(saveFile);
		
		FileUtils.writeByteArrayToFile(saveFile, upfile); //저장경로(파일명포함), 실제 파일의 데이터
		
		String base64Str = makeBase64String(saveFile, ext);

		result = ImgFileVODTO.builder()
						.newFileName(realPath + File.separator + newFileName)
						.base64Img(base64Str)
						.build();
				
				System.out.println(result.toString());
				
		
		return  result;   
	}
	
	private String makeBase64String(File saveFile, String ext) throws IOException {
		
		
		String result = null;
		
		BufferedImage originalImage = ImageIO.read(saveFile);
		
		BufferedImage thumbNailImage = Scalr.resize(originalImage, Mode.FIT_TO_HEIGHT, 50);  
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		
		ImageIO.write(thumbNailImage, ext, baos); // (저장하거나 처리하려는 이미지 객체, 확장자,  출력 스트림입니다. 여기서는 이미지 데이터를 메모리에 저장)
		
		byte[] imageBytes = baos.toByteArray();
		
		
		result = Base64.getEncoder().encodeToString(imageBytes); // 인코딩
		
		
		return result;
	}

	
	
}
