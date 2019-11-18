package mint.product.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ProductDTO {
	// 상품코드
	private int productCode;
	// 대분류
	private int mainCategory;
	// 소분류
	private int subCategory;
	// 사업자 아이디
	private String supplierId;
	// 재고/수량
	private int stock;
	// 큰제목
	private String mainSubject;
	// 소제목
	private String subSubject;
	// 상품 대표 이미지 (파일첨부/미리보기)
	private String thumbnail;
	// 가격
	private int price;
	// 판매단위
	private String unit;
	// 중량/용량
	private String weight;
	// 포장타입
	private String packageType;
	// 안내사항
	private String information;
	// 상품설명 (summernote)
	private String description;
	// 상품이미지 (파일첨부/미리보기)
	private String productImage;
	// 상세정보 (summernote)
	private String details;
	// 상품 판매상황 0:판매중 1:판매중지
	private int productStatus;
	// 상품 추천수 => 별점
	private int star;
	// 할인률
	private int discountRate;
}
