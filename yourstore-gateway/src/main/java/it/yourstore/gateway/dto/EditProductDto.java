package it.yourstore.gateway.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * Data transfer object for edit a data element of type Product
 */
@Getter
@Setter
public class EditProductDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 1979943612L;

	private Integer productId;

	@Size(max = 80)
	private String productName;

	private Integer cost;

	private Integer disponibility;

	@Size(max = 80)
	private String description;

	@Size(max = 80)
	private String image;

}
