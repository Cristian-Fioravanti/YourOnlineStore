package it.yourstore.store.dto;

import lombok.Setter;
import lombok.Getter;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.Collection;
import javax.validation.constraints.NotNull;

/**
 * Data transfer object for edit a data element of type Product
 */
@Getter
@Setter
@EqualsAndHashCode(callSuper = false)
public class EditProductDto extends BaseDto {

	// Generated SERIAL VERSION UID
	private static final long serialVersionUID = 3964889677L;

	private String objectKey;

	@NotNull(message = "ID: it cannot be null")
	private Integer productId;

	private Collection<EditOrderItemDto> theOrderItem;

}
