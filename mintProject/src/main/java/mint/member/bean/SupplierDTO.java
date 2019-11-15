package mint.member.bean;

import java.util.Date;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
@Component
public class SupplierDTO {
	private String supplierCode; 
	private String supplierId; 
	private String category; 
	private String tel; 
	private String addr1; 
	private String addr2; 
	private String description; 
	private int status; 
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy.MM.dd")
	private Date logtime;
}
